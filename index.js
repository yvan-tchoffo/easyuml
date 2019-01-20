var express = require('express');
var app = express();
var db = require('./db/db.js');
var session = require('express-session');
var login = require('./login.js');
var signup = require('./signup.js');
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer();

app.set('view engine', 'pug');
app.set('views','./views');
app.use(express.static('public'));
app.use(session({secret: "@easyumlsessionkey"}));
app.use('/login',login);
app.use('/signup',signup);
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
        res.render('app/dashboard',{data: rows});
    });
    
});

app.get('/signup',function(req,res,next){
    res.redirect('/signup');
});

app.post('/save',function(req,res,next){
    id = req.session.user.id;
    console.log(id);
    if(req.body.newdia != -1){
        db.query("update diagramme set content = ? where id = ? ",[req.body.data,req.session.diagramme],function(err,result,next){
            res.send("ok");
        })
    }else{
        db.query("select * from diagramme where nom = ?",[req.body.name],function(err,rows,next){
            if(rows.length)
                res.send("double");
        });
        db.query("insert into diagramme(nom,date,user_id,content) values (?,now(),?,?)",[req.body.name,id,req.body.data],function(err,result,next){
            if(err)
                res.send(err);
            else
                res.send("ok");
        });
    }
})

app.get('/add',function(req,res,next){
    res.render("app/paperwork",{newdia:-1,data:-1});
});

app.post('/delete',function(req,res,next){
    db.query("delete from diagramme where id = ?",[req.body.data],function(err,result,next){
        if(err)
            res.send("false");
        else
            res.send("ok");
    })
});

app.get('/open/:id',function(req,res,next){
    db.query("select * from diagramme where id=?",[req.params.id],function(err,rows,fields){
        req.session.diagramme = req.params.id;
        res.render("app/paperwork",{newdia:0, data:JSON.stringify(rows[0].content)});
    });
})


app.listen(3000);