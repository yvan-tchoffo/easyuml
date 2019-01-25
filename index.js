var session = require('express-session');
var db = require('./db/db.js');
var express = require('express');
var login = require('./login.js');
var app = express();
var upload = multer();
var logout = require('./logout.js');
var bodyParser = require('body-parser');
var multer = require('multer');
var signup = require('./signup.js');


app.set('view engine', 'pug');
app.set('views','./views');
app.use(express.static('public'));
app.use('/scripts', express.static('node_modules'));
app.use(session({
    name:"cookie",
    secret: "@easyumlsessionkey",
    resave: true,
    saveUninitialized: true,

}));
app.use('/login',login);
app.use('/signup',signup);
app.use('/logout',logout);
app.use(bodyParser.json()); 
app.use(bodyParser.urlencoded({ extended: true })); 
app.use(upload.array()); 

function checkSignIn(req, res,next){
    if(req.session.user){
       next();     //If session exists, proceed to page
    } else {

        res.redirect('/login');
    }
 }
app.get('/',checkSignIn,function(req,res,next){
    data = db.query("select * from diagramme where user_id = ?",[req.session.user.id],function(err,rows,fields){
        res.render('app/dashboard',{data: rows, user:req.session.user});
    });
    
});

app.get('/signup',function(req,res,next){
    res.redirect('/signup');
});

app.post('/save',checkSignIn,function(req,res,next){
    id = req.session.user.id;
    if(req.body.newdia != -1){
        db.query("update diagramme set content = ? where id = ? ",[req.body.data,req.session.diagramme],function(err,result,next){
            if(err)
                res.send(err);
            res.send("ok");
        })
    }else{
        db.query("select * from diagramme where nom = ? and user_id = ?",[req.body.name,id],function(err,rows,next){
            if(rows.length){
                res.send("double");
            }
            else{
                db.query("insert into diagramme(nom,date,user_id,content) values (?,now(),?,?)",[req.body.name,id,req.body.data],function(err,result,next){
                    if(err)
                        res.send(err);
                    else
                        res.send({id :result.insertId});
                });
            }
                
        });
    }
})

app.get('/add',checkSignIn,function(req,res,next){
    res.render("app/paperwork",{newdia:-1,data:-1, user:req.session.user});
});

app.post('/delete',checkSignIn,function(req,res,next){
    db.query("delete from diagramme where id = ?",[req.body.data],function(err,result,next){
        if(err)
            res.send("false");
        else
            res.send("ok");
    })
});

app.get('/open/:id',checkSignIn,function(req,res,next){
    db.query("select * from diagramme where id=?",[req.params.id],function(err,rows,fields){
        req.session.diagramme = req.params.id;
        res.render("app/paperwork",{newdia:0, data:JSON.stringify(rows[0].content), user:req.session.user});
    });
});

app.listen(3000);
