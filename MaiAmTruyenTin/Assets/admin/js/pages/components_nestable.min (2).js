$(function(){altair_nestable.init()}),altair_nestable={init:function(){function e(a,l){$.each(a,function(a,i){var n=t.find("[data-id="+i.id+"]").html();if(i&&"object"==typeof i){var s=$("<li class='uk-nestable-item' data-id='"+i.id+"'>"+n+"</li>").appendTo(l);if(i.children){var o=$("<ul>").appendTo(s);e(i.children,o)}}else $("<li class='uk-nestable-item' data-id='"+i.id+"'>"+n+"</li>").appendTo(l)})}var t=$("#nestable");if(t.length){if(lsTest()&&null!==localStorage.getItem("nestable_items")){var a=localStorage.getItem("nestable_items"),l=t.clone().empty();e(JSON.parse(a),l),t.html(l.html()).after('<a class="md-btn" href="#" id="restore_nestable">Restore</a>'),$("#restore_nestable").click(function(){localStorage.removeItem("nestable_items"),location.reload(!0)})}UIkit.nestable(t,{});t.on("change.uk.nestable",function(){var e=t.data("nestable").serialize();lsTest()&&(0===localStorage.length||localStorage.getItem("nestable_items")!=JSON.stringify(e))&&localStorage.setItem("nestable_items",JSON.stringify(e))})}}};