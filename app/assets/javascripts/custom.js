/* global $ */

//投稿写真のプレビュー
$(function(){
  $("#preview").on("change", function(){
    let selectedFile = this.files[0];
    let fileReader = new FileReader();
    
    fileReader.onload = function(e){
      $(".preview_image").attr("src", e.target.result);
    };
    
    fileReader.readAsDataURL(selectedFile);
  });
});

//アイコン画像のプレビュー
$(function(){
  $("#preview_icon").on("change", function(){
    let selectedIcon = this.files[0];
    let fileReader = new FileReader();
    
    fileReader.onload = function(e){
      $(".user-icon").attr("src", e.target.result);
    };
    
    fileReader.readAsDataURL(selectedIcon);
  });
});
  