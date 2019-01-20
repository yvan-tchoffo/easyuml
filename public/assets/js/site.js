/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function goback(){
    $(".goback").click(function($e){
        $e.preventDefault();
        window.history.back();
    });
    
    $(".revealpwd").click(function($e){
        var x = $(this).parent().parent().find(".pwd");
        for (var i = 0; i!=x.length; i++ ){
            if(x[i].type === "password"){
                x[i].type="text";
            }else{
                x[i].type="password";
            }
        }
    })
    
    
}
window.addEventListener("load",goback);
