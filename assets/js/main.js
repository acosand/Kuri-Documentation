---
---
//= require jquery3
//= require popper
//= require bootstrap

$(document).ready(function(){
   $('[data-toggle="offcanvas"]').click(function(){
       $("#navigation").toggleClass("hidden-xs");
   });
});
