//**importations
var express = require('express');
var router = express.Router();
var db = require('./db/db.js');
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer();

//**ici on  declare qu'on va utiliser les importations bodyParser er upload

router.use(bodyParser.json()); 
router.use(bodyParser.urlencoded({ extended: true })); 
router.use(upload.array()); 

router.get('/',function(req,res,next){
    if(req.session.user){
        res.redirect('../');
    }else{
        res.render("signup/index",{data:""});
    }
});
router.post('/',function(req,res,next){
    if(req.body.pwd != req.body.pwd2){
        res.render("signup/index",{msg:"Les mots de passe doivent être identiques",data:req.body})
    }
    db.query("SELECT * FROM user WHERE login=?",[req.body.login],function(err,rows,fields){
        if(rows.length){
            res.render("signup/index",{msg:"Ce nom d'utilisateur existe deja",data:req.body})
        }else{
            db.query("insert into user (nom,prenom,mail,pwd,login) values(?,?,?,?,?)",[req.body.nom,req.body.prenom,req.body.mail,req.body.pwd,req.body.login],function(err,result,fiels){
                if(err)
                console.log(err);
                else{
                    req.session.user=req.body;
                    req.session.user.id=result.insertId;
                    res.redirect('/');
                }
            })
        }
        
    })
});
module.exports = router;
