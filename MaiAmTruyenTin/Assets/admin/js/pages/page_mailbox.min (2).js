$(function(){altair_mailbox.init()});var $mailbox=$("#mailbox"),$split_view_btn=$("#mailbox_list_split"),$combined_view_btn=$("#mailbox_list_combined"),$msg_list=$mailbox.find(".md-card-list"),anim_duration=250;altair_mailbox={init:function(){altair_mailbox.list_switch(),altair_mailbox.list_category_color(),altair_mailbox.select_messages(),altair_mailbox.toggle_message(),altair_mailbox.create_message()},list_switch:function(){$combined_view_btn.on("click",function(i){i.preventDefault(),i.stopPropagation(),$combined_view_btn.velocity("transition.expandOut",{duration:anim_duration,easing:easing_swiftOut,begin:function(){$mailbox.addClass("md-card-list-combined").find(".md-card-list-header").not(".md-card-list-header-combined").velocity("transition.expandOut",{duration:anim_duration,easing:easing_swiftOut,begin:function(){$msg_list.each(function(i){0!=i&&$(this).velocity({marginTop:"0"},{duration:anim_duration+200,easing:easing_swiftOut})})},complete:function(){$mailbox.find(".md-card-list-header-combined").velocity("transition.expandIn",{duration:anim_duration,easing:easing_swiftOut})}})},complete:function(){$split_view_btn.velocity("transition.expandIn",{duration:anim_duration,easing:easing_swiftOut})}})}),$split_view_btn.on("click",function(i){i.preventDefault(),$split_view_btn.velocity("transition.expandOut",{duration:anim_duration,easing:easing_swiftOut,begin:function(){var i=$mailbox.find(".md-card-list"),t=i.length;$mailbox.find(".md-card-list-header-combined").velocity("transition.expandOut",{duration:anim_duration,easing:easing_swiftOut}),i.reverse().each(function(i){i!=t-1&&$(this).velocity("reverse",{duration:anim_duration+200,easing:easing_swiftOut})}),setTimeout(function(){$mailbox.removeClass("md-card-list-combined"),$(".md-card-list-header").not(".md-card-list-header-combined").show().velocity("reverse")},500)},complete:function(){$combined_view_btn.velocity("transition.expandIn",{duration:anim_duration,easing:easing_swiftOut})}})}),$mailbox.hasClass("md-card-list-combined")?$combined_view_btn.click():$split_view_btn.hide()},list_category_color:function(){$(".md-card-list > ul > li").each(function(){$this=$(this);var i=$this.attr("data-message-category-color");i&&$(this).find("span.md-card-list-item-avatar").css({backgroundColor:"#"+i})})},select_messages:function(){$mailbox.on("ifChanged","[data-md-icheck]",function(){$(this).is(":checked")?$(this).closest("li").addClass("md-card-list-item-selected"):$(this).closest("li").removeClass("md-card-list-item-selected")}),$("#mailbox_select_all").on("ifChanged",function(){var i=$(this);$mailbox.find("[data-md-icheck]").each(function(){i.is(":checked")?$(this).iCheck("check"):$(this).iCheck("uncheck")})})},toggle_message:function(){$mailbox.on("click",".md-card-list ul > li",function(i){if(!$(i.target).closest(".md-card-list-item-menu").length&&!$(i.target).closest(".md-card-list-item-select").length){var t=$(this);if(!t.hasClass("item-shown")){var e=t.height()+t.children(".md-card-list-item-content-wrapper").actual("height");$mailbox.find(".item-shown").velocity("reverse",{begin:function(i){$(i).removeClass("item-shown").children(".md-card-list-item-content-wrapper").hide().velocity("reverse")}}),t.velocity({marginTop:40,marginBottom:40,marginLeft:-20,marginRight:-20,minHeight:e},{duration:300,easing:easing_swiftOut,begin:function(i){$(i).addClass("item-shown")},complete:function(i){$(i).children(".md-card-list-item-content-wrapper").show().velocity({opacity:1});var t=$("body"),e=$(i);t.animate({scrollTop:e.offset().top-$page_content.offset().top-8},1e3,bez_easing_swiftOut)}})}}}),$(document).on("click keydown",function(i){$(i.target).closest("li.item-shown").length&&27!=i.which||$mailbox.find(".item-shown").velocity("reverse",{begin:function(i){$(i).removeClass("item-shown").children(".md-card-list-item-content-wrapper").hide().velocity("reverse")}})})},create_message:function(){$("#mailbox_new_message").on("show.uk.modal",function(){});var i=$("#mail_progressbar"),t=i.find(".uk-progress-bar"),e={action:"./upload/",single:!1,loadstart:function(){t.css("width","0%").text("0%"),i.removeClass("uk-hidden uk-progress-danger")},progress:function(i){i=Math.ceil(i),t.css("width",i+"%").text(i+"%"),"100"==i&&setTimeout(function(){},1500)},error:function(e){i.addClass("uk-progress-danger"),t.css({width:"100%"}).text("100%")},abort:function(i){console.log(i)},complete:function(i,t){console.log(i)}};UIkit.uploadSelect($("#mail_upload-select"),e),UIkit.uploadDrop($("#mail_upload-drop"),e)}};