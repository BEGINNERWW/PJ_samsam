<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.project.samsam.board.*" %>

<%

	List<adopt_homeVO> homelist=(List<adopt_homeVO>)request.getAttribute("homelist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>가정분양 게시판</title>
<style>

#viewtrans{
	width:1000px;
	margin:0 auto;
	height:50px;
}

#menubar{
	height:50px;
	background-color:white;
}

#write{
margin:0 auto;
width:1000px;
}

.content{
	width:1000px;
	margin:0 auto;
}

img{
max-width:100%;
}
.thumbnail1{
width:100px;
}





.card{

}

html, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,

	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,

	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,

	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,

	caption, tbody, tfoot, thead ,th, article, aside, canvas,

	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,

	output, ruby, section, summary, time, mark, audio, video {

	margin: 0;

	padding: 0;

	border: 0;

	font-size: 100%;

	do: inherit;

	vertical-align: baseline;

}



article, aside, details, figcaption, figure, footer, header, hgroup,

	menu, nav, section {

	display: block;

}



blockquote, q {

	quotes: none;

}



blockquote : before, blockquote : after, q : before, q : after {

	content: '';

	content: none;

}



table,td{

	border-collapse: collapse;

	border-spacing: 0;
	
	width:600px;
	
	align:center;
	
	text-align:center;
	vertical-align:middle;
}

.line{border-bottom:1px solid black;}

#copy{
	background-color:#f3f1ff;
	height:30px;	
}

/*css 초기화*/



.card {

	height: 200px;

	width: 150px;

	border-radius: 15px;

	display: inline-block;

	margin-top: 30px;

	margin-left: 30px;

	margin-bottom: 30px;

	position: relative;

	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

	overflow: hidden;

}



.card-header {

	-webkit-transition: 0.5s; /*사파리 & 크롬*/

    -moz-transition: 0.5s;  /*파이어폭스*/

    -ms-transition: 0.5s;	/*인터넷 익스플로러*/

    -o-transition: 0.5s;  /*오페라*/

    transition: 0.5s;

	width: 100%;

	height: 170px;

	border-radius: 15px 15px 0 0;
	

	background-size: 100% 280px;

	background-repeat: no-repeat;	

}

.bg_image{

}

.card:hover .card-header  {

	opacity: 0.8;

	height: 100px;

}



.card-header-is_closed{

    background-color: #EF5A31 ;

    color: #FFF ;

    font-weight: bold ;

    text-align: center ;

    float: right;

    margin: 15px 15px 0 0;

    border-radius: 50%;

    font-weight: bold;

    padding: 10px 10px;

    line-height: 20px;

}



h1 {

    font-size: 13px;

    font-weight: bold;

}



.card-body {

}



.card-body-header{

	line-height: 25px;

	margin: 10px 20px 0px 20px;

}



.card-body-description  {

    opacity: 0;

    color: #757B82;

    line-height: 25px;

    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/

    -moz-transition: .2s ease-in-out; /*파이어폭스*/

    -ms-transition: .2s ease-in-out; /*익스플로러*/

    -o-transition: .2s ease-in-out; /*오페라*/

    transition : .2s ease-in-out;

    overflow: hidden;

	height: 180px;

	margin: 5px 20px;

}

.card:hover .card-body-description {

    opacity: 1;

    -webkit-transition: .5s ease-in-out;

    -moz-transition: .5s ease-in-out;

    -ms-transition: .5s ease-in-out;

    -o-transition: .5s ease-in-out;

    transition : .5s ease-in-out;

 	

}







.card-body-hashtag {

	color: #2478FF;

	font-style: italic;

}



.card-body-footer {

  	position: absolute; 

  	margin-top: 15px;

  	margin-bottom: 6px;

    bottom: 0; 

    width: 314px;

    font-size: 14px;

    color: #9FA5A8;

    padding: 0 15px;

}



.icon {

    display: inline-block;

    vertical-align: middle;

    margin-right: 2px;

}



.icon-view_count {

    width: 25px;

    height: 17px;

	

}



.icon-comments_count {

	margin-left: 5px;

	width: 25px;

    height: 17px;

	

}



.reg_date {

	float: right;

}

<!-- 카드 css 끝-->
@font-face {
  font-family: "NanumSquareRoundR";
  src: url("./fonts/NanumSquareRoundR.eot"); /* IE9 Compat Modes */
  src: url("./fonts/NanumSquareRoundR.eot?#iefix") format("embedded-opentype"), /* IE6-IE8 */
    url("./fonts/NanumSquareRoundR.otf") format("opentype"), /* Open Type Font */
    url("./fonts/NanumSquareRoundR.svg") format("svg"), /* Legacy iOS */
    url("./fonts/NanumSquareRoundR.ttf") format("truetype"), /* Safari, Android, iOS */
    url("./fonts/NanumSquareRoundR.woff") format("woff"), /* Modern Browsers */
    url("./fonts/NanumSquareRoundR.woff2") format("woff2"); /* Modern Browsers */
  font-weight: normal;
  font-style: normal;
}

body {font-family: "NanumSquareRoundR", sans-serif}
/* 나눔스퀘어  font 적용 끝*/

body,html {
	background-color: #f7f7f7;
}

.row > * {
    padding: 30px 0px 0px 0px;
}
.row {
    margin-top: -40px;
    margin-left: 0px;
}

.header-top > .container {
    padding-top: 10px;
    padding-bottom: 0px;
}

.sign_in {
    margin-top: 30px;
    margin-left: 85px;
}

.site-section {
	background-colir: #f7f7f7;
}


.site-section {
  padding: 2.5em 0; }
  @media (min-width: 768px) {
    .site-section {
      padding: 0em 0; } }
  .site-section.site-section-sm {
    padding: 4em 0; }
      

.container_nav {
    margin: 0 auto;
    max-width: 100%;
    width: 1900px;
}

.site-navbar .site-navigation .site-menu > li > a {
    text-transform: uppercase;
    font-size: 1.4rem;
    font-family: "NanumSquareRoundR", sans-serif;
 }
 .site-navbar {
    font-family: "NanumSquareRoundR", sans-serif;
}
 
 #nav:after {
    content: '';
    display: block;
    width: 1900px;
    left: 0;
    height: 0.5em;
    background-color: #FFC324;
    }
    
#nav > ul > li.current:before {
    -moz-transform: rotateZ(45deg);
    -webkit-transform: rotateZ(45deg);
    -ms-transform: rotateZ(45deg);
    transform: rotateZ(45deg);
    width: 0.5em;
    height: 0.5em;
    content: '';
    display: block;
    position: absolute;
    bottom: -0.3em;
    left: 50%;
    margin-left: 0;
    background-color: #FFC324;
    }
    
ul {
	background-color: white;
}
.filter-list{
    background-color: white;
}


#nav > ul > li a {
    color: black;
    text-decoration: none;
    border: 0;
    display: block;
    padding: 1.5em 0.5em 1.35em 0.5em;
    font-size: 20px;
}

#nav > ul > li.current a {
    color: black;
}

.site-navbar {
    margin-bottom: 0px;
    z-index: 1999;
    width: 100%;
    background: #f7f7f7;
}

.sticky-wrapper .site-navbar {
    -webkit-transition: .3s all ease;
    -o-transition: .3s all ease;
    transition: .3s all ease;
    border-bottom: none;
}

.search-form .form-control {
    margin-right: 10px;
    height: 35px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 30px;
    border: none;
    background: #fff;
    border-bottom: 1px solid transparent;
    border-bottom: 1px solid #ccc;
}


ul {
    background-color: #f7f7f7;
}

.sticky-wrapper {
	color : #474747;
    position: absolute;
    z-index: 100;
    width: 100%;
    background: #f7f7f7;
}

a {
	text-decoration: none;
	color: black;
	border-bottom: none;
}
#nav > ul > li:hover a {
    color: #37c0fb;
}

.site-section.subscribe {
    padding: 2em 0;
}

hr {
    border-top: solid 1px #ECECEC;
    border: 1;
    margin-bottom: 1.5em;
}

.blockquote {
    margin-bottom: 0;
    font-size: 1.25rem;
}
blockquote {
    border-left: 0;
    padding: 0;
}
.blockquote-footer {
    display: block;
    font-size: 70%;
    color: #6c757d;
    font-style: italic;
    margin: 5px 0 0em 0;
}
.container_footer {
    margin: 0 auto;
    width: 1140px;
}
.row_footer {
    display: flex;
    flex-wrap: inherit;
    box-sizing: border-box;
    align-items: stretch;
}
.footer {
	width:100%;
    font-size: .85rem;
    text-align: center;
    bottom: 0;
    padding: 0rem 0;
    position: fixed;
    background-color: #f7f7f7;
   
}
.brand-list{
	background-color: white;
}

/* header, footer 이외 css */
.content-wrap {
	width: 1110px;
	min-height: 100%;
	margin: 0 auto;
	position: relative;
	top: 50px;
	
}
.content-section {
	width: 860px;
	position: absolute;
	padding-bottom: 190px;
}
.sidemenu-section {
	width: 230px;
	left: 880px;
	position: absolute;
}

.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #f7f7f7;
    border: 1px solid rgba(0,0,0,.125);
}
.list-group-item > a {
	text-decoration : none;
	}




table {

    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
 
  }
  
th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
 .card {
  width:300px;
  display: grid;
  grid-template-columns: 300px;
  grid-template-rows: 210px 210px 80px;
  grid-template-areas: "image" "text" "stats";

  border-radius: 18px;
  background: white;
  box-shadow: 0px 0px 1px rgba(0,0,0,0.9);
  font-family: roboto;
  text-align: center;
  float:left;
}

.card-image {
  grid-area: image;
}
.card-text {
  grid-area: text;
}
.card-stats {
  grid-area: stats; 
}

.card-image {
  grid-area: image;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
  background-size: cover;
}
.card-text {
  grid-area: text;
  margin: 25px;
}
.card-text .date {
  color: rgb(255, 7, 110);
  font-size:13px;
}
.card-text p {
  color: grey;
  font-size:15px;
  font-weight: 300;
}
.card-text h2 {
  margin-top:0px;
  font-size:28px;
}
.card-stats {
  grid-area: stats; 
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 1fr;

  border-bottom-left-radius: 15px;
  border-bottom-right-radius: 15px;
  background: #E0D7CE;
}
.card-stats .stat {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;

  color: #614D3C;
  padding:10px;
}
.card:hover {
  transform: scale(1.05);
  box-shadow: 5px 5px 15px rgba(0,0,0,0.6);
}
.card {


  transition: 0.5s ease;
  cursor: pointer;
  margin:10px;
}

a{

  text-decoration:none;
  color:black;
  
}
.prod-category-smart-search .smart-search-result {
    padding: 24px 19px 24px 29px;
    border: 1px solid #000;
    min-height: 70px;
}

.prod-category-smart-search {
    position: relative;
    background-color: #fff;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.prod-category-smart-search .smart-search-result {
    padding: 24px 19px 24px 29px;
    border: 1px solid #000;
    min-height: 70px;
}
.prod-category-smart-search .smart-search-result .keyword-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
}
.prod-category-smart-search .smart-search-result .keyword-wrap+.left-box {
    margin-top: 30px;
}
.prod-category-smart-search .smart-search-result .left-box {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
}
.prod-category-smart-search .smart-search-result .btn-box {
    margin-top: 40px;
    text-align: center;
}
.prod-category-smart-search .smart-search-detail {
    display: none;
    margin-top: 30px;
    padding: 48px 50px 49px;
    border: 1px solid #000;
    background-color: #fff;
}
.prod-category-smart-search .smart-search-toggle {
    position: absolute;
    width: 70px;
    height: 30px;
    bottom: -29px;
    right: 0;
    background-color: #fff;
    color: #000;
    
}
button {
    vertical-align: top;
    cursor: pointer;
}
button, input, select, textarea {
    margin: 0;
    font-size: 100%;
    vertical-align: top;
}
button {
    appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
    min-width: 0em;
    background-image:none;
    border:2px solid black;
}
select, input, button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .title-box .title {
    font-weight: 500;
    font-size: 15px;
    letter-spacing: -.75px;
    padding: 0;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .title-box .title, .prod-category-smart-search .smart-search-result .keyword-wrap .title-box .title-desc {
    display: block;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .title-box .title-desc {
    color: #999;
    margin-top: 9px;
    font-size: 14px;
    letter-spacing: -.7px;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .keyword-input-box {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .keyword-input-box .ui-input {
    width: calc(100% - 150px);
    display:inline;
   
}
.input-wrap input:placeholder-shown, .input-wrap textarea:placeholder-shown {
    border-color: #d5d5d5;
}
.input-wrap input, .input-wrap textarea {
    color: #000;
    height: 38px;
    border: 1px solid #000;
    padding: 0 11px;
}
.input-wrap input {
    line-height: 36px;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .keyword-input-box .btn {
    width: 110px;
    margin-left: 10px;
}
.btn.btn-sm {
    min-width: 110px;
    height: 38px;
    padding: 0 12px;
    line-height: 36px;
    font-size: 13px;
    letter-spacing: -.65px;
}
.btn.btn-sm {
    min-width: 110px;
    height: 38px;
    padding: 0 12px;
    line-height: 36px;
    font-size: 13px;
    letter-spacing: -.65px;
}

.btn {
    position: relative;
    display: inline-block;
    color: #fff;
    min-width: 140px;
    height: 44px;
    padding: 0 25px;
    background-color: #111;
    border: 1px solid #111;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    line-height: 42px;
    -webkit-transition: background-color .23s ease-out,border-color .23s ease-out;
    transition: background-color .23s ease-out,border-color .23s ease-out;
    font-size: 14px;
    letter-spacing: -.7px;
}
.prod-category-smart-search .smart-search-result .keyword-wrap .title-box {
    width: 260px;
}
.prod-category-smart-search .smart-search-toggle:after {
    content: '';
    display: block;
    margin: 0 auto;
    width: 18px;
    height: 15px;
    background: url(./resources/images/m_merged.png) 0 0 no-repeat;
   
}
.prod-category-smart-search.active .smart-search-toggle:after {
    background-position: 0 -15px;
}

.prod-category-smart-search.active .smart-search-detail {
    display: block;
    margin-top: 0;
    
}

.smart-search-wrap {
    
    text-align: left;
}
.smart-search-wrap .search-item-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
   
}
.smart-search-wrap.no-category .search-item-wrap .search-item.brand, .smart-search-wrap.no-brand .search-item-wrap .search-item.brand {
    width: 275px;
    padding-right:50px;

}
.smart-search-wrap .search-item-wrap .search-item {
    position: relative;
    margin-top: 42px;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    
}
.smart-search-wrap .search-item-wrap .search-item .search-title {
    position: absolute;
    top: -42px;
    left: 0;
    display: block;
    font-family: "Montserrat",sans-serif;
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 26px;
}
*, *:before, *:after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.smart-search-wrap .search-item-wrap .search-item.brand .custom-scroll {
    padding-right: 20px;
}
.smart-search-wrap .search-item-wrap .search-item .filter-content.custom-scroll {
    width: calc(100% + 1px);
    height: 354px;
    border-right: 1px solid #ededed;
}
.custom-scroll {
    overflow-x: hidden;
}
[data-simplebar] {
    position: relative;
    flex-direction: column;
    flex-wrap: wrap;
    justify-content: flex-start;
    align-content: flex-start;
    align-items: flex-start;
    width: inherit;
    height: inherit;
    max-width: inherit;
    max-height: inherit;
}
.simplebar-wrapper {
    overflow: hidden;
    width: inherit;
    height: inherit;
    max-width: inherit;
    max-height: inherit;
}
.custom-scroll .simplebar-track {
    background: #d5d5d5;
}
.simplebar-track.simplebar-horizontal {
    left: 0;
    height: 11px;
}
.simplebar-track {
    z-index: 1;
    position: absolute;
    right: 0;
    bottom: 0;
    pointer-events: none;
}
.custom-scroll .simplebar-track.simplebar-vertical {
    width: 2px;
}
.custom-scroll .simplebar-track {
    background: #d5d5d5;
}
.simplebar-track.simplebar-vertical {
    top: 0;
    width: 11px;
}
.simplebar-track {
    z-index: 1;
    position: absolute;
    right: 0;
    bottom: 0;
    pointer-events: none;
}
.wrap {
    display: -webkit-box;
    display: -ms-flex;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: start;
    -ms-flex-pack: start;
    justify-content: flex-start;
    -webkit-box-align: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
    -ms-flex-line-pack: stretch;
    align-content: stretch;
    position: relative;
    min-width: 1440px;
    font-size: 0;
}
.simplebar-height-auto-observer-wrapper {
    box-sizing: inherit!important;
    height: 100%;
    width: inherit;
    max-width: 1px;
    position: relative;
    float: left;
    max-height: 1px;
    overflow: hidden;
    z-index: -1;
    padding: 0;
    margin: 0;
    pointer-events: none;
    flex-grow: inherit;
    flex-shrink: 0;
    flex-basis: 0;
}
.simplebar-height-auto-observer {
    box-sizing: inherit;
    display: block;
    opacity: 0;
    position: absolute;
    top: 0;
    left: 0;
    height: 1000%;
    width: 1000%;
    min-height: 1px;
    min-width: 1px;
    overflow: hidden;
    pointer-events: none;
    z-index: -1;
}
.simplebar-mask {
    direction: inherit;
    position: absolute;
    overflow: hidden;
    padding: 0;
    margin: 0;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    width: auto!important;
    height: auto!important;
    z-index: 0;
}
.simplebar-placeholder {
    max-height: 100%;
    max-width: 100%;
    width: 100%;
    pointer-events: none;
}
.custom-scroll .simplebar-track.simplebar-horizontal {
    height: 2px;
}
.simplebar-content {
    direction: inherit;
    box-sizing: border-box!important;
    position: relative;
    display: block;
    height: 100%;
    width: auto;
    visibility: visible;
    overflow: scroll;
    max-width: 100%;
    max-height: 100%;
}
.custom-scroll .simplebar-track.simplebar-horizontal .simplebar-scrollbar {
    height: 2px;
    top: 0px;
}
.custom-scroll .simplebar-track .simplebar-scrollbar {
    width: 2px;
    left: 0;
}
.custom-scroll .simplebar-track.simplebar-horizontal .simplebar-scrollbar:before {
    left: 0;
    right: 0;
}
.custom-scroll .simplebar-track .simplebar-scrollbar.simplebar-visible:before {
    opacity: 1;
}
.custom-scroll .simplebar-track .simplebar-scrollbar:before {
    border-radius: 0;
}
.simplebar-track.simplebar-horizontal .simplebar-scrollbar:before {
    height: 100%;
    left: 2px;
    right: 2px;
}
.simplebar-track .simplebar-scrollbar.simplebar-visible:before {
    opacity: .5;
    transition: opacity 0s linear;
}
.simplebar-scrollbar:before {
    position: absolute;
    content: "";
    background: #000;
    border-radius: 7px;
    left: 0;
    right: 0;
    opacity: 0;
    transition: opacity .2s linear;
}

.custom-scroll .simplebar-track .simplebar-scrollbar {
    width: 2px;
    left: 0;
}
.simplebar-scrollbar {
    position: absolute;
    right: 2px;
    width: 7px;
    min-height: 10px;
}
.custom-scroll .simplebar-track.simplebar-vertical .simplebar-scrollbar:before {
    top: 0;
    bottom: 0;
}
.custom-scroll .simplebar-track .simplebar-scrollbar.simplebar-visible:before {
    opacity: 1;
}
.custom-scroll .simplebar-track .simplebar-scrollbar:before {
    border-radius: 0;
}
.simplebar-track .simplebar-scrollbar.simplebar-visible:before {
    opacity: .5;
    transition: opacity 0s linear;
}
.simplebar-scrollbar:before {
    position: absolute;
    content: "";
    background: #000;
    border-radius: 7px;
    left: 0;
    right: 0;
    opacity: 0;
    transition: opacity .2s linear;
}
.wrap {
    display: -webkit-box;
    display: -ms-flex;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: start;
    -ms-flex-pack: start;
    justify-content: flex-start;
    -webkit-box-align: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
    -ms-flex-line-pack: stretch;
    align-content: stretch;
    position: relative;
    min-width: 1440px;
    font-size: 0;
}
.simplebar-offset {
    direction: inherit!important;
    box-sizing: inherit!important;
    resize: none!important;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    padding: 0;
    margin: 0;
    -webkit-overflow-scrolling: touch;
}
.smart-search-wrap .search-item-wrap .search-item .search-subtitle {
    position: relative;
    display: block;
    margin-top: 5px;
    font-size: 14px;
    letter-spacing: -.7px;
    font-weight: 500;
    color: #333;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 0px;
    
}
ol, ul {
    list-style: none;
    line-height:130%;
}
.smart-search-wrap .search-item-wrap .search-item .filter-content .brand-list li .item input {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
}
.smart-search-wrap .search-item-wrap .search-item .filter-content .brand-list li .item input+label {
    display: block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
    font-size: 13px;
    color: #666;
}
.btn-line {
    color: #000;
    background-color: #fff;
    border-color: #000;
}
.smart-search-wrap .keyword-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin-top: 29px;
    border-top: 1px solid #ededed;
    padding-top: 30px;
}
.smart-search-wrap .keyword-wrap .title-box {
    width: 245px;
}
.smart-search-wrap .keyword-wrap .title-box .title {
    font-weight: 500;
    font-size: 15px;
    letter-spacing: -.75px;
    padding-right: 0;
}
.smart-search-wrap .keyword-wrap .title-box .title-desc {
    color: #999;
    margin-top: 9px;
    font-size: 14px;
    letter-spacing: -.7px;
}
.smart-search-wrap .keyword-wrap .keyword-input-box {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
}
.smart-search-wrap .keyword-wrap .keyword-input-box .ui-input {
    width: calc(100% - 120px);
    display:inline;
}
.input-wrap input:placeholder-shown, .input-wrap textarea:placeholder-shown {
    border-color: #d5d5d5;
}
.input-wrap input, .input-wrap textarea {
    color: #000;
    height: 38px;
    border: 1px solid #000;
    padding: 0 11px;
}
.input-wrap input {
    line-height: 36px;
}
.smart-search-wrap .filter-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    min-height: 90px;
    margin-top: 30px;
    padding: 29px 0px 29px 33px;
    border: 6px solid #e5e5e5;
}
.smart-search-wrap .filter-wrap .title-box {
    padding-right: 48px;
}
.smart-search-wrap .filter-wrap .title-box .title {
    display: block;
    font-size: 14px;
    letter-spacing: -.7px;
    font-weight: 500;
}
.smart-search-wrap .search-btn-wrap {
    margin-top: 40px;
    text-align: center;
}
.smart-search-wrap .keyword-wrap .title-box .title, .smart-search-wrap .keyword-wrap .title-box .title-desc {
    display: block;
}
.smart-search-wrap .search-item-wrap .search-item .filter-content .brand-list li .item input:checked+label {
    font-weight: 600;
    color: #ee1c25;
}
.filter-list {
    margin-top: -14px;
}
.smart-search-wrap .filter-wrap .filter-list {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
}
.filter-list li {
    display: inline-block;
    margin: 14px 24px 0 0;
    vertical-align: top;
}
.filter-list li .filter-item {
    display: block;
}
.filter-list li .filter-item .filter-title {
    display: inline-block;
    font-size: 14px;
    letter-spacing: -.7px;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
    vertical-align: top;
    line-height: 20px;
}
.filter-list li .filter-item .btn-filter-del {
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-left: 8px;
    border: 1px solid #e5e5e5;
    background: url(./resources/images/free-icon-x-mark-482641.png) center no-repeat;
    vertical-align: top;
}
.btn-filter-del{
	font-size:0px;
}
.prod-category-smart-search .smart-search-result .title-box .title {
    padding-right: 53px;
    font-family: "Montserrat",sans-serif;
    font-weight: 700;
    color: #000;
    letter-spacing: 0;
}
.prod-category-smart-search .smart-search-result .title-box {
    font-size: 14px;
    letter-spacing: -.35px;
    color: #666;
}
.smart-search-result .search-btn-wrap {
    margin-top: 30px;
    text-align: center;
}	


</style>
<script type ="text/javascript" src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


function create_list(){
	$('.content').empty();
	jQuery.ajax({
		 url : 'home_listAjax.bo',
         type : 'POST',
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
         dataType : 'json',
         success : function (data) {
        	 var thead = '';
        	 thead += '<th>번호 </th>'
        	 thead += '<th colspan="2">제목 </th>'
        	 thead += '<th>분양가 </th>'
        	 thead += '<th>닉네임 </th>'
        	 thead += '<th>작성일자 </th>'
         	 thead += '<th>조회수 </th>'
         	 
         	 $('.content').append(thead);
        	 $.each(data, function(index, item){
        		var output = '';
        		
				
                output += '<tr>';
                output += '<td class ="line">' + item.home_no +'</td>'
                output += '<td class ="line"><a href = "adopthomeview.bo?num='+item.home_no+'">' + item.home_thumbnail +'</a></td>'
                output += '<td class ="line" valign="middle"><a href = "adopthomeview.bo">' + item.home_subject +'</a></td>'
                output += '<td class ="line">' + item.home_price + '</td>'  
                output += '<td class ="line">' + item.home_nick + '</td>'
                output += '<td class ="line">' + item.home_date + '</td>'
                output += '<td class ="line">' + item.home_readcount + '</td>'
                output += '</tr>';
                
                $('.content').append(output);
        	 });
         },
         error:function(){
             alert("ajax통신 실패!!!");
          }
	});
	
}

$(document).ready(function(){
	 $(document).on('click', '.cardview', function(event){
		 $('.boardtable').empty();
		 $('.content').empty();
		 jQuery.ajax({
			 url : 'home_listAjax.bo',
	         type : 'POST',
	         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	         dataType : 'json',
	         success : function (data) {
	        	
	            $.each(data, function(index, item){
	            	var output='';
	            	
	            	output += '<a href="">' //클릭 시 링크 설정

	            	output +='<div class="card">'


	            	
	            	//카드 헤더 

	            	 output +='<div class="card-header" >'
	            	 
	            	 output += '<span>'+item.home_thumbnail +'</span>'

	            	 output +='<div class = "card-header-is_closed" >'
					
	            	  
	            	 output +='<div class = "card-header-text" > 모집중 </div >'

	            	 output +='<div class = "card-header-number" > 2 / 5 </div > '

	            	 output +='</div >'

	            	 output +='</div>'



	            	// 카드 바디 

	            	 output +='<div class="card-body">'



	            		//카드 바디 헤더

	            		 output +='<div class="card-body-header">'

	            			 output +='<h1>4월 15일 순천만 동행구해요!</h1>'

	            			 output +='<p class="card-body-hashtag">#여수 #순천 #광양</p>'

	            			 output +='<p class = "card-body-nickname"> '

	            			 output +=  '작성자: ENDORPHIN0710'

	                         output +='</p>'

	                         output +='</div>'

	                         output +='<p class="card-body-description">'

	                         output +='안녕하세요!'

	                         output +='4월 15일 순천만 동행구합니다!'

	            			 output +='</p>'

	            			//카드 바디 본문



	            			//카드 바디 푸터 -->

	            			 output +='<div class="card-body-footer">'

	            			 output +='<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">'

	            			 output +='<i class="icon icon-view_count">'+item.home_readcount +'</i>'

	            			 output +='<i class="icon icon-comments_count"></i>댓글 4개'

	            			 output +='<i class="reg_date"> 2018/04/12 </i>'

	            			 output +='</div>'



	            			output +='</div>'



	            			output +='</div>'

	            		    output +='</a>'

                  $('.content').append(output);
	         	});
	         },
	         error:function(){
	             alert("ajax통신 실패!!!");
	          }
		 });
		 event.preventDefault();
	 });
	 create_list();
	 
	 
	 $("input:checkbox[name='chkBrandAModule']").change(function(){
	        if($(this).is(":checked")){
	            
	            var home_kindof = $(this).val();
	            var home_kindno = $(this).attr('id');
	            
	            var a = '';
	            a += '<li id="li_'+home_kindno+'" class="smart-search-selected-condition-item option-type-brand">';
	            a += '<span class="filter-item"><span class="filter-title">'+home_kindof+'</span>';
	            a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
	            a += '<input type="hidden" name="kind_search" value="'+home_kindof+'"></span></li>';
				
	            $(".filter-list").append(a);
	        }else{
	        	var home_kindno = $(this).attr('id');
	            $('.filter-list').children('#li_'+home_kindno).remove();
	           
	        }
	    });
	 
	 $("input:checkbox[name='chkloc']").change(function(){
	        if($(this).is(":checked")){
	            
	            var home_loc = $(this).val();
	            var home_locno = $(this).attr('id');
	            
	            var a = '';
	            a += '<li id="li_'+home_locno+'" class="smart-search-selected-condition-item option-type-brand">';
	            a += '<span class="filter-item"><span class="filter-title">'+home_loc+'</span>';
	            a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
	            a += '<input type="hidden" name="kind_loc" value="'+home_loc+'"></span></li>';
				
	            $(".filter-list").append(a);
	        }else{
	        	var home_locno = $(this).attr('id');
	            $('.filter-list').children('#li_'+home_locno).remove();
	           
	        }
	    });
		
		$(document).on('click','.btn-filter-del',function(){
			var home_kindno = $(this).parent().parent().attr('id');
			 $('.filter-list').children('#'+home_kindno).remove();
			 home_kindno = home_kindno.substring(3);
			 $("input:checkbox[id='"+home_kindno+"']").prop('checked',false);
			
			 
			event.preventDefault();
		});
	 
	 $(document).on('click','#default_button',function(){
			var home_search =$('#default_search').val();
			if(home_search != ''){
			var a = '';
	         a += '<li id="li_'+home_search+'" class="smart-search-selected-condition-item option-type-brand">';
	         a += '<span class="filter-item"><span class="filter-title">'+home_search+'</span>';
	         a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
	         a += '<input type="hidden" name="home_search" value="'+home_search+'"></span></li>';
	         
	         $(".filter-list").append(a);
	         $('#default_search').val('');
			}
			event.preventDefault();
		});
	 
	 $(document).on('click','#detail_button',function(){
			var home_search =$('#detail_search').val();
			if(home_search != ''){
			var a = '';
	        a += '<li id="li_'+home_search+'" class="smart-search-selected-condition-item option-type-brand">';
	        a += '<span class="filter-item"><span class="filter-title">'+home_search+'</span>';
	        a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
	        a += '<input type="hidden" name="home_search" value="'+home_search+'"></span></li>';
	        
	        $(".filter-list").append(a);
	        $('#detail_search').val('');
			}
			event.preventDefault();
		});
});

function option(){
	
	($('#option').attr('class') == 'prod-category-smart-search smart-search-filter include-type')? $('#option').attr('class','prod-category-smart-search smart-search-filter include-type active') : $('#option').attr('class','prod-category-smart-search smart-search-filter include-type');
	($('#search').css('display') == 'block')? $('#search').css('display','none') : $('#search').css('display','block');
}
function reset(){
	sessionStorage.removeItem("default_option");
	sessionStorage.removeItem("detail_option");
	 $(".filter-list").empty();
	 $("input:checkbox[name='chkBrandAModule']").prop('checked',false);
	 $("input:checkbox[name='chkloc']").prop('checked',false);
}
function search(){
	var search = $('#smartSearchForm').serialize();
	alert(search);
	
}
function default_submit(){
	sessionStorage.removeItem("default_option");
	sessionStorage.removeItem("detail_option");
	$('#default_form').submit();
	var default_option = $('#default_option').html();
	sessionStorage.setItem('default_option',default_option);
}
function detail_submit(){
	sessionStorage.removeItem("detail_option");
	sessionStorage.removeItem("default_option");
	$('#detail_form').submit();
	var detail_option = $('#detail_option').html();
	sessionStorage.setItem('detail_option',detail_option);
}
function search_submit(a){
	
	$('#default_form').attr('action',"./home_search.bo?page="+a);
	$('#default_form').submit();
	var default_option = $('#default_option').html();
	sessionStorage.setItem('default_option',default_option);
}

</script>
</head>
<body>

	<div id="copy"></div>
	<div id="menubar">
	</div>
	
	<div class="prod-category-smart-search smart-search-filter include-type" id="option">
<div id="search" class="smart-search-result bare-smart-filter">
<form id="default_form" method="post" action="home_search.bo">
		<div class="keyword-wrap">
			<div class="title-box">
				<span class="title">검색어 추가</span>
				<span class="title-desc">함께 찾고 싶은 검색어를 입력해주세요.</span>
			</div>
			<div class="keyword-input-box input-wrap">
				<input id="default_search" type="text" class="ui-input filter-search-word" placeholder="검색어를 입력해주세요" title="검색어 입력" onsubmit="return false;">
				<button id="default_button" type="button" class="btn btn-sm add-filter-search-word-btn">추가</button>
			</div>
		</div>
		<div class="left-box">
			<div class="title-box"><span class="title">선택한 조건</span></div>
			<div class="filter-box">
				<ul id="default_option" class="filter-list smart-search-selected-condition-list"></ul>
			</div>
		</div>
		</form>
		<div class="search-btn-wrap">
				<button type="button" class="btn btn-line smart-search-clear-btn" onclick="reset();">초기화</button>
				<button type="button" class="btn smart-search-submit-btn" onclick="default_submit();">검색</button>
			</div>
		
	</div>
	
	
	
	<div class="smart-search-detail" id="smart-search-detail">
		<div class="smart-search-wrap smart-search-include-wrap no-category">
			<form id="tmp2">
			<div class="search-item-wrap">
				
					<div class="search-item brand">
						<span class="search-title">강아지</span>
						<div class="filter-content custom-scroll" data-simplebar="init">
						<div class="simplebar-wrapper" style="margin: 0px -20px 0px 0px;">
						<div class="simplebar-height-auto-observer-wrapper">
						<div class="simplebar-height-auto-observer">
						</div></div><div class="simplebar-mask">
						<div class="simplebar-offset" style="right: -20px; bottom: 0px;">
						<div class="simplebar-content" style="padding: 0px calc(40px) 0px 0px; height: 100%; overflow: hidden scroll;">
						<div class="custom-scroll-inner" style="position: relative;">
						<div class="filter-content-inner">
						
						<ul class="brand-list smart-search-dialog-brand-list-A">
						<li class="smart-search-option" id="">
						<span class="item">
						<input id="dog1" type="checkbox" name="chkBrandAModule" value="포메라니안">
						<label for="dog1">포메라니안</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog2" type="checkbox" name="chkBrandAModule" value="치와와">
						<label for="dog2">치와와</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog3" type="checkbox" name="chkBrandAModule" value="미니어처 핀셔(미니핀)">
						<label for="dog3">미니어처 핀셔(미니핀)</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog4" type="checkbox" name="chkBrandAModule" value="파피용">
						<label for="dog4">파피용</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog5" type="checkbox" name="chkBrandAModule" value="토이 푸들">
						<label for="dog5">토이 푸들</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog6" type="checkbox" name="chkBrandAModule" value="미니어처 닥스훈트">
						<label for="dog6">미니어처 닥스훈트</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog7" type="checkbox" name="chkBrandAModule" value="요크셔테리어">
						<label for="dog7">요크셔테리어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog8" type="checkbox" name="chkBrandAModule" value="말티즈">
						<label for="dog8">말티즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog9" type="checkbox" name="chkBrandAModule" value="비숑 프리제">
						<label for="dog9">비숑 프리제</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog10" type="checkbox" name="chkBrandAModule" value="미니어쳐 슈나우저">
						<label for="dog10">미니어쳐 슈나우저</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog11"type="checkbox" name="chkBrandAModule" value="페키니즈">
						<label for="dog11">페키니즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog12" type="checkbox" name="chkBrandAModule" value="꼬똥 드 툴레아">
						<label for="dog12">꼬똥 드 툴레아</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog13" type="checkbox" name="chkBrandAModule" value="퍼그">
						<label for="dog13">퍼그</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog14" type="checkbox" name="chkBrandAModule" value="웰시 코기">
						<label for="dog14">웰시 코기</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog15" type="checkbox" name="chkBrandAModule" value="프렌치 불독">
						<label for="dog15">프렌치 불독</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog16" type="checkbox" name="chkBrandAModule" value="비글">
						<label for="dog16">비글</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog17" type="checkbox" name="chkBrandAModule" value="코카 스파니엘">
						<label for="dog17">코카 스파니엘</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog18" type="checkbox" name="chkBrandAModule" value="보스턴 테리어">
						<label for="dog18">보스턴 테리어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog19" type="checkbox" name="chkBrandAModule" value="셔틀랜드 쉽독">
						<label for="dog19">셔틀랜드 쉽독</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog20" type="checkbox" name="chkBrandAModule" value="이탈리안 그레이하운드">
						<label for="dog20">이탈리안 그레이하운드</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog21" type="checkbox" name="chkBrandAModule" value="스코티시 테리어">
						<label for="dog21">스코티시 테리어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog22" type="checkbox" name="chkBrandAModule" value="베들링턴 테리어">
						<label for="dog22">베들링턴 테리어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog23" type="checkbox" name="chkBrandAModule" value="시바이누">
						<label for="dog23">시바이누</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog24" type="checkbox" name="chkBrandAModule" value="볼테리어">
						<label for="dog24">불테리어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog25" type="checkbox" name="chkBrandAModule" value="보더콜리">
						<label for="dog25">보더콜리</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="dog26" type="checkbox" name="chkBrandAModule" value="시추">
						<label for="dog26">시추</label>
						</span>
						</li>
						</ul>
						</div><div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div></div></div></div>
							
						</div></div></div><div class="simplebar-placeholder" style="width: 353px; height: 1809px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"></div></div>
					</div>
				
				<div class="search-item brand">
						<span class="search-title">고양이</span>
						<div class="filter-content custom-scroll" data-simplebar="init">
						<div class="simplebar-wrapper" style="margin: 0px -20px 0px 0px;">
						<div class="simplebar-height-auto-observer-wrapper">
						<div class="simplebar-height-auto-observer">
						</div></div><div class="simplebar-mask">
						<div class="simplebar-offset" style="right: -20px; bottom: 0px;">
						<div class="simplebar-content" style="padding: 0px calc(40px) 0px 0px; height: 100%; overflow: hidden scroll;">
						<div class="custom-scroll-inner" style="position: relative;">
						<div class="filter-content-inner">
						
						<ul class="brand-list smart-search-dialog-brand-list-A">
						<li class="smart-search-option" id="">
						<span class="item">
						<input id="cat1" type="checkbox" name="chkBrandAModule" value="노르웨이 숲 고양이">
						<label for="cat1">노르웨이 숲 고양이</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat2" type="checkbox" name="chkBrandAModule" value="데본렉스">
						<label for="cat2">데본렉스</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat3" type="checkbox" name="chkBrandAModule" value="라가머핀">
						<label for="cat3">라가머핀</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat4" type="checkbox" name="chkBrandAModule" value="라팜">
						<label for="cat4">라팜</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat5" type="checkbox" name="chkBrandAModule" value="렉돌">
						<label for="cat5">렉돌</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat6" type="checkbox" name="chkBrandAModule" value="러시안블루">
						<label for="cat6">러시안블루</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat7" type="checkbox" name="chkBrandAModule" value="메인쿤">
						<label for="cat7">메인쿤</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat8" type="checkbox" name="chkBrandAModule" value="발리네즈 고양이">
						<label for="cat8">발리네즈 고양이</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat9" type="checkbox" name="chkBrandAModule" value="버만">
						<label for="cat9">버만</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat10" type="checkbox" name="chkBrandAModule" value="버미즈">
						<label for="cat10">버미즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat11" type="checkbox" name="chkBrandAModule" value="봄베이">
						<label for="cat11">봄베이</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat12" type="checkbox" name="chkBrandAModule" value="브리티쉬 숏 헤어">
						<label for="cat12">브리티쉬 숏 헤어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat13" type="checkbox" name="chkBrandAModule" value="샤트룩스">
						<label for="cat13">샤트룩스</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat14" type="checkbox" name="chkBrandAModule" value="샴">
						<label for="cat14">샴</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat15" type="checkbox" name="chkBrandAModule" value="셀커크  렉스">
						<label for="cat15">셀커크 렉스</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat16" type="checkbox" name="chkBrandAModule" value="소말리">
						<label for="cat16">소말리</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat17" type="checkbox" name="chkBrandAModule" value="스코티쉬 폴드">
						<label for="cat17">스코티쉬 폴드</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat18" type="checkbox" name="chkBrandAModule" value="스핑크스">
						<label for="cat18">스핑크스</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat19" type="checkbox" name="chkBrandAModule" value="시베리아">
						<label for="cat19">시베리아</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat20" type="checkbox" name="chkBrandAModule" value="아메리칸 밥테일">
						<label for="cat20">아메리칸 밥테일</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat21" type="checkbox" name="chkBrandAModule" value="아메리칸 숏헤어">
						<label for="cat21">아메리칸 숏헤어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat22" type="checkbox" name="chkBrandAModule" value="아메리칸 와이어헤어">
						<label for="cat22">아메리칸 와이어헤어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat23" type="checkbox" name="chkBrandAModule" value="아메리칸 컬">
						<label for="cat23">아메리칸 컬</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat24" type="checkbox" name="chkBrandAModule" value="아비니시안">
						<label for="cat24">아비니시안</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat25" type="checkbox" name="chkBrandAModule" value="오시캣">
						<label for="cat25">오시캣</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat26" type="checkbox" name="chkBrandAModule" value="유러피안 버미즈">
						<label for="cat26">유러피안 버미즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat27" type="checkbox" name="chkBrandAModule" value="이그저틱">
						<label for="cat27">이그저틱</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat28" type="checkbox" name="chkBrandAModule" value="이집션 마우">
						<label for="cat28">이집션 마우</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat29" type="checkbox" name="chkBrandAModule" value="재패니즈밥테일">
						<label for="cat29">재패니즈밥테일</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat30" type="checkbox" name="chkBrandAModule" value="컬러포인트쇼트헤어">
						<label for="cat30">컬러포인트쇼트헤어</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat31" type="checkbox" name="chkBrandAModule" value="코니시 렉스"> 
						<label for="cat31">코니시 렉스</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat32" type="checkbox" name="chkBrandAModule" value="코랫">
						<label for="cat32">코랫</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="터키시 반">
						<label for="ibrand2">터키시 반</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="터키쉬 앙고라">
						<label for="ibrand2">터키쉬 앙고라</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="통키니즈">
						<label for="ibrand2">통키니즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="페르시안">
						<label for="ibrand2">페르시안</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="하바나 브라운">
						<label for="ibrand2">하바나 브라운</label>
						</span>
						</li>
						
						<li class="smart-search-option">
						<span class="item"><input type="checkbox" name="chkBrandAModule" value="자바니즈">
						<label for="ibrand2">자바니즈</label>
						</span>
						</li>
						</ul>
						</div><div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div></div></div></div>
							
						</div></div></div><div class="simplebar-placeholder" style="width: 353px; height: 1809px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"></div></div>
					</div>
					
						<div class="search-item brand">
						<span class="search-title">지역</span>
						<div class="filter-content custom-scroll" data-simplebar="init">
						<div class="simplebar-wrapper" style="margin: 0px -20px 0px 0px;">
						<div class="simplebar-height-auto-observer-wrapper">
						<div class="simplebar-height-auto-observer">
						</div></div><div class="simplebar-mask">
						<div class="simplebar-offset" style="right: -20px; bottom: 0px;">
						<div class="simplebar-content" style="padding: 0px calc(40px) 0px 0px; height: 100%; overflow: hidden scroll;">
						<div class="custom-scroll-inner" style="position: relative;">
						<div class="filter-content-inner">
						
						<ul class="brand-list smart-search-dialog-brand-list-A">
						<li class="smart-search-option" id="">
						<span class="item">
						<input id="loc1" type="checkbox" name="chkloc" value="서울">
						<label for="loc1">서울</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc2" type="checkbox" name="chkloc" value="부산">
						<label for="loc2">부산</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc3" type="checkbox" name="chkloc" value="대구">
						<label for="loc3">대구</label>
						</span>
						</li>
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc4" type="checkbox" name="chkloc" value="인천">
						<label for="loc4">인천</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc5" type="checkbox" name="chkloc" value="광주">
						<label for="loc5">광주</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc6" type="checkbox" name="chkloc" value="대전">
						<label for="loc6">대전</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc7" type="checkbox" name="chkloc" value="울산">
						<label for="loc7">울산</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc8" type="checkbox" name="chkloc" value="세종">
						<label for="loc8">세종</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc9" type="checkbox" name="chkloc" value="경기">
						<label for="loc9">경기</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc10" type="checkbox" name="chkloc" value="강원">
						<label for="loc10">강원</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc11" type="checkbox" name="chkloc" value="충북">
						<label for="loc11">충북</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc12" type="checkbox" name="chkloc" value="충남">
						<label for="loc12">충남</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc13" type="checkbox" name="chkloc" value="전북">
						<label for="loc13">전북</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc14" type="checkbox" name="chkloc" value="전남">
						<label for="loc14">전남</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc15" type="checkbox" name="chkloc" value="경북">
						<label for="loc15">경북</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc16" type="checkbox" name="chkloc" value="경남">
						<label for="loc16">경남</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="loc17" type="checkbox" name="chkloc" value="제주">
						<label for="loc17">제주</label>
						</span>
						</li>
						
						</ul>
						</div><div dir="ltr" class="resize-sensor" style="position: absolute; inset: -10px 0px 0px -10px; overflow: hidden; z-index: -1; visibility: hidden;"><div class="resize-sensor-expand" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;"></div></div><div class="resize-sensor-shrink" style="position: absolute; left: -10px; top: -10px; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;"><div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div></div></div></div>
							
						</div></div></div><div class="simplebar-placeholder" style="width: 353px; height: 1809px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"></div></div>
					</div>
				
			</div>
			</form>
			<div class="keyword-wrap">
				<div class="title-box">
					<span class="title">검색어 추가</span>
					<span class="title-desc">함께 찾고 싶은 검색어를 입력해주세요.</span>
				</div>
				<div class="keyword-input-box input-wrap">
					<input id="detail_search" type="text" class="ui-input filter-search-word" placeholder="검색어를 입력해주세요" title="검색어 입력">
					<button id="detail_button" type="button" class="btn btn-sm add-filter-search-word-btn">추가</button>
				</div>
			</div>
			<form id="detail_form" method="post" action="home_search.bo">
				
				<div class="filter-wrap">
					<div class="title-box"><span class="title">선택한 조건</span></div>
					<ul id="detail_option" class="filter-list smart-search-selected-condition-list"></ul>
				</div>
			</form>
			<div class="search-btn-wrap">
				<button type="button" class="btn btn-line smart-search-clear-btn" onclick="reset();">초기화</button>
				<button type="button" class="btn smart-search-submit-btn" onclick="detail_submit();">검색</button>
			</div>
			
		</div>
		<!-- e : 190423 수정 // search-title-box 영역 삭제, 신발 category-list영역 col-6 클래스 추가, filter-wrap 영역 선택한 조건 타이틀 추가 -->
	</div>
	<button type="button" class="smart-search-toggle smart-filter-toggle-btn" onclick="option();"></button>
	</div>
	
          
	<div id="viewtrans">
		<input type = "button" value = "카드로 보기" style = "float:right;" class = "cardview">
		<input type = "button" value = "리스트로 보기" style = "float:right;" class = "listview" onclick = "create_list();">
	</div>
	<div class="content">
		
	</div>
	<div id="write">
		<input type = "button" value = "글작성" style = "float:right;" onclick="location.href='adopt_write.bo' ">
	</div>

</body>
</html>