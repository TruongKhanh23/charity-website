$(function(){altair_todo.init()}),altair_todo={init:function(){var i=$("#todo_list");i.find("input:checkbox").on("ifChecked",function(){$(this).closest("li").addClass("md-list-item-disabled")}).on("ifUnchecked",function(){$(this).closest("li").removeClass("md-list-item-disabled")})}};