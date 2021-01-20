<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.project.samsam.fdocboard.FdocVO" %>
<%
	List<FdocVO> fdoclist = (List<FdocVO>)request.getAttribute("fdoclist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
	DecimalFormat form = new DecimalFormat("###,###,###");
	FdocVO searchVO = (FdocVO)request.getAttribute("vo");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
<title>삼삼하개</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 템플릿  CSS -->
<!--  
<link rel="stylesheet" href="./resources/fonts/icomoon/style.css">
-->

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<!-- 부트스트랩 4.0 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script>
$(document).ready(function() {
	
	if(sessionStorage.getItem("default_option")!=null){
		var default_option = sessionStorage.getItem("default_option");
		 $(".filter-list").append(default_option);
		 //sessionStorage.removeItem("default_option");
	}
	
	if(sessionStorage.getItem("detail_option")!=null){
		var detail_option = sessionStorage.getItem("detail_option");
		 $(".filter-list").append(detail_option);
		// sessionStorage.removeItem("detail_option");
	}
	
	
	if(sessionStorage.getItem("card")=="card"){
		$('#card_table').show();
		$('#list_table').hide();
	}else{
		$('#card_table').hide();
		$('#list_table').show();
	}
	
	
	$("input:checkbox[name='chkBrandAModule']").change(function(){
        if($(this).is(":checked")){
            
            var fdoc_kindof = $(this).val();
            var fdoc_kindno = $(this).attr('id');
            
            var a = '';
            a += '<li id="li_'+fdoc_kindno+'" class="smart-search-selected-condition-item option-type-brand">';
            a += '<span class="filter-item"><span class="filter-title">'+fdoc_kindof+'</span>';
            a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
            a += '<input type="hidden" name="kind_search" value="'+fdoc_kindof+'"></span></li>';
			
            $(".filter-list").append(a);
        }else{
        	var fdoc_kindno = $(this).attr('id');
            $('.filter-list').children('#li_'+fdoc_kindno).remove();
           
        }
    });
	
	$("input:checkbox[name='chkloc']").change(function(){
        if($(this).is(":checked")){
            
            var fdoc_loc = $(this).val();
            var fdoc_locno = $(this).attr('id');
            
            var a = '';
            a += '<li id="li_'+fdoc_locno+'" class="smart-search-selected-condition-item option-type-brand">';
            a += '<span class="filter-item"><span class="filter-title">'+fdoc_loc+'</span>';
            a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
            a += '<input type="hidden" name="kind_loc" value="'+fdoc_loc+'"></span></li>';
			
            $(".filter-list").append(a);
        }else{
        	var fdoc_locno = $(this).attr('id');
            $('.filter-list').children('#li_'+fdoc_locno).remove();
           
        }
    });
	
	$(document).on('click','.btn-filter-del',function(){
		var fdoc_kindno = $(this).parent().parent().attr('id');
		 $('.filter-list').children('#'+fdoc_kindno).remove();
		 fdoc_kindno = fdoc_kindno.substring(3);
		 $("input:checkbox[id='"+fdoc_kindno+"']").prop('checked',false);
		
		 
		event.preventDefault();
	});
	
	
	$(document).on('click','#default_button',function(){
		var fdoc_search =$('#default_search').val();
		if(fdoc_search != ''){
		var a = '';
         a += '<li id="li_'+fdoc_search+'" class="smart-search-selected-condition-item option-type-brand">';
         a += '<span class="filter-item"><span class="filter-title">'+fdoc_search+'</span>';
         a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
         a += '<input type="hidden" name="fdoc_search" value="'+fdoc_search+'"></span></li>';
         
         $(".filter-list").append(a);
         $('#default_search').val('');
		}
		event.preventDefault();
	});
	
	$(document).on('click','#detail_button',function(){
		var fdoc_search =$('#detail_search').val();
		if(fdoc_search != ''){
		var a = '';
        a += '<li id="li_'+fdoc_search+'" class="smart-search-selected-condition-item option-type-brand">';
        a += '<span class="filter-item"><span class="filter-title">'+fdoc_search+'</span>';
        a += '<button class="btn-filter-del smart-search-selected-condition-delete-btn option-type-brand"></button>';
        a += '<input type="hidden" name="fdoc_search" value="'+fdoc_search+'"></span></li>';
        
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
	
	$('#default_form').attr('action',"./fdoc_search.bo?page="+a);
	$('#default_form').submit();
	var default_option = $('#default_option').html();
	sessionStorage.setItem('default_option',default_option);
}


</script>
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
    overflow: hidden;
}
a:hover {
    color: #0056b3;
    text-decoration: none;
}
body {
	margin: 0;
	height: 100vh;
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

body {
	text-align: -webkit-center;
}

.body_content {
	margin: 0;
	height: 100vh;
    min-height : 600px;
    box-sizing : content-box;
	line-height: 1.7;
    color: gray;
   	font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    font-size: .9rem;
    overflow:scroll;
}

#header {
    width: 100%;
    height: 190px;
    box-sizing: content-box;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid #efefef;
    padding-bottom: 20px;
}
.inout_gocen{
	position: fixed; 
	top : 20px;
	right : 390px;
}

.header-top {
	margin-top : 40px;
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
    line-height:1.6;
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
.dropdown-menu{
	display: none;
   	justify-content : flex-start;
	position: absolute;
	list-style : none;
    visibility: visible;
    background-color: rgb(0,0,0,0);
	width: 350px;
	top : 48px;
	padding: 5px;
	border: none;
}
.dropdown-menu li{
	margin-right : 40px;
}
.dropdown:hover .dropdown-menu { display: flex; visibility: visible;}


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
  color: #9494b8;
  text-align: left;
  height : 100%;
  padding: 0;
  border: none;
  background: #fff;
  display: inline-block;
  font-weight: 400;
  white-space: nowrap;
  vertical-align: middle;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: .25rem;
  transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
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



/* footer */
#footer {
	position: relative;
    margin: -15px auto;
    width: 100%;
    bottom: 0px;
    padding-bottom:10px;
    padding-top: 35px;
    z-index: -1;
    border-top: 1px solid #efefef;
    
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
    margin: 0 auto;
    position: relative;
    top: 50px;
    overflow: visible;
    margin-bottom: 100px;

}


/* side menu 틀*/
.sidemenu-section {
  width: 200px;
	position: absolute;
	font-size: 18px;
	text-align: left;
	height: 100%;
	padding: 0px 0px 0 0;
	margin-left: 0;
}

/* 내용 틀*/
.content-section {
	width: 1000px;
	position: relative;
	left: 200px;
	text-align: left;
	font-size: 14px;
	margin-top: 3px;
	color: black;
	padding-left: 50px;
	border-left: 1px solid #efefef;
}

/* 각각의 페이지에서 사용할 CSS */
.list-group{
	margin-block-start: 0;
	line-height:1.6;
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
    background: url(./resources/img/m_merged.png) 0 0 no-repeat;
   
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
    background: url(./resources/img/free-icon-x-mark-482641.png) center no-repeat;
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

.comment_icon{
	 background: url(./resources/img/free-icon-speech-bubble-2462719.png) center no-repeat;

	 display: inline-block;
    width: 16px;
    height: 16px;
   
}
.recount_icon{
	background: url(./resources/img/free-icon-eye-660022.png) center no-repeat;

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
    margin-bottom: 18px;
    padding-bottom:18px;
    border-bottom: 1px solid #efefef;
}
.tag{
	
	
	color:#5c5c8a;
}

</style>
</head>
<body>
<div class ="body_content">
<header id = "header">

		<div class ="inout_gocen">
			<input type="button" class= "header_btn" id="login" value="로그인" onclick = "location.href='loginForm.me'">
			<input type="button" class= "header_btn" id="logout" value="로그아웃" onclick ="location.href='logout.me'">
			<input type="button" class= "header_btn" id="signin" value="회원가입" onclick = "location.href='joinform.me'">
			<input type="button" class= "header_btn" id="mypage" value="마이페이지" onclick = "location.href='mypage.me'">
			<input type="button" class= "header_btn" id="gocen" value="고객센터" onclick ="location.href='customer_service.me'">
		</div>

		 <div class="nav-menu">
            <ul class="sticky-wrapper">
               <li class="dropdown"><a href="home.me">HOME</a></li>
               <li class="dropdown"><a href="home_list.bo">분양</a>
                  <ul class="dropdown-menu">
                     <li><a href="home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="fdoclist.bo">책임분양</a></li>
                     <li><a href="selladopt_list.bo">업체분양</a></li>
                  </ul></li>
               <li class="dropdown"><a href="/SJ/pet_list">보호소</a>
                  <ul class="dropdown-menu">
                     <li><a href="/SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
                     <li><a href="/SJ/payang/list">파양</a></li>
                     <li><a href="/SJ/missing/list">실종</a></li>
                  </ul></li>
               <li class="dropdown"><a href="doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu">
                     <li><a href="doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="auth_fdoc.bo">책임분양인증</a></li>
                  </ul></li>
            </ul>


				<div class="header-top">
					<div class="mainlogo">
						<a href="home.me"> <img src="resources/img/mainlogo.png"
							class="img-circle">
						</a>
					</div>
				</div>
	<div class= "search-wrapper">
      <input class="search-box input" type="text" placeholder="Search">
      <button class="search-box" type="button"><i class="fas fa-search"></i></button>
	</div>
	</div><!-- nav-menu -->
</header>
		
		
			<div class="content-wrap">
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="home_list.bo">가정분양</a></li>
				<li class="list-group-item click"><a href="fdoclist.bo">책임분양</a></li>
				<li class="list-group-item"><a href="selladopt_list.bo">업체분양</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
			<div><div class="content-inner prod-category">
<div class="prod-category-smart-search smart-search-filter include-type" id="option">
<div id="search" class="smart-search-result bare-smart-filter">
<form id="default_form" method="post" action="fdoc_search.bo">
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
						<span class="item"><input id="cat33" type="checkbox" name="chkBrandAModule" value="터키시 반">
						<label for="cat33">터키시 반</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat34" type="checkbox" name="chkBrandAModule" value="터키쉬 앙고라">
						<label for="cat34">터키쉬 앙고라</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat35" type="checkbox" name="chkBrandAModule" value="통키니즈">
						<label for="cat35">통키니즈</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat36" type="checkbox" name="chkBrandAModule" value="페르시안">
						<label for="cat36">페르시안</label>
						</span>
						</li>
						
						<li class="smart-search-option" id="">
						<span class="item"><input id="cat37" type="checkbox" name="chkBrandAModule" value="하바나 브라운">
						<label for="cat37">하바나 브라운</label>
						</span>
						</li>
						
						<li class="smart-search-option">
						<span class="item"><input id="cat38" type="checkbox" name="chkBrandAModule" value="자바니즈">
						<label for="cat38">자바니즈</label>
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
			<form id="detail_form" method="post" action="fdoc_search.bo">
				
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
	<div style="margin-top:20px;">
          <div class="col-lg-12">
            <div class="section-title">
              <span class="caption d-block small">Categories</span>
              <h2>책임분양</h2>
            </div>
            <div class="list_wrap">
            <div class="list_content">
          <%
      	int num3 = listcount - ((nowpage - 1) * 10);
      	for(int i=0; i<fdoclist.size();i++){
      		FdocVO vo=(FdocVO)fdoclist.get(i);
      	
          %>
          
            <div class="post-entry-2 d-flex">
              <div class="thumbnail order-md-2" style="background-image: url('/springfileupload1/upload/<%=vo.getFdoc_thumbnail().toString() %>');"></div>
              <div class="contents order-md-1 pl-0">
                
                <h2><a class="a_1" href="./fdocdetail.bo?fdoc_no=<%=vo.getFdoc_no()%>&page=<%=nowpage%>"><%=vo.getFdoc_subject() %></a></h2>
                <p class="mb-3 tag">#<%=vo.getFdoc_big() %> #<%=vo.getFdoc_loc() %> #<%=vo.getFdoc_kindof() %> #<%=vo.getFdoc_expiry() %>개월 #책임비 <%=form.format(vo.getFdoc_price()) %>원</p>
                <div class="post-meta">
                  <span class="d-block"><a class="a_1" href="#"><%=vo.getFdoc_nick() %></a></span>
                  <span class="date-read"><%=date.format(vo.getFdoc_date()) %></span><span class="detail-read">&nbsp;&nbsp;&nbsp;&nbsp;<span class="recount_icon"></span>&nbsp;<%=vo.getFdoc_readcount() %>&nbsp;&nbsp;<span class="comment_icon"></span>&nbsp;<%=vo.getFdoc_comment() %></span>
                </div>
              </div>
            </div>
            <%num3--;} %>
            </div>
          </div>
       </div>
        </div>

		<div style="margin-top:20px;">
	
		<div style="text-align:center;display:inline-block;margin-left:400px;">
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ 
			if(searchVO ==null){
			%>
			<a href="./fdoclist.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%}else{ %>
			<a onclick="search_submit(<%=nowpage-1 %>);" href="#">[이전]</a>
			<%}}
			
			for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){
				//현재페이지는 링크가 필요없으므로 링크를 안검
				
				%>
				[<%=a %>]
				<%}else{ 
				if(searchVO == null){
				%>
				<a href="./fdoclist.bo?page=<%=a %>">[<%=a %>]</a>
				&nbsp;
				<%}else{ %>
					
				<a onclick="search_submit(<%=a %>);" href="#">[<%=a %>]</a>
				&nbsp;
				<% }} %>
			<%} %>
			
			<%if(nowpage>=maxpage){
				//더이상 읽을페이지가없을떄
					%>
			[다음]
			<%}else{ 
			if(searchVO == null){
			%>
			<a href="./fdoclist.bo?page=<%=nowpage+1 %>">[다음]</a>
			<%}else{ %>
			<a onclick="search_submit(<%=nowpage+1 %>);" href="#">[다음]</a>
			<%}} %>
		</div>
	
	<div style="display:inline-block; float:right;margin-right:25px;">
	   		<a href="./fdocform.bo">[글쓰기]</a>
	</div>
	
</div>
</div></div>
			
			
			</div>
			
	
		</div>
	


	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="./resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
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
	
		



<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
    console.log("<%= email %>") 
    var session = '<%= email %>'
    console.log(session);
    if(session == "null" ){
        $('#logout').hide();
          $('#mypage').hide();
          $('#login').show();
          $('#signin').show();
        
     } //헤더 상단 로그인상태 일때
     else{
       $('#logout').show();
         $('#mypage').show();
         $('#login').hide();
         $('#signin').hide();
     }; //헤더 상단 로그아웃상태 일때 
  });
</script>

<!-- 부트스트랩 4.0 js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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

