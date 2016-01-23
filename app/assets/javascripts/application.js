// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

  $(".article").click(function(){
    $(this).find(".expand").toggle();
    $(this).find(".click").toggle();
    $(this).find(".time").toggleClass("time-right")
  })

  $(".story").click(function(){
    $(this).find(".expand").toggle();
    $(this).find(".click").toggle();
    $(this).find(".time").toggleClass("time-right")
  })

  $("img[src='']").remove();

  $(document).ready(function() {
      var quotes = new Array("welcome to my snoop bloggy blog", "get rich or die blogging", "bloggy style. blah-blah-bloggy style.", "live free or blog hard", "eat. blog. repeat.", "it's a blog off.", "bloggers too can't not die in a freak gasoline fight accident.", "the blogs are in the computer.", "i love blog. bloggy blog blog. here it goes, down into my belly.", "wait. you changed your name, to McBloggin?", "blog. james blog.", "you like blogs? how you like them blogs.", "where we are going, we don't need blogs.", "rule #76: no excuses. blog like a champion", "not my blog. not hermione's blog. yours, harry."),
      randno = quotes[Math.floor( Math.random() * quotes.length )];
      $('.quote').text( randno );
  });


});
