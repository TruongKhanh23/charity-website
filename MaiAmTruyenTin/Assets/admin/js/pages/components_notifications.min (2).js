function notify_callback(){return alert("Notify closed!")}function executeCallback(t){window[t]()}function showNotify(t){if(thisNotify=UIkit.notify({message:t.data("message")?t.data("message"):"",status:t.data("status")?t.data("status"):"",timeout:t.attr("data-timeout")?t.data("timeout"):5e3,group:t.data("group")?t.data("group"):null,pos:t.data("pos")?t.data("pos"):"top-center",onClose:function(){$body.find(".md-fab-wrapper").css("margin-bottom",""),t.data("callback")&&executeCallback(t.data("callback")),clearTimeout(thisNotify.timeout)}}),$window.width()<768&&("bottom-right"==thisNotify.options.pos||"bottom-left"==thisNotify.options.pos||"bottom-center"==thisNotify.options.pos)||"bottom-right"==thisNotify.options.pos){var o=$(thisNotify.element).outerHeight(),i=$window.width()<768?-6:8;$body.find(".md-fab-wrapper").css("margin-bottom",o+i)}}$(function(){altair_notifications.init()}),altair_notifications={init:function(){$body.on("click","[data-message]",function(){var t=$(this);$body.find(".uk-notify-message").length?($body.find(".uk-notify-message").click(),setTimeout(function(){showNotify(t)},450)):showNotify(t)})}};