$(function(){altair_form_file_upload.init()}),altair_form_file_upload={init:function(){var t=$("#file_upload-progressbar"),i=t.find(".uk-progress-bar"),o={action:"/",allow:"*.(jpg|jpeg|gif|png)",loadstart:function(){i.css("width","0%").text("0%"),t.removeClass("uk-hidden")},progress:function(t){t=Math.ceil(t),i.css("width",t+"%").text(t+"%")},allcomplete:function(o,e){i.css("width","100%").text("100%"),setTimeout(function(){t.addClass("uk-hidden")},250),setTimeout(function(){UIkit.notify({message:"Upload Completed",pos:"top-right"})},280)}};UIkit.uploadSelect($("#file_upload-select"),o),UIkit.uploadDrop($("#file_upload-drop"),o)}};