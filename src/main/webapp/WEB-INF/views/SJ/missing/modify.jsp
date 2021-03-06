<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%
	String nick = (String) session.getAttribute("nick");
	String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<link href="${pageContext.request.contextPath}/resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

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
    height: 189px;
    box-sizing: content-box;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid #efefef;
    padding-bottom: 18px;
    background-color : #fff;
    position : fixed;
    z-index : 100;
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

.search-box.btn1 {
  color : #9494b8;
  text-align : left; 
}

/* search-wrqpper */

.main-content{
   width : 100%;
   height : auto;
   margin : 0 auto;
}


/* footer */
#footer {
    margin: 0 auto;
    width: fit-content;
    bottom: 20px;
    position: relative;
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
.list-group {
	border-bottom: 1px solid rgba(0,0,0,.125);
}
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
	
/* 각각의 페이지에서 사용할 CSS */
.list-group{
	border-bottom: 1px solid rgba(0,0,0,.125);
}
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
select, button, textarea {
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
    background: url(../../resources/img/m_merged.png) 0 0 no-repeat;
   
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
    background: url(../../resources/img/free-icon-x-mark-482641.png) center no-repeat;
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
    margin-bottom: 18px;
    padding-bottom:18px;
    border-bottom: 1px solid #efefef;
}
.tag{
	
	
	color:#5c5c8a;
}




.comment_view .list_comment>li {
	position: relative;
	padding: 0 45px;
}

.cont_comment .txt_date {
	color: #959595;
}

.comment_view {
	padding-top: 10px;
}

.comment_section .comment_info .comment_post .opt_more_g {
	margin-top: 0;
}

.comment_section .comment_post .opt_more_g {
	margin: 1px 4px 0 0;
}

.opt_more_g {
	float: left;
}

.comment_section .txt_date {
	font-size: 11px;
}

.comment_more {
	position: absolute;
	top: 18px;
	right: 0;
}

.comment_view .comment_section {
	display: table;
	width: 100%;
	position: relative;
	padding: 19px 0 16px;
	table-layout: fixed;
	box-sizing: border-box;
}

.comment_view .list_comment>li:after {
	position: absolute;
	bottom: 0;
	left: 72px;
	right: 30px;
	height: 1px;
	background-color: #eee;
	content: "";
}

.link_write:link, .link_write:visited {
	text-decoration: none;
	color: #666;
}

.link_write:hover {
	text-decoration: underline;
	color: #666;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.all dd, .all dl, .all dt, .all p, li, ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.comment_more .link_write {
	color: #666;
	float: left;
	margin-right: 10px;
}

.comment_section .comment_info .comment_post .ico_bbs {
	margin-top: 2px;
	margin-left: 1px;
}

.comment_re .comment_post+.comment_write {
	padding-top: 23px;
}

.ico_bbs.ico_lock {
	width: 14px;
	height: 14px;
	margin-top: 3px;
}

.ico_bbs {
	display: inline-block;
	vertical-align: top;
	text-indent: -9999px;
}

.ico_bbs.ico_lock {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/14_lock.svg);
}

body, button, div, input, select, table, td, textarea, th {

	-webkit-font-smoothing: antialiased;
}

body, div, table, td, th, tr {
	line-height: 1.6;
}

body {
	margin: 0;
	padding: 0;
	font-size: 13px;
}

.comment_section .comment_info .comment_post .ico_bbs.ico_new,
	.comment_section .comment_info .comment_post .ico_role,
	.comment_section .comment_info .comment_post .link_write,
	.comment_section .comment_info .comment_post .tag_comment,
	.comment_section .comment_info .comment_post .txt_date,
	.comment_section .comment_info .comment_post .txt_name {
	vertical-align: middle;
}

.comment_section .comment_post .box_post {
	overflow: hidden;
}

.comment_re {
	display: table;
	width: 100%;
	position: relative;
	padding: 19px 0 16px;
	table-layout: fixed;
	box-sizing: border-box;
	padding: 9px 0 14px 39px;
}

.comment_re .txt_date {
	font-size: 11px;
}

.comment_section .comment_post+.comment_write {
	padding-top: 23px;
}

.comment_section .comment_post+.comment_write {
	padding-top: 23px;
}

.comment_view .comment_write {
	padding: 0;
	margin-top: 0;
}

.cont_comment .comment_write {
	margin-top: 30px;
	padding: 0 30px;
	padding-bottom: 40px;
}

.cont_comment .inner_text_write {
	border-color: #efefef;
	background-color: #fff;
}

.text_write_g .inner_text_write {
	border: 1px solid #efefef;
	padding: 10px 10px 10px 16px;
	background-color: #fff;
	border-radius: 2px;
}

.text_write_g .wrap_menu {
	margin-top: 3px;
}

.text_write_g .wrap_menu .area_r {
	font-size: 0;
}

.text_write_g .wrap_menu .area_r .btn_item {
	margin: 8px 0 0 15px;
}

.text_write_g .wrap_menu .btn_item {
	vertical-align: top;
}

.btn_g_ico {
	margin: 0;
	padding: 0;
	cursor: pointer;
	border: 0;
	background-color: rgba(0, 0, 0, 0);
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
	background-color: -internal-light-dark(rgb(239, 239, 239),
		rgb(59, 59, 59));
	box-sizing: border-box;
	margin: 0em;
	font: 400 13.3333px Arial;
	padding: 1px 6px;
	border-width: 2px;
	border-style: outset;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
}

.btn_g_ico.ico_on .ico_lock_state {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_on.svg);
}

.ico_bbs.ico_lock_state {
	background:
		url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_default.svg);
}

.btn_g_ico.ico_on .ico_lock_state, .ico_bbs.ico_lock_state {
	width: 18px;
	height: 18px;
}

.text_write_g .wrap_menu .btn_group {
	display: inline-block;
	margin-left: 15px;
}

.text_write_g .box_textarea .info_text, .text_write_g .box_textarea textarea
	{
	width: 100%;
	height: 86px;
	padding: 0;
	border: 0;
	font-size: 13px;
	background-color: rgba(0, 0, 0, 0);
}

.comment_section .comment_info .desc_info {
	margin: 0px;
	font-size: 13px;
	word-break: break-all;
}

.comment_re .comment_info .desc_info {
	margin: 0px;
	font-size: 13px;
	word-break: break-all;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.text_write_g .box_textarea textarea {
	resize: none;
	vertical-align: top;
}

textarea {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: -internal-light-dark(black, white);
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: textarea;
	background-color: -internal-light-dark(rgb(255, 255, 255),
		rgb(59, 59, 59));
	-webkit-rtl-ordering: logical;
	flex-direction: column;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	margin: 0em;
	font: 400 13.3333px Arial;
	border-width: 1px;
	border-style: solid;
	border-color: -internal-light-dark(rgb(118, 118, 118),
		rgb(133, 133, 133));
	border-image: initial;
	padding: 2px;
	resize: none;
	vertical-align: top;
}

.comment_view .comment_write {
	padding: 0;
	margin-top: 0;
}

.cont_comment .area_r {
	float: right;
}

.text_write_g .wrap_menu:after {
	display: block;
	clear: both;
	content: "";
}

.btn_g.full_type1 {
	background-color: #ff5656;
	color: #fff;
	border: 0;
}

.btn_g {
	display: inline-block;
	height: 34px;
	padding: 6px 14px;
	border: 1px solid #e4e4e4;
	border-radius: 2px;
	cursor: pointer;
	box-sizing: border-box;
	font-size: 12px;
	text-align: center;
	line-height: 14px;
	vertical-align: middle;
}
.option-wrap{
display:inline-block;
float:right;
margin-right:40px;
}
select, input, button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.article-content{
	margin-bottom:60px;
}

.textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
    border: 1px solid #a9a9a9;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}
.content-form{
	padding-top:10px;
	padding-bottom:10px;

}
.option_box{
	margin-top:20px;
	margin-bottom:20px;
	padding: 15px 48px 20px 35px;
    border: 1px solid #a9a9a9;
}

.option_box div {
	margin: 10px 0px;
}
.option1{
	display:inline-block;
	padding-bottom:10px;
	margin-right:24px;
}


.option_lable {
	margin-right : 20px;
}

.prod-category-smart-search .smart-search-result .btn-box {
    margin-top: 40px;
    text-align: center;
}

.btn-box {
	margin-top: 40px;
	margin-bottom: 20px;
    text-align: center;
}


</style>
<link href="${pageContext.request.contextPath}/resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap"
	rel="stylesheet">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>


<!-- include libraries(jQuery, bootstrap) -->

</head>
<body>
<div class ="body_content">
<header id = "header">

	<div class ="inout_gocen">
			<%if(email != null){ %>
			
			<input  type="button" class= "header_btn"  value="로그아웃" onclick="location.href='${pageContext.request.contextPath}/logout.me'">
			<input  type="button" class= "header_btn"  value="마이페이지" onclick="location.href='${pageContext.request.contextPath}/mypage.me'">
			<%}else{ %>
			<input  type="button" class= "header_btn" value="로그인" onclick="location.href='${pageContext.request.contextPath}/loginForm.me'">
			<input  type="button" class= "header_btn" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/joinform.me'">
			<%} %>
			<a href="${pageContext.request.contextPath}/customer_service.me"><input type="button" class= "header_btn" id="gocen" value="고객센터"></a>
		</div>
	
	<div class="nav-menu">
				<ul class="sticky-wrapper">
               <li class="dropdown"><a href="${pageContext.request.contextPath}/home.me">HOME</a></li>
               <li class="dropdown"><a href="${pageContext.request.contextPath}/home_list.bo">분양</a>
						<ul class="dropdown-menu">
                     <li><a href="${pageContext.request.contextPath}/home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="${pageContext.request.contextPath}/fdoclist.bo">책임분양</a></li>
                     <li><a href="${pageContext.request.contextPath}/selladopt_list.bo">업체분양</a></li>
						</ul></li>
					<li class="dropdown"><a href="${pageContext.request.contextPath}//SJ/pet_list">보호소</a>
						<ul class="dropdown-menu care">
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/pet_list">보호소</a></li>
					<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/payang/list">파양</a></li>
					<li class="list-group-item click"><a href="${pageContext.request.contextPath}/SJ/missing/list">실종</a></li>
						</ul></li>
               <li class="dropdown"><a href="${pageContext.request.contextPath}/doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu commu">
                     <li><a href="${pageContext.request.contextPath}/doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="${pageContext.request.contextPath}/auth_fdoc.bo">책임분양인증</a></li>
						</ul></li>
				</ul>
	
	<div class="header-top">
		<div class="mainlogo">
		<a href="${pageContext.request.contextPath}/home.me">
		<img src = "${pageContext.request.contextPath}/resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/home_search.me" method="post" name="home_search">
            <div class="search-wrapper">
               <input class="search-box input"  id="keyword" name="keyword" type="text" placeholder="Search">
               <button class="search-box" type="submit">
                  <i class="fas fa-search"></i>
               </button>
            </div>
      </form>
      </div>
</header>
		
		<div class="main-content">
			<div class="content-wrap">
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/pet_list">보호소</a></li>
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/SJ/payang/list">파양</a></li>
				<li class="list-group-item click"><a href="${pageContext.request.contextPath}/SJ/missing/list">실종</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
				 <div style="margin-top:20px;">
				          <div class="col-lg-12">
				            <div class="section-title">
				              <span class="caption d-block small">보호소 > 실종게시판</span>
				            </div>
				            <div class="list_wrap">
				            <div class="list_content">
				<form id="board" action="${pageContext.request.contextPath}/SJ/missing/register"  method="POST">
					<input type="hidden" name="doc_nick" value="${nick}" />
					<input type="hidden" name="doc_email" value="${email }" />
<%-- 					<input type="text" name="doc_email" value="<%=email %>" /> --%>
					
					<textarea name="doc_subject" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;">${missing.doc_subject}</textarea>
					<div class="option_box">
						<div class="">
							<span class="option_lable">이름</span>
							<input type="text" name="doc_name" class="form-control" style="width:200px; display:inline-block;"
									value="${missing.doc_name}" />
	  	            	</div>
	  	            	
						<div class="">
							<span class="option_lable">성별</span>
							<input id="male" type="radio" name="doc_gender" value="암" <c:if test="${missing.doc_gender == '암'}">checked</c:if> /> <label for="male">암</label>
							<input id="female" type="radio" name="doc_gender" value="수" <c:if test="${missing.doc_gender == '수'}">checked</c:if> /> <label for="female">수</label>
	  	            	</div>
							
						<div class="">
							<span class="option_lable">축종</span>
							<select id="doc_big_name" name="doc_big_name" class="form-control" style="width:200px; display:inline-block;">
								<option value="개">개</option>
								<option value="고양이">고양이</option>
								<option value="기타">기타</option>
			   				 </select>		
						     <select id="doc_kind" name="doc_kind" class="form-control" style="width:200px; display:inline-block;">
								<option value="개">개</option>
								<option value="고양이">고양이</option>
								<option value="기타">기타</option>
			   				 </select>
						</div>
						
						<div class="">
							<span class="option_lable">나이</span>
							<input type="number" name="doc_age" autocomplete='off' class="form-control" style="width:200px; display:inline-block;"
									value="${missing.doc_age }" /> <br>
						</div>
					
						<div class="">
							<span class="option_lable">지역</span>
							<select name="doc_sido" class="form-control" autocomplete='off' style="width:200px; display:inline-block;" >
								<option value="서울">서울</option>
			   				 </select> 
			   				 <select name="doc_sigungu" class="form-control" autocomplete='off' style="width:200px; display:inline-block;" >
								<option value="강남구">강남구</option>
			   				 </select> 
			   				 <br>
			   				 <input type="text" name="doc_address" class="form-control" style="width:600px; display:inline-block; margin: 10px 50px 0px;"
			   				 		value="${missing.doc_address}" />	
						</div>
					
					</div>
					 <textarea id="summernote" name="doc_content">${missing.doc_content}</textarea>
					
					<div class="btn-box">
						<input type="submit" value="등록" class="btn btn-sm" />
						<button id="btnCancel" type="button" class="btn btn-sm">취소</button>
					</div>
				</form>	
				 
				 
				
				
			</div>
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
	
	<footer id="footer">
<p>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam

</footer>
</div><!-- 바디컨텐트 -->


<script>
	$(document).ready(function(){
		
		// 성별, 축종, 지역 초기화
		var doc_gender = "${missing.doc_gender}";
		var doc_big_name = "${missing.doc_big_name}";
		var doc_kind = "${missing.doc_kind}";
		var doc_sido = "${missing.doc_sido}";
		var doc_sigungu = "${missing.doc_sigungu}";
		
		if( doc_gender == '남' )	$("#male").attr("checked", "checked");
		if( doc_gender == '여' )	$("#female").attr("checked", "checked");
		
		$("#doc_big_name option[value='" + doc_big_name + "']").attr("selected","selected");
		$("#doc_kind option[value='" + doc_kind + "']").attr("selected","selected");
		$("#doc_sido option[value='" + doc_sido + "']").attr("selected","selected");
		$("#doc_sigungu option[value='" + doc_sigungu + "']").attr("selected","selected");
		
		
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
	        height: 600,                 // 에디터 높이
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        placeholder: '사진을 등록해주세요. 처음 등록되는 사진이 썸네일 사진으로 지정됩니다.',   //placeholder 설정
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
	         url: '${pageContext.request.contextPath}/image.bo',
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

