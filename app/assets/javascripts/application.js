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

  $(".article-story").find(".time-right").hide();
  $(".article").find(".time-right").hide();

  // $(".behind-image").hide();

  $(".article").click(function(){
    $(this).find(".expand").show();
    $(this).find(".click").show();
    $(this).find(".time").hide()
    $(this).find(".time-right").show();
    $(this).find(".click").hide();
  })

  // $(".article-container").click(function(){
  //   $(this).find(".article-image").hide();
  //   $(this).find(".article").show();
  // });



  $(".article-story").click(function(){
    $(this).find(".expand").show();
    $(this).find(".click").hide();
    $(this).find(".time").css("float", "right");
  })

  $("img[src='']").remove();



  // var quotes = new Array("welcome to my snoop bloggy blog.", "get rich or die blogging.", "bloggy style. bla-bla-bloggy style.", "eat. read. repeat.", "it's a blog off.", "bloggers too can't not die in a freak gasoline fight accident.", "the blogs are in the computer.", "blog. james blog.", "rule #76: no excuses. blog like a champion.","if you don't know, now you know.", "like a deep breath, in news form.", "saving the world, one unread blog post at a time.", "content delivered on time, or it's free!", "ALL LIES MATTER."),
  // randno = quotes[Math.floor( Math.random() * quotes.length )];
  // $('.quote').text( randno );
  // $("#dice-pic").click(function(){
  //   (quotes), randno = quotes[Math.floor( Math.random() * quotes.length )];
  //   $('.quote').text( randno );
  // });


});
