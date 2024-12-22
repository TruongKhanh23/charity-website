/*!

 diff v2.2.1

Software License Agreement (BSD License)

Copyright (c) 2009-2015, Kevin Decker <kpdecker@gmail.com>

All rights reserved.

Redistribution and use of this software in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above
  copyright notice, this list of conditions and the
  following disclaimer.

* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the
  following disclaimer in the documentation and/or other
  materials provided with the distribution.

* Neither the name of Kevin Decker nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior
  written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@license
*/
!function(a,b){"object"==typeof exports&&"object"==typeof module?module.exports=b():"function"==typeof define&&define.amd?define([],b):"object"==typeof exports?exports.JsDiff=b():a.JsDiff=b()}(this,function(){return function(a){function b(d){if(c[d])return c[d].exports;var e=c[d]={exports:{},id:d,loaded:!1};return a[d].call(e.exports,e,e.exports,b),e.loaded=!0,e.exports}var c={};return b.m=a,b.c=c,b.p="",b(0)}([function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}b.__esModule=!0;var e=c(1),f=d(e),g=c(2),h=c(3),i=c(5),j=c(6),k=c(7),l=c(8),m=c(9),n=c(10),o=c(12),p=c(13),q=c(14);b.Diff=f["default"],b.diffChars=g.diffChars,b.diffWords=h.diffWords,b.diffWordsWithSpace=h.diffWordsWithSpace,b.diffLines=i.diffLines,b.diffTrimmedLines=i.diffTrimmedLines,b.diffSentences=j.diffSentences,b.diffCss=k.diffCss,b.diffJson=l.diffJson,b.structuredPatch=o.structuredPatch,b.createTwoFilesPatch=o.createTwoFilesPatch,b.createPatch=o.createPatch,b.applyPatch=m.applyPatch,b.applyPatches=m.applyPatches,b.parsePatch=n.parsePatch,b.convertChangesToDMP=p.convertChangesToDMP,b.convertChangesToXML=q.convertChangesToXML,b.canonicalize=l.canonicalize},function(a,b){"use strict";function c(){}function d(a,b,c,d,e){for(var f=0,g=b.length,h=0,i=0;g>f;f++){var j=b[f];if(j.removed){if(j.value=d.slice(i,i+j.count).join(""),i+=j.count,f&&b[f-1].added){var k=b[f-1];b[f-1]=b[f],b[f]=k}}else{if(!j.added&&e){var l=c.slice(h,h+j.count);l=l.map(function(a,b){var c=d[i+b];return c.length>a.length?c:a}),j.value=l.join("")}else j.value=c.slice(h,h+j.count).join("");h+=j.count,j.added||(i+=j.count)}}var m=b[g-1];return(m.added||m.removed)&&a.equals("",m.value)&&(b[g-2].value+=m.value,b.pop()),b}function e(a){return{newPos:a.newPos,components:a.components.slice(0)}}b.__esModule=!0,b["default"]=c,c.prototype={diff:function(a,b){function c(a){return h?(setTimeout(function(){h(void 0,a)},0),!0):a}function f(){for(var f=-1*l;l>=f;f+=2){var g=void 0,h=n[f-1],m=n[f+1],o=(m?m.newPos:0)-f;h&&(n[f-1]=void 0);var p=h&&h.newPos+1<j,q=m&&o>=0&&k>o;if(p||q){if(!p||q&&h.newPos<m.newPos?(g=e(m),i.pushComponent(g.components,void 0,!0)):(g=h,g.newPos++,i.pushComponent(g.components,!0,void 0)),o=i.extractCommon(g,b,a,f),g.newPos+1>=j&&o+1>=k)return c(d(i,g.components,b,a,i.useLongestToken));n[f]=g}else n[f]=void 0}l++}var g=arguments.length<=2||void 0===arguments[2]?{}:arguments[2],h=g.callback;"function"==typeof g&&(h=g,g={}),this.options=g;var i=this;a=this.castInput(a),b=this.castInput(b),a=this.removeEmpty(this.tokenize(a)),b=this.removeEmpty(this.tokenize(b));var j=b.length,k=a.length,l=1,m=j+k,n=[{newPos:-1,components:[]}],o=this.extractCommon(n[0],b,a,0);if(n[0].newPos+1>=j&&o+1>=k)return c([{value:b.join(""),count:b.length}]);if(h)!function q(){setTimeout(function(){return l>m?h():void(f()||q())},0)}();else for(;m>=l;){var p=f();if(p)return p}},pushComponent:function(a,b,c){var d=a[a.length-1];d&&d.added===b&&d.removed===c?a[a.length-1]={count:d.count+1,added:b,removed:c}:a.push({count:1,added:b,removed:c})},extractCommon:function(a,b,c,d){for(var e=b.length,f=c.length,g=a.newPos,h=g-d,i=0;e>g+1&&f>h+1&&this.equals(b[g+1],c[h+1]);)g++,h++,i++;return i&&a.components.push({count:i}),a.newPos=g,h},equals:function(a,b){return a===b},removeEmpty:function(a){for(var b=[],c=0;c<a.length;c++)a[c]&&b.push(a[c]);return b},castInput:function(a){return a},tokenize:function(a){return a.split("")}},a.exports=b["default"]},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){return h.diff(a,b,c)}b.__esModule=!0,b.diffChars=e;var f=c(1),g=d(f),h=new g["default"];b.characterDiff=h},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){var d=i.generateOptions(c,{ignoreWhitespace:!0});return l.diff(a,b,d)}function f(a,b,c){return l.diff(a,b,c)}b.__esModule=!0,b.diffWords=e,b.diffWordsWithSpace=f;var g=c(1),h=d(g),i=c(4),j=/^[A-Za-z\xC0-\u02C6\u02C8-\u02D7\u02DE-\u02FF\u1E00-\u1EFF]+$/,k=/\S/,l=new h["default"];b.wordDiff=l,l.equals=function(a,b){return a===b||this.options.ignoreWhitespace&&!k.test(a)&&!k.test(b)},l.tokenize=function(a){for(var b=a.split(/(\s+|\b)/),c=0;c<b.length-1;c++)!b[c+1]&&b[c+2]&&j.test(b[c])&&j.test(b[c+2])&&(b[c]+=b[c+2],b.splice(c+1,2),c--);return b}},function(a,b){"use strict";function c(a,b){if("function"==typeof a)b.callback=a;else if(a)for(var c in a)a.hasOwnProperty(c)&&(b[c]=a[c]);return b}b.__esModule=!0,b.generateOptions=c},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){return j.diff(a,b,c)}function f(a,b,c){var d=i.generateOptions(c,{ignoreWhitespace:!0});return j.diff(a,b,d)}b.__esModule=!0,b.diffLines=e,b.diffTrimmedLines=f;var g=c(1),h=d(g),i=c(4),j=new h["default"];b.lineDiff=j,j.tokenize=function(a){var b=[],c=a.split(/(\n|\r\n)/);c[c.length-1]||c.pop();for(var d=0;d<c.length;d++){var e=c[d];d%2&&!this.options.newlineIsToken?b[b.length-1]+=e:(this.options.ignoreWhitespace&&(e=e.trim()),b.push(e))}return b}},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){return h.diff(a,b,c)}b.__esModule=!0,b.diffSentences=e;var f=c(1),g=d(f),h=new g["default"];b.sentenceDiff=h,h.tokenize=function(a){return a.split(/(\S.+?[.!?])(?=\s+|$)/)}},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){return h.diff(a,b,c)}b.__esModule=!0,b.diffCss=e;var f=c(1),g=d(f),h=new g["default"];b.cssDiff=h,h.tokenize=function(a){return a.split(/([{}:;,]|\s+)/)}},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b,c){return k.diff(a,b,c)}function f(a,b,c){b=b||[],c=c||[];var d=void 0;for(d=0;d<b.length;d+=1)if(b[d]===a)return c[d];var e=void 0;if("[object Array]"===j.call(a)){for(b.push(a),e=new Array(a.length),c.push(e),d=0;d<a.length;d+=1)e[d]=f(a[d],b,c);b.pop(),c.pop()}else if("object"==typeof a&&null!==a){b.push(a),e={},c.push(e);var g=[],h=void 0;for(h in a)a.hasOwnProperty(h)&&g.push(h);for(g.sort(),d=0;d<g.length;d+=1)h=g[d],e[h]=f(a[h],b,c);b.pop(),c.pop()}else e=a;return e}b.__esModule=!0,b.diffJson=e,b.canonicalize=f;var g=c(1),h=d(g),i=c(5),j=Object.prototype.toString,k=new h["default"];b.jsonDiff=k,k.useLongestToken=!0,k.tokenize=i.lineDiff.tokenize,k.castInput=function(a){return"string"==typeof a?a:JSON.stringify(f(a),void 0,"  ")},k.equals=function(a,b){return h["default"].prototype.equals(a.replace(/,([\r\n])/g,"$1"),b.replace(/,([\r\n])/g,"$1"))}},function(a,b,c){"use strict";function d(a){return a&&a.__esModule?a:{"default":a}}function e(a,b){function c(a,b){for(var c=0;c<a.lines.length;c++){var d=a.lines[c],f=d[0],g=d.substr(1);if(" "===f||"-"===f){if(!h(b+1,e[b],f,g)&&(j++,j>k))return!1;b++}}return!0}var d=arguments.length<=2||void 0===arguments[2]?{}:arguments[2];if("string"==typeof b&&(b=g.parsePatch(b)),Array.isArray(b)){if(b.length>1)throw new Error("applyPatch only works with a single input.");b=b[0]}for(var e=a.split("\n"),f=b.hunks,h=d.compareLine||function(a,b,c,d){return b===d},j=0,k=d.fuzzFactor||0,l=0,m=0,n=void 0,o=void 0,p=0;p<f.length;p++){for(var q=f[p],r=e.length-q.oldLines,s=0,t=m+q.oldStart-1,u=i["default"](t,l,r);void 0!==s;s=u())if(c(q,t+s)){q.offset=m+=s;break}if(void 0===s)return!1;l=q.offset+q.oldStart+q.oldLines}for(var p=0;p<f.length;p++)for(var q=f[p],t=q.offset+q.newStart-1,v=0;v<q.lines.length;v++){var w=q.lines[v],x=w[0],y=w.substr(1);if(" "===x)t++;else if("-"===x)e.splice(t,1);else if("+"===x)e.splice(t,0,y),t++;else if("\\"===x){var z=q.lines[v-1]?q.lines[v-1][0]:null;"+"===z?n=!0:"-"===z&&(o=!0)}}if(n)for(;!e[e.length-1];)e.pop();else o&&e.push("");return e.join("\n")}function f(a,b){function c(){var f=a[d++];return f?void b.loadFile(f,function(a,d){if(a)return b.complete(a);var g=e(d,f,b);b.patched(f,g),setTimeout(c,0)}):b.complete()}"string"==typeof a&&(a=g.parsePatch(a));var d=0;c()}b.__esModule=!0,b.applyPatch=e,b.applyPatches=f;var g=c(10),h=c(11),i=d(h)},function(a,b){"use strict";function c(a){function b(){var a={};for(g.push(a);h<f.length;){var b=f[h];if(/^(\-\-\-|\+\+\+|@@)\s/.test(b))break;var i=/^(?:Index:|diff(?: -r \w+)+)\s+(.+?)\s*$/.exec(b);i&&(a.index=i[1]),h++}for(c(a),c(a),a.hunks=[];h<f.length;){var b=f[h];if(/^(Index:|diff|\-\-\-|\+\+\+)\s/.test(b))break;if(/^@@/.test(b))a.hunks.push(d());else{if(b&&e.strict)throw new Error("Unknown line "+(h+1)+" "+JSON.stringify(b));h++}}}function c(a){var b=/^(\-\-\-|\+\+\+)\s+(\S+)\s?(.+?)\s*$/.exec(f[h]);if(b){var c="---"===b[1]?"old":"new";a[c+"FileName"]=b[2],a[c+"Header"]=b[3],h++}}function d(){for(var a=h,b=f[h++],c=b.split(/@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))? @@/),d={oldStart:+c[1],oldLines:+c[2]||1,newStart:+c[3],newLines:+c[4]||1,lines:[]},g=0,i=0;h<f.length;h++){var j=f[h][0];if("+"!==j&&"-"!==j&&" "!==j&&"\\"!==j)break;d.lines.push(f[h]),"+"===j?g++:"-"===j?i++:" "===j&&(g++,i++)}if(g||1!==d.newLines||(d.newLines=0),i||1!==d.oldLines||(d.oldLines=0),e.strict){if(g!==d.newLines)throw new Error("Added line count did not match for hunk at line "+(a+1));if(i!==d.oldLines)throw new Error("Removed line count did not match for hunk at line "+(a+1))}return d}for(var e=arguments.length<=1||void 0===arguments[1]?{}:arguments[1],f=a.split("\n"),g=[],h=0;h<f.length;)b();return g}b.__esModule=!0,b.parsePatch=c},function(a,b){"use strict";b.__esModule=!0,b["default"]=function(a,b,c){var d=!0,e=!1,f=!1,g=1;return function(){for(var h=!0;h;){if(h=!1,d&&!f){if(e?g++:d=!1,c>=a+g)return g;f=!0}if(e);else{if(f||(d=!0),a-g>=b)return-g++;e=!0,h=!0}}}},a.exports=b["default"]},function(a,b,c){"use strict";function d(a){if(Array.isArray(a)){for(var b=0,c=Array(a.length);b<a.length;b++)c[b]=a[b];return c}return Array.from(a)}function e(a,b,c,e,f,g,i){function j(a){return a.map(function(a){return" "+a})}i||(i={context:4});var k=h.diffLines(c,e);k.push({value:"",lines:[]});for(var l=[],m=0,n=0,o=[],p=1,q=1,r=function(a){var b=k[a],f=b.lines||b.value.replace(/\n$/,"").split("\n");if(b.lines=f,b.added||b.removed){var g;if(!m){var h=k[a-1];m=p,n=q,h&&(o=i.context>0?j(h.lines.slice(-i.context)):[],m-=o.length,n-=o.length)}(g=o).push.apply(g,d(f.map(function(a){return(b.added?"+":"-")+a}))),b.added?q+=f.length:p+=f.length}else{if(m)if(f.length<=2*i.context&&a<k.length-2){var r;(r=o).push.apply(r,d(j(f)))}else{var s,t=Math.min(f.length,i.context);(s=o).push.apply(s,d(j(f.slice(0,t))));var u={oldStart:m,oldLines:p-m+t,newStart:n,newLines:q-n+t,lines:o};if(a>=k.length-2&&f.length<=i.context){var v=/\n$/.test(c),w=/\n$/.test(e);0!=f.length||v?v&&w||o.push("\\ No newline at end of file"):o.splice(u.oldLines,0,"\\ No newline at end of file")}l.push(u),m=0,n=0,o=[]}p+=f.length,q+=f.length}},s=0;s<k.length;s++)r(s);return{oldFileName:a,newFileName:b,oldHeader:f,newHeader:g,hunks:l}}function f(a,b,c,d,f,g,h){var i=e(a,b,c,d,f,g,h),j=[];a==b&&j.push("Index: "+a),j.push("==================================================================="),j.push("--- "+i.oldFileName+("undefined"==typeof i.oldHeader?"":"	"+i.oldHeader)),j.push("+++ "+i.newFileName+("undefined"==typeof i.newHeader?"":"	"+i.newHeader));for(var k=0;k<i.hunks.length;k++){var l=i.hunks[k];j.push("@@ -"+l.oldStart+","+l.oldLines+" +"+l.newStart+","+l.newLines+" @@"),j.push.apply(j,l.lines)}return j.join("\n")+"\n"}function g(a,b,c,d,e,g){return f(a,a,b,c,d,e,g)}b.__esModule=!0,b.structuredPatch=e,b.createTwoFilesPatch=f,b.createPatch=g;var h=c(5)},function(a,b){"use strict";function c(a){for(var b=[],c=void 0,d=void 0,e=0;e<a.length;e++)c=a[e],d=c.added?1:c.removed?-1:0,b.push([d,c.value]);return b}b.__esModule=!0,b.convertChangesToDMP=c},function(a,b){"use strict";function c(a){for(var b=[],c=0;c<a.length;c++){var e=a[c];e.added?b.push("<ins>"):e.removed&&b.push("<del>"),b.push(d(e.value)),e.added?b.push("</ins>"):e.removed&&b.push("</del>")}return b.join("")}function d(a){var b=a;return b=b.replace(/&/g,"&amp;"),b=b.replace(/</g,"&lt;"),b=b.replace(/>/g,"&gt;"),b=b.replace(/"/g,"&quot;")}b.__esModule=!0,b.convertChangesToXML=c}])});