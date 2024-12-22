$(function(){altair_charts.metrics_graphics(),altair_charts.c3js(),altair_charts.chartist_charts()}),altair_charts={metrics_graphics:function(){function e(){var e=$(n).width(),t=$(i).width();d3.json("data/mg_brief-1.min.json",function(t){t=MG.convert.date(t,"date"),MG.data_graphic({data:t,linked:!0,width:e,height:o,xax_count:4,target:n})}),d3.json("data/mg_brief-2.min.json",function(e){e=MG.convert.date(e,"date"),MG.data_graphic({data:e,area:!1,linked:!0,width:t,height:r,xax_count:4,target:i})})}function t(){var e=$(s).width();d3.json("data/mg_confidence_band.min.json",function(t){t=MG.convert.date(t,"date"),MG.data_graphic({title:"Confidence Band",description:"This is an example of a graphic with a confidence band and extended x-axis ticks enabled.",data:t,format:"percentage",width:e,height:c,target:s,show_secondary_x_label:!1,show_confidence_band:["l","u"],x_extended_ticks:!0})})}function a(){var e=$(s).width();d3.json("data/mg_some_currency.min.json",function(t){t=MG.convert.date(t,"date"),MG.data_graphic({title:"Some Currency",description:"Here is an example that uses custom units for currency.",data:t,width:e,height:l,target:d,yax_units:"$"})})}var n="#mg_chart_linked_a",i="#mg_chart_linked_b",o=$(n).height(),r=$(i).height();$(n).length&&$(i).length&&(e(),$window.on("debouncedresize",function(){e()}));var s="#mg_chart_confidence_band",c=$(s).height();$(s).length&&(t(),$window.on("debouncedresize",function(){t()}));var d="#mg_chart_currency",l=$(s).height();$(d).length&&(a(),$window.on("debouncedresize",function(){a()}))},c3js:function(){var e="#c3_chart_bar_stacked";if($(e).length){var t=c3.generate({bindto:e,data:{columns:[["data1",-30,200,200,400,-150,250],["data2",130,100,-100,200,-150,50],["data3",-230,200,200,-300,250,250]],type:"bar",groups:[["data1","data2"]]},grid:{y:{lines:[{value:0}]}},color:{pattern:["#1f77b4","#ff7f0e","#2ca02c","#d62728","#9467bd","#8c564b","#e377c2","#7f7f7f","#bcbd22","#17becf"]}});$(e).waypoint({handler:function(){setTimeout(function(){t.groups([["data1","data2","data3"]])},1e3),setTimeout(function(){t.load({columns:[["data4",100,-50,150,200,-300,-100]]})},1500),setTimeout(function(){t.groups([["data1","data2","data3","data4"]])},2e3),this.destroy()},offset:"80%"}),$window.on("debouncedresize",function(){t.resize()})}var a="#c3_chart_donut";if($(a).length){var n=c3.generate({bindto:a,data:{columns:[["data1",30],["data2",120]],type:"donut",onclick:function(e,t){console.log("onclick",e,t)},onmouseover:function(e,t){console.log("onmouseover",e,t)},onmouseout:function(e,t){console.log("onmouseout",e,t)}},donut:{title:"Iris Petal Width",width:40},color:{pattern:["#1f77b4","#ff7f0e","#2ca02c","#d62728","#9467bd","#8c564b","#e377c2","#7f7f7f","#bcbd22","#17becf"]}});$(a).waypoint({handler:function(){setTimeout(function(){n.load({columns:[["setosa",.2,.2,.2,.2,.2,.4,.3,.2,.2,.1,.2,.2,.1,.1,.2,.4,.4,.3,.3,.3,.2,.4,.2,.5,.2,.2,.4,.2,.2,.2,.2,.4,.1,.2,.2,.2,.2,.1,.2,.2,.3,.3,.2,.6,.4,.3,.2,.2,.2,.2],["versicolor",1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3],["virginica",2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8]]})},1500),setTimeout(function(){n.unload({ids:"data1"}),n.unload({ids:"data2"})},2500),this.destroy()},offset:"80%"}),$window.on("debouncedresize",function(){n.resize()})}var i="#c3_chart_spline";if($(i).length){var o=c3.generate({bindto:i,data:{columns:[["data1",30,200,100,400,150,250],["data2",130,100,140,200,150,50]],type:"spline"},color:{pattern:["#5E35B1","#FB8C00"]}});$window.on("debouncedresize",function(){o.resize()})}var r="#c3_chart_area_stacked";if($(r).length){var s=c3.generate({bindto:r,data:{columns:[["data1",300,350,300,0,0,120],["data2",130,100,140,200,150,50]],types:{data1:"area-spline",data2:"area-spline"},groups:[["data1","data2"]]},color:{pattern:["#1565C0","#727272"]}});$window.on("debouncedresize",function(){s.resize()})}var c="#c3_chart_scatter";if($(c).length){var d=c3.generate({bindto:c,data:{xs:{setosa:"setosa_x",versicolor:"versicolor_x"},columns:[["setosa_x",3.5,3,3.2,3.1,3.6,3.9,3.4,3.4,2.9,3.1,3.7,3.4,3,3,4,4.4,3.9,3.5,3.8,3.8,3.4,3.7,3.6,3.3,3.4,3,3.4,3.5,3.4,3.2,3.1,3.4,4.1,4.2,3.1,3.2,3.5,3.6,3,3.4,3.5,2.3,3.2,3.5,3.8,3,3.8,3.2,3.7,3.3],["versicolor_x",3.2,3.2,3.1,2.3,2.8,2.8,3.3,2.4,2.9,2.7,2,3,2.2,2.9,2.9,3.1,3,2.7,2.2,2.5,3.2,2.8,2.5,2.8,2.9,3,2.8,3,2.9,2.6,2.4,2.4,2.7,2.7,3,3.4,3.1,2.3,3,2.5,2.6,3,2.6,2.3,2.7,3,2.9,2.9,2.5,2.8],["setosa",.2,.2,.2,.2,.2,.4,.3,.2,.2,.1,.2,.2,.1,.1,.2,.4,.4,.3,.3,.3,.2,.4,.2,.5,.2,.2,.4,.2,.2,.2,.2,.4,.1,.2,.2,.2,.2,.1,.2,.2,.3,.3,.2,.6,.4,.3,.2,.2,.2,.2],["versicolor",1.4,1.5,1.5,1.3,1.5,1.3,1.6,1,1.3,1.4,1,1.5,1,1.4,1.3,1.4,1.5,1,1.5,1.1,1.8,1.3,1.5,1.2,1.3,1.4,1.4,1.7,1.5,1,1.1,1,1.2,1.6,1.5,1.6,1.5,1.3,1.3,1.3,1.2,1.4,1.2,1,1.3,1.2,1.3,1.3,1.1,1.3]],type:"scatter"},axis:{x:{label:"Sepal.Width",tick:{fit:!1}},y:{label:"Petal.Width"}},color:{pattern:["#1f77b4","#ff7f0e","#2ca02c","#d62728","#9467bd","#8c564b","#e377c2","#7f7f7f","#bcbd22","#17becf"]}});$(c).waypoint({handler:function(){setTimeout(function(){d.load({xs:{virginica:"virginica_x"},columns:[["virginica_x",3.3,2.7,3,2.9,3,3,2.5,2.9,2.5,3.6,3.2,2.7,3,2.5,2.8,3.2,3,3.8,2.6,2.2,3.2,2.8,2.8,2.7,3.3,3.2,2.8,3,2.8,3,2.8,3.8,2.8,2.8,2.6,3,3.4,3.1,3,3.1,3.1,3.1,2.7,3.2,3.3,3,2.5,3,3.4,3],["virginica",2.5,1.9,2.1,1.8,2.2,2.1,1.7,1.8,1.8,2.5,2,1.9,2.1,2,2.4,2.3,1.8,2.2,2.3,1.5,2.3,2,2,1.8,2.1,1.8,1.8,1.8,2.1,1.6,1.9,2,2.2,1.5,1.4,2.3,2.4,1.8,1.8,2.1,2.4,2.3,1.9,2.3,2.5,2.3,1.9,2,2.3,1.8]]})},1e3),setTimeout(function(){d.unload({ids:"setosa"})},2e3),setTimeout(function(){d.load({columns:[["virginica",.2,.2,.2,.2,.2,.4,.3,.2,.2,.1,.2,.2,.1,.1,.2,.4,.4,.3,.3,.3,.2,.4,.2,.5,.2,.2,.4,.2,.2,.2,.2,.4,.1,.2,.2,.2,.2,.1,.2,.2,.3,.3,.2,.6,.4,.3,.2,.2,.2,.2]]})},3e3),this.destroy()},offset:"80%"}),$window.on("debouncedresize",function(){d.resize()})}var l="#c3_server_load";if($(l).length){var u=c3.generate({bindto:l,data:{columns:[["data",24]],type:"gauge",onclick:function(e,t){console.log("onclick",e,t)},onmouseover:function(e,t){console.log("onmouseover",e,t)},onmouseout:function(e,t){console.log("onmouseout",e,t)}},gauge:{label:{format:function(e,t){return e},show:!1},min:0,max:100,width:36},color:{pattern:["#D32F2F","#F57C00","#388E3C"],threshold:{values:[25,50,100]}},size:{height:180}});setInterval(function(){var e=Math.floor(100*Math.random());u.load({columns:[["data",e]]})},2e3)}},chartist_charts:function(){new Chartist.Line("#chartist_simple_lines",{labels:["Monday","Tuesday","Wednesday","Thursday","Friday"],series:[[12,9,7,8,5],[2,1,3.5,7,3],[1,3,4,5,6]]},{fullWidth:!0,chartPadding:{right:40}}),new Chartist.Line("#chartist_line_area",{labels:[1,2,3,4,5,6,7,8],series:[[5,9,7,8,5,3,5,4]]},{low:0,showArea:!0}),new Chartist.Line("#chartist_bipolar",{labels:[1,2,3,4,5,6,7,8],series:[[1,2,3,1,-2,0,1,0],[-2,-1,-2,-1,-2.5,-1,-2,-1],[0,0,0,1,2,2.5,2,1],[2.5,2,1,.5,1,.5,-1,-2.5]]},{high:3,low:-3,showArea:!0,showLine:!1,showPoint:!1,fullWidth:!0,axisX:{showLabel:!1,showGrid:!1}}),new Chartist.Bar("#chartist_distributed_series",{labels:["XS","S","M","L","XL","XXL","XXXL"],series:[20,60,120,200,180,20,10]},{distributeSeries:!0});var e={series:[5,3,4]},t=function(e,t){return e+t};new Chartist.Pie("#chartist_simple_pie",e,{labelInterpolationFnc:function(a){return Math.round(a/e.series.reduce(t)*100)+"%"}});var e={labels:["Bananas","Apples","Grapes"],series:[20,15,40]},a={labelInterpolationFnc:function(e){return e[0]}},n=[["screen and (max-width: 767px)",{chartPadding:50,labelOffset:50,labelDirection:"explode",labelInterpolationFnc:function(e){return e}}],["screen and (min-width: 768px)",{chartPadding:30,labelOffset:60,labelDirection:"explode",labelInterpolationFnc:function(e){return e}}],["screen and (min-width: 1024px)",{labelOffset:80,chartPadding:20}]];new Chartist.Pie("#chartist_pie_custom_labels",e,a,n);var i=new Chartist.Pie("#chartist_donut_animate",{series:[10,20,50,20,5,50,15],labels:[1,2,3,4,5,6,7]},{donut:!0,showLabel:!1});i.on("draw",function(e){if("slice"===e.type){var t=e.element._node.getTotalLength();e.element.attr({"stroke-dasharray":t+"px "+t+"px"});var a={"stroke-dashoffset":{id:"anim"+e.index,dur:1e3,from:-t+"px",to:"0px",easing:Chartist.Svg.Easing.easeOutQuint,fill:"freeze"}};0!==e.index&&(a["stroke-dashoffset"].begin="anim"+(e.index-1)+".end"),e.element.attr({"stroke-dashoffset":-t+"px"}),e.element.animate(a,!1)}}),i.on("created",function(){window.__anim21278907124&&(clearTimeout(window.__anim21278907124),window.__anim21278907124=null),window.__anim21278907124=setTimeout(i.update.bind(i),1e4)})}};