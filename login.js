var express = require('express');
var router = express.Router();
var db = require('./db/db.js');
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer();


router.use(bodyParser.json()); 
router.use(bodyParser.urlencoded({ extended: true })); 
router.use(upload.array()); 

router.get('/',function(req,res,next){
    if(req.session.user){
        res.redirect('../');
    }else{
        res.render("connection/index",{msg:""});
        next();
    }
});

router.post('/',function(req,res,next){
    db.query("select * from user where login =  ? and pwd = ?",[req.body.login,req.body.password],function(err,rows,fields){
        if(rows.length){
            req.session.user = rows[0];
            res.redirect('/');
        }else{
            res.render("connection/index",{msg:"Nom d'utilisateur ou mot de passe incorrecte"})
        }
        
    });

});

module.exports = router;