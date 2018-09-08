$(function() {
  $('#main_image_uploader').change(function(e){
    //console.log(e)
    var file = e.target.files[0],
    reader = new FileReader()

    reader.onload = (function(file){
      return function(e){
        $("#img-main").attr("src", e.target.result);
        $("#img-main").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function() {
  $('#sub_image_uploader1').change(function(e){
    console.log(e)
    var file = e.target.files[0],
    reader = new FileReader()

    reader.onload = (function(file){
      return function(e){
        $("#img-sub1").attr("src", e.target.result);
        $("#img-sub1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function() {
  $('#sub_image_uploader2').change(function(e){
    console.log(e)
    var file = e.target.files[0],
    reader = new FileReader()

    reader.onload = (function(file){
      return function(e){
        $("#img-sub2").attr("src", e.target.result);
        $("#img-sub2").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function() {
  $('#sub_image_uploader3').change(function(e){
    console.log(e)
    var file = e.target.files[0],
    reader = new FileReader()

    reader.onload = (function(file){
      return function(e){
        $("#img-sub3").attr("src", e.target.result);
        $("#img-sub3").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
