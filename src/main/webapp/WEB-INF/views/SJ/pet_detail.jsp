<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>보호소</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 템플릿  CSS -->

<link rel="stylesheet" href="./resources/fonts/icomoon/style.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->
	
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- modal -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>

@charset "utf-8";

* {
   margin:0;
   padding: 0;
}
html{
   margin:0 auto;
   width : 100%;
   height: 100%;
    overflow: auto;
}


body {
   margin: 0;
   height: auto;
    min-height : 600px;
    box-sizing : content-box;
   line-height: 1.7;
    color: gray;
      font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: .9rem;
}


a{
   text-decoration : none;
   color : #9494b8;
}
a:hover {
    color: #0056b3;
    text-decoration: none;
}

body {
   text-align: -webkit-center;
   display : flex;
   flex-direction : column;
   justify-content : space-between;
}

.body_content{
     margin : 0;
     padding : 0;
     width : 100%;
     height:100vh;
    display : flex;
    flex-direction : column;
}

#header {
    width: 100%;
    height: 190px;
    box-sizing: content-box;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid #efefef;
    padding-bottom: 18px;
    background-color : #fff;
    position : fixed;
    z-index : 10000;
    top : 0;
    left : 0;
    right : 0;
}

.inout_gocen{
   position : inline;
   display : flex;
   justify-content : flex-end;
   margin-top : 20px;
   margin-right : 340px;
   background-color : #fff;
}
.fixinner{
   position: fixed; 
}
.header-top {
   margin-top : -10px;
   display : flex;
   justify-content : flex-start;
   margin-right: auto;
}
.header_btn{
   width : 70px;
   height : 30px;
   background-color : #fff;
   color : #9494b8;
    border-radius: 5px;
    border : none;
    outline : 0;
}
.header_btn:hover{
   color : #6200cc;
   font-weight: 700;
}
#logout, #mypage{
   display : none;
}
.img-circle{
   width : 450px;
   height : 150px;
   display: block;
   margin : 0 auto;
}
.nav-menu{
   margin : 0 auto;
   display : flex;
   justify-content : space-around;
   align-items: baseline;
   width: 1200px;
}
.sticky-wrapper{
   width: 400px;
   height: 50px;
   margin : 0;
   margin-left: 0;
     position: sticky;
     list-style : none;
    display : flex;
    padding: 0;
}

.sticky-wrapper > li{
   padding : 8px 8px;
   list-style-type:none;
   float: left;
}
.sticky-wrapper > ul{
   padding : 8px 8px;
}

li.dropdown {
    color: #9494b8;
    background: #fff;
    transition: .3s all ease;
    font-size: 20px;
    width: 90px;
    height: 50px;
}

.sticky-wrapper.active{
   position: fixed;
    top: 0px;
}

/* dropdown */
.dropdown-menu {
   display: none;
      justify-content : flex-start;
   position: absolute;
   list-style : none;
    visibility: visible;
    background-color: #fff;
   width: 1200px;
   top : 48px;
   margin-left : -30px;
   border: none;
   border-top: 1px solid #efefef;
}

.board {
	padding-left: 46px;
}
.care {
	padding-left: 30px;
}
.commu {
	padding-left: 35px;
}

li.dropdown > a {
    text-decoration: none;
}

.dropdown-menu li{
   margin-right : 40px;
}
.dropdown:hover .dropdown-menu { 
   display: flex; 
   visibility: visible; 
}

/* search-wrapper */
.search-wrapper {
  padding : 5px;
  width: 280px;
  height: 38px;
  display: flex;
  justify-content : space-betwwen;
  background: #fff;
  border: 2px solid #9494b8;
  border-radius: 10px;
}
.search-box {
  height : 100%;
  padding: 0;
  border: none;
  background: #fff;
}
.search-box.input {
  width : 80%;
  margin-left : 15px;
  font-size : .9rem;
}
.search-box.input:focus {outline:none;}

.search-box.btn {
  color : #9494b8;
  text-align : left; 
}

/* search-wrqpper */

.main-content{
   width : 100%;
   height : auto;
   margin : 0 auto;
}


p{
   text-align : center;
}
.fa-heart{
   color : red;
}

/* pageup button */
.back-to-top{
   width : 40px;
   height : 40px;
   margin : 0 auto;
   font-size : 24px;
   color : white;
   background-color : #149DDD;
   border-radius : 50%;
   visibility : visible;
   position: fixed; 
   bottom: 45px; 
   right: 30px;
   text-align : center;
}
/* pageup button */
*, ::after, ::before {
    box-sizing: border-box;
}


/*카카오톡 톡상담*/
.kakaoChat {
    text-align: right;
    position: fixed;
    margin-right: 28px;
    bottom: 90px;
    right: 0;
}
.kakao_btn {
	border-radius: 1rem!important;
}

/* side menu와 내용 묶음 */
.content-wrap {
	width: 1200px;
	min-height: 100%;
	margin: 0 auto;
	position: relative;
	top: 50px;
	
}
/* side menu 틀*/
.sidemenu-section {
    width: 200px;
    font-size: 18px;
    text-align: left;
    min-height: 740px;
    border-right-color: darkblue;
    border-right: 1px solid #efefef;
    padding: 0px 0px 0 0;
    margin-left: 0;
    margin-top: 210px;
    position: fixed;
}


/* 내용 틀*/
.content-section {
    width: 1001px;
    height: max-content;
    position: relative;
    left: 100px;
    text-align: left;
    font-size: 14px;
    margin-top: 0px;
    color: black;
    margin-left: 0;
    padding-bottom: 100px;
    border-left-color: darkblue;
    border-left: 1px solid #efefef;
    padding-left: 50px;
    padding-right: 0;
    min-height: 940px;
    padding-top: 200px;
}

#footer {
    margin: 0 auto;
    width: fit-content;
    bottom: 20px;
    position: relative;
}

/* 각각의 페이지에서 사용할 CSS */
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: white;
    border: 1px solid rgba(0,0,0,.125);
}
/* 현재 페이지의 서브메뉴 */
li.list-group-item.click > a {
    font-weight: bold;
    color: #5c5c8a;
}

.list-group-item > a {
	text-decoration : none;
	}


    
ul {
	background-color: white;
}
.filter-list{
    background-color: white;
}



.brand-list{
	background-color: white;
}

/* header, footer 이외 css */




table {

    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
 
  }
  
th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  


.a_1{
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
/*
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
*/
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
    height: 220px;
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
.list_content{
	
	padding:15px 15px;
}
.list_wrap{
	border:1px solid #ededed;
}
.comment_icon{
	 background: url(./resources/images/free-icon-speech-bubble-2462719.png) center no-repeat;

	 display: inline-block;
    width: 16px;
    height: 16px;
   
}
.recount_icon{
	background: url(./resources/images/free-icon-eye-660022.png) center no-repeat;

	 display: inline-block;
    width: 16px;
    height: 16px;
}
.detail-read{
	float:right;
	margin-right:135px;
}
.section-title {
    color: #000;
    margin-bottom: 30px;
}
.section-title h2 {
	margin-top: 10px;
    font-size: 20px;
    font-weight: 400;
    position: relative;
    display: inline-block;
    border-bottom:none;
}
.post-entry-2 .thumbnail {
    background-size: cover;
    background-position: center;
    width: 30%;
   
}
.order-md-2 {
    -webkit-box-ordinal-group: 3;
    -ms-flex-order: 2;
    order: 2;
}
.post-entry-2 .contents {
    width: 70%;
    padding: 10px 20px;
}
.post-entry-2 .contents h2 {
    font-size: 15px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
    text-align:left;
    margin-top: 0;
    margin-bottom: 1rem;
}

.post-meta {
    font-size: .8rem;
}
.d-block {
    display: block!important;
}
.date-read {
    color: #b4b4b4;
}
.post-entry-1, .post-entry-2 {
    font-size: .9rem;
    margin-bottom: 30px;
}


/*  */
.btn-box {
	text-align : center;
	padding: 20px;
}


/* summernote */
.FlexableTextArea .textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
    border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}

.SmartEditor {
    margin-top: 12px;
    border: 1px solid #ebecef;
    border-bottom: 0;
    background: #fff;
}


.SmartEditor button {
	
}
	.tab-left, .tab-right {
		display: inline-block;
	    border: 1px solid black;
	    padding: 10px 20px;
	    width: 50%;
	    box-sizing: border-box;
	    position: relative;
	    text-align: center;
	    cursor: pointer;
	}
	
	.tab-left {
		float: left;
	}
	
	.tab-right {
		float: right;
	}


	.pet-search-option {
	    clear: both;
	    height: 65px;
	    text-align: center;
		border: 1px solid black;
	}
	
	.pet-search-option div {
		padding: 20px;
	}
	
	.pet-search-option .condition {
		position: absolute;
	    right: 0;
		cursor: pointer;
	}
	
	
	
	
	/* model */
	.modal-container{
		
	}
	
	.w3-modal {
		padding-top: 300px;
		z-index: 20000;
	}
	
	
	@media (min-width: 993px){
		.w3-modal-content {
			width: 600px;
		}
		
		.w3-container, .w3-panel {
			padding: 3.01em 16px;
		}
	}
	
	.condition-header {
		text-align: center;
	    padding: 20px;
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 25px;
	}
	
	.condition-btn {
		background: #2F9D27;
	    text-align: center;
	    padding: 20px;
	    font-size: 20px;
	    color: white;
	    cursor: pointer;
    }

	/* 펫 리스트 */
	.pet-empty {
	    border: 1px solid black;
	    padding: 10px;
	    text-align: center;
	}
	
	
	.pet-box {
	    border: 1px solid black;
    	height: 245px;
    	cursor: pointer;
	}
	
	.pet-img {
		padding:  20px;
		float: left;
	}
	
	
	.pet-box .pet-img, .pet-box .pet-content {
		display: inline-block;
	}
	
	.pet-box .pet-img img {
		width: 350px;
		height: 200px;
	}
	
	.pet-content {
		padding: 20px;
	}
	
	.pet-content span {
		display: block;
		padding: 8px 3px;
	}
	
	
	.select-box  {
		display: inline;
	}
	
	.select-box select {
		width: 160px;
	}
	
	.pet-search-option div {
		display: inline-block;
		
	} 
	

</style>
</head>
<script type="text/javascript">
	
	// 시/도 코드
	sidoCode = 0;
	// 상위축종 코드
	upKindCode = 0;
	
	//
	bgnde = '', endde = '';
	sido = '', siGunGu = '';
	upKind = '', kind = '';
	
	// 유기동물 상세정보
	age  = '';
	careAddr = '';
	careNm = '';
	careTel = '';
	chargeNm = '';
	colorCd = '';
	desertionNo = '';
	filename = '';
	happenDt = '';
	happenPlace = '';
	kindCd = '';			
	neuterYn = '';
	noticeEdt = '';
	noticeNo = '';
	noticeSdt = '';
	officetel = '';
	orgNm = '';
	popfile = '';
	processState = '';
	sexCd = '';
	specialMark = '';
	weight = '';
	
	$(document).ready(function(){
		console.log("ready!!!");
		
		// 시도 변경 시, 이벤트
		$('#sido').on('change', function() {
			sidoCode = $("#sido").val();
			console.log(sidoCode);
			
			getSiGunGu();
			
		});
		
		
		// 축종 변경 시, 이벤트
		$('#upKind').on('change', function() {
			upKindCode = $("#upKind").val();
			console.log(upKindCode);
			
			getKind();
			
		});
		
		
		// 검색 조건 클릭 이벤트
		$('#condition').on('click',function() {
			$('#modal').show();
		});
		
		// 검색하기 클릭 이벤트
		$('#condition-btn').on('click', function() {
			bgnde = $('#bgnde').val();
			endde = $('#endde').val();
			sido = $('#sido').val();
			siGunGu = $('#sigungu').val();
			upKind = $('#upKind').val();
			kind = $('#kind').val();
			
			console.log(bgnde + "," + endde+ "," + sido+ "," + siGunGu+ "," + upKind+ "," + kind)
			
			getAbandonment();			
			
		});
		
		$('.pet-box').on('click', function() {
			var box = $(this);
			var content = box.children(".pet-content");
			var hidden = box.children(".pet-hidden");
			
			console.log(content);
			console.log(hidden);
			
			kindCd = content.children(".animal-kindCd").text() ;
			sexCd = content.children(".animal-sexCd").text() ;
			happenDt = content.children(".animal-happenDt").text() ;
			orgNm = content.children(".animal-orgNm").text() ;
			happenPlace = content.children(".animal-happenPlace").text() ;
			
			
			age = hidden.children(".animal-age").text() ;
			careAddr = hidden.children(".animal-careAddr").text() ;
			careNm = hidden.children(".animal-careNm").text() ;
			careTel = hidden.children(".animal-careTel").text() ;
			chargeNm = hidden.children(".animal-chargeNm").text() ;
			colorCd = hidden.children(".animal-colorCd").text() ;
			desertionNo = hidden.children(".animal-desertionNo").text() ;
			neuterYn = hidden.children(".animal-neuterYn").text() ;
			noticeEdt = hidden.children(".animal-noticeEdt").text() ;
			noticeNo = hidden.children(".animal-noticeNo").text() ;
			noticeSdt = hidden.children(".animal-noticeSdt").text() ;
			officetel = hidden.children(".animal-officetel").text() ;
			popfile = hidden.children(".animal-popfile").text() ;
			processState = hidden.children(".animal-processState").text() ;
			specialMark = hidden.children(".animal-specialMark").text() ;
			weight = hidden.children(".animal-weight").text() ;
			
			location.href = "/samsam/SJ/pet_detail?"
					+ "kindCd=" + kindCd
					+ "&sexCd=" + sexCd
					+ "&happenDt=" + happenDt
					+ "&orgNm=" + orgNm
					+ "&age=" + age
					+ "&careAddr=" + careAddr
					+ "&careNm=" + careNm
					+ "&careTel=" + careTel
					+ "&chargeNm=" + chargeNm
					+ "&colorCd=" + colorCd
					+ "&desertionNo=" + desertionNo
					+ "&neuterYn=" + neuterYn
					+ "&noticeEdt=" + noticeEdt
					+ "&noticeNo=" + noticeNo
					+ "&noticeSdt=" + noticeSdt
					+ "&officetel=" + officetel
					+ "&popfile=" + popfile
					+ "&processState=" + processState
					+ "&specialMark=" + specialMark
					+ "&weight=" + weight;
			
		});
		
		
	});
	
	// 시군구 가져오기
	function getSiGunGu() {
		
		$.ajax({
			type: "POST"
			, url: "/samsam/SJ/SiGunGu"
			, data: {
				  sidoCode: sidoCode
				}  
			 , dataType: "html"
			, success: function( data ){
				console.log(data);
				$('#sigungu-select').empty();
				$('#sigungu-select').append(data);
				
			}	
			, error: function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				console.log("실패"); 
			}
		});
		
	}
	
	// 축종 가져오기
	function getKind() {
		
		$.ajax({
			type: "POST"
			, url: "/samsam/SJ/animalKind"
			, data: {
					upKindCode: upKindCode
				}  
			 , dataType: "html"
			, success: function( data ){
				console.log(data);
				$('#kind-select').empty();
				$('#kind-select').append(data);
			}	
			, error: function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				console.log("실패"); 
			}
		});
		
	}
	
	// 유기동물 정보 가져오기
	function getAbandonment() {
		
		$.ajax({
			type: "POST"
			, url: "/samsam/SJ/animalInfoList"
			, data: {
				bgnde : bgnde,
				endde : endde,
				sido : sido,
				siGunGu : siGunGu,
				upKind : upKind,
				kind : kind 
				}  
			, dataType: "html"
			, success: function( data ){
				// 동물리스트 초기화
				$('.pet-list').empty();
				
				// 동물리스트 추가
				$('.pet-list').append(data);
				
				console.log(data);
				
				// 모달 종료
				$('#modal').hide();
			}	
			, error: function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				console.log("실패"); 
			}
		});
		
	}
	
	
</script>

<body>
<div class ="body_content">
<!-- modal -->
<div class="modal-container">
	<div id="modal" class="w3-modal">
	  <div class="w3-modal-content">
	    <div class="w3-container">
	      <span onclick="document.getElementById('modal').style.display='none'" class="w3-button w3-display-topright">&times;</span>
	      <div class="condition-header">
	      	<span>검색조건 설정</span>
	      </div>
	      
	      <div class="condition-date">
	      	<span>기간 :</span>
	      	<span><input id="bgnde" type="date" name="bgnde" value="${firstDate}" /></span>
	      	<span>~</span>
	      	<span><input id="endde" type="date" name="endde" value="${lastDate}" /></span>
	      </div>
	      <hr>
	      
	      <div class="condition-org">
	      	<span>지역 :</span>
	      	<div id="sido-select" class="select-box">
			<select name="sido" id="sido">
					<option value="0" selected>모든 지역</option>
					<c:forEach var="sido" items="${sido}" varStatus="status">
					  <option value="${sido.sidoCode}">${sido.sidoNm}</option>
					</c:forEach>
				</select>
			</div>
			
			<div id="sigungu-select" class="select-box">
				<select name="siGunGu" id="siGunGu">
					<option value="0" selected>전 체</option>
				</select>
			</div>
	      </div>
	      <hr>
	      
	      <div class="condition-org">
	      	<span>축종 :</span>
	      	<div id="upkind-select" class="select-box">
				<select name="upKind" id="upKind">
					<option value="0" selected>모든 동물</option>
					<option value="417000" selected>개</option>
					<option value="422400" selected>고양이</option>
					<option value="429900" selected>기타</option>
				</select>
			</div>
			
	      	<div id="kind-select" class="select-box">
				<select name="kind" id="kind">
					<option value="0" selected>전체</option>
				</select>
			</div>
	      </div>
	      <hr>
	      
	      <div id="condition-btn" class="condition-btn">
	      	<span>검색하기</span>
	      </div>
	      
	      
	    </div>
	  </div>
	</div>
</div>
<header id = "header">

	<div class ="inout_gocen">
			<input type="button" class= "header_btn" id="login" value="로그인">
			<input type="button" class= "header_btn" id="logout" value="로그아웃">
			<input type="button" class= "header_btn" id="signin" value="회원가입">
			<input type="button" class= "header_btn" id="mypage" value="마이페이지">
			<input type="button" class= "header_btn" id="gocen" value="고객센터">
		</div>
	
	<div class="nav-menu">
				<ul class="sticky-wrapper">
					<li class="dropdown"><a href="main.me">HOME</a></li>
					<li class="dropdown"><a href="board.me">분양</a>
						<ul class="dropdown-menu">
							<li><a href="#">&nbsp;&nbsp;가정분양</a></li>
							<li><a href="#">책임분양</a></li>
							<li><a href="#">업체분양</a></li>
						</ul></li>
					<li class="dropdown"><a href="/SJ/pet_list">보호소</a>
						<ul class="dropdown-menu">
							<li><a href="/SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
							<li><a href="/SJ/payang">파양</a></li>
							<li><a href="/SJ/missing">실종</a></li>
						</ul></li>
					<li class="dropdown"><a href="community.me">커뮤니티</a>
						<ul class="dropdown-menu">
							<li><a href="#">&nbsp;자유게시판</a></li>
							<li><a href="#">책임분양인증</a></li>
						</ul></li>
				</ul>
	
	<div class="header-top">
		<div class="mainlogo">
		<a href="#">
		<img src = "${pageContext.request.contextPath}/resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	<div class= "search-wrapper">
      <input class="search-box input" type="text" placeholder="Search">
      <button class="search-box" type="button"><i class="fas fa-search"></i></button>
	</div>
	</div><!-- nav-menu -->
</header>
		
		<div class="main-content">
			<div class="content-wrap">
			
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
				<ul class="list-group list-group-flush">
					<li class="list-group-item click"><a href="/">보호소</a></li>
					<li class="list-group-item"><a href="/">파양</a></li>
					<li class="list-group-item"><a href="/">실종</a></li>
				</ul>
				</div>
				
				
				<!-- 오른쪽. 내용이 들어갈 부분 -->
				<div class="content-section">
					${animalInfo.age}
					${animalInfo.kindCd}
					${animalInfo.kindCd}
					${animalInfo.kindCd}
					${animalInfo.kindCd}
				
				</div>				
			</div>
	</div>
</div>

	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="${pageContext.request.contextPath}/resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>
	
	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
	</a>
	</div>
	
</div><!-- 바디컨텐트 -->
	
		
<footer id="footer">
<p>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam

</footer>


<!-- 제이쿼리 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script> -->
<script>
	$(document).ready(function(){
		$('#login').on('click', function(e){
		      $('#logout').show();
			  $('#mypage').show();
			  $('#login').hide();
			  $('#signin').hide();
		  });//헤더 상단 로그인 체인지
		
		$('#logout').on('click', function(e){
		       $('#logout').hide();
			   $('#mypage').hide();
			   $('#login').show();
			   $('#signin').show();
		});//헤더 상단 로그아웃 체인지
		
		$('#btnCancel').on('click', function(){
			location.href = "/samsam/SJ/payang/list";
		});
		
		
		// summernote
		$('#summernote').summernote({
		       toolbar: [
		            // [groupName, [list of button]]
		            ['fontname', ['fontname']],
		            ['fontsize', ['fontsize']],
		            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		            ['color', ['forecolor','color']],
		            ['table', ['table']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['height', ['height']],
		            ['insert',['picture','link','video']],
		            ['view', ['fullscreen', 'help']]
		          ],
		        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		        height: 300,                 // 에디터 높이
		        minHeight: null,             // 최소 높이
		        maxHeight: null,             // 최대 높이
		        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		        lang: "ko-KR",               // 한글 설정
		        placeholder: '최대 2048자까지 쓸 수 있습니다',   //placeholder 설정
		          callbacks: {
		               onImageUpload: function(files, editor, welEditable) {
		                     for (var i = files.length - 1; i >= 0; i--) {
		                        sendFile(files[i], this);
		                     }
		                 }
		            }
		          
		});
		
		
	}); 
	
	// 파일업로드
	function sendFile(file, el) {
	       var form_data = new FormData();
	       form_data.append('file', file);
	   
	       $.ajax({
	         data: form_data,
	         type: "post",
	         url: 'image.bo',
	         cache: false,
	         contentType: false,
	         enctype: 'multipart/form-data',
	         processData: false,
	         success: function(url) {
	               $(el).summernote('editor.insertImage', url);
	         }
	       });
	     }

</script>

<!-- 부트스트랩 4.0 js -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->

<!-- 카카오톡 채널 상담 js -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('be685f4c6119a7e447cd31c67878faf1');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    function plusFriendChat() {
        Kakao.Channel.chat({
              channelPublicId: '_cjxmxiK' // 카카오톡채널 홈 URL에 명시된 홈ID
        });
    }
    
  //]]>
</script>

</body>
</html>			

