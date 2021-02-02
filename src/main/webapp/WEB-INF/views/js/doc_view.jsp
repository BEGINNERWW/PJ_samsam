<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.samsam.community.DocVO" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	DocVO vo = (DocVO)request.getAttribute("vo");
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	String id = (String) session.getAttribute("nick");
	String email = (String) session.getAttribute("email");
	String table = "doc_comment";
	String doc_table = "community";

	
	
%>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

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

body::-webkit-scrollbar { 
    display: none; 
}
.search-box {
  color : #9494b8;
  text-align : left; 
  font-size: 1rem;
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
}


a {
	text-decoration: none;
	color: #9494b8;
}

.name {
	color: #37acc9;
	font-size: 16px;
	margin-top: 16px;
	line-height: 16px;
}

.agreement {
	margin: 10px auto;
}

.option {
	margin-right: 15px;
}

.wrap-info {
	margin-top: 10px;
	margin-bottom: 35px;
}




a {
	text-decoration: none;
	color: #9494b8;
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
	background-color:white;
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
	background-color: #ed457d;
	color: #fff;
	border: 0;
}
.btn_g.full_type2{
	background-color: #bd4242;
	color:white;
	border:0;
	height:30px;

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
select, button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.article-content{
	margin-bottom:60px;
}
.option-info{
	color:#94969b;
}
.headsubject{
	display:inline-block;
	font-size: 24px;
    line-height: 32px;
    font-weight: 700;
    font-family: "Roboto","Noto Sans KR",AppleSDGothicNeo-Regular,"Malgun Gothic","맑은 고딕",dotum,"돋움",sans-serif;
}
.article-head{
padding: 0 0 29px;
    border-bottom: 1px solid #eee;
}


</style>
<link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script>
    $('.search-box').click(function(){
      
    });
    $('#keyword').keypress(function(event){
      if(event.which == 13){
        $('.search-box btn').click();
        return false;
      }
    });
</script>
<script>
var table = '<%=table%>';
var doc_table = '<%=doc_table%>';
var email ='<%=email%>';
function warning(cno,dno,cnick,content){
    event.preventDefault();
    $('#ex7').empty();
    var a = '';
    var id ='<%=id%>';
    var email ='<%=email%>';
    a += '<div class="modal-header"><h1>신고하기</h1></div>';
    a += '<div class="modal-body">';
    a += '<form id= "warning_form" name="warning_form" method="post" action="warning.bo">';
    a += '<input type="hidden" name="w_email" value="'+email+'">';
    a += '<input type="hidden" name="w_co_no" value="'+cno+'">';
    a += '<input type="hidden" name="w_doc_no" value="'+dno+'">';
    a += '<input type="hidden" name="w_nick" value="'+id+'">';
    a += '<div class="warning_container" ><div class="warning_report">';
    a += '<div class="report_title" style="margin:10px 10px 10px 10px;">내&nbsp;&nbsp;&nbsp;용 :';
    a += '<span class="report_content" style="margin:0px 0px 0px 10px;">'+content+'</span></div>';
    a += '<div class="report_title" style="margin:10px 10px 10px 10px;">작성자:';
    a += '<span class="report_content" style="margin:0px 0px 0px 10px;">'+cnick+'</span></div></div>';
    a += '<div class="warning_reason">';
    a += '<div class="report_title" style="margin:10px 10px 10px 10px;"><span>사유 선택</span> : </div>';
    a += '<div class="report_content" style="margin:10px 10px 10px 10px;"><p class="">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요</p>';
    a += '<ul class=""><li><input type="radio" name="w_reason" id="reson1" value="부적절한 홍보 게시글">';
    a += '<label for="reason1">&nbsp;부적절한 홍보 게시글</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason2" value="음란성 또는 청소년에게 부적합한 내용">';
    a += '<label for="reason2">&nbsp;음란성 또는 청소년에게 부적합한 내용</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason3" value="명예훼손/사생활 침해 및 저작권침해등">';
    a += '<label for="reason3">&nbsp;명예훼손/사생활 침해 및 저작권침해등</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason4">';
    a += '<label for="reason4">&nbsp;기타</label></li></ul>';
    a += '<textarea disabled name="etc_reason" id="etc_reason" cols="50" rows="5" class="" style="width:405px; height:80px; display:none;" placeholder="신고 사유를 기재해 주세요"></textarea></div>';
    a += '</div></form></div></div><div class="modal-footer">';
    a += '<button type="button" id="waring_submit" onclick="warning_submit();" class="btn btn-default">신고하기</button>';
    a += '<button type="button" onclick="modal_close();" class="btn btn-default">취소하기</button>';
    
    
    
    $('#ex7').append(a);
    $('#ex7').modal('show');
 }
function modal_close(){
	
	$.modal.close();
	
}
	
	function comment_refly(){
		
		
		var a = '';
		
		a += '<div class="text_write_g comment_write"><div class="inner_text_write"><div class="box_textarea">';
		a += '<textarea id="doc_content" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height: 86px;"></textarea>';
		a += '</div><div class="wrap_menu"><div class="area_r"><button id="secretcheck" class="btn_g_ico btn_item secret_button" data-is-hidden=""><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentInsert();" id="fdoc_submit" style="font-size: 13px;">등록</button>';
		a += '</div></div></div></div></div>';
		
		$("#fdoc_refly").html(a);
		
	}
	
    
    function commentInsert(){
    	
    	
    	var doc_content = $('#doc_content').val();
    	if(doc_content == ''){
			alert("내용을 입력해주세요");
			return false;
    	}
    	doc_content = doc_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
    	var doc_no =<%=vo.getDoc_no()%>
    	var updateSecret ='';
    	if($('#secretcheck').attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
    		updateSecret = 1;
    	}else{
    		updateSecret = 0;
    	}
    	
    	$.ajax({
    		url : 'comment_insert.bo',
    		type : 'POST',
    		data :  {'doc_no' : doc_no,'doc_content' : doc_content , 'doc_secret' : updateSecret,'table': table , 'doc_table' : doc_table },
    		success: function(data){
    			if(data ==1){
    				commentList();
    				comment_refly();
    			}
    		},
    		error:function(){
    			alert("ajax 통신 실패 (insert!!!!)");
    			
    		}
    	});
    	
    }
	
    
    
    function commentList(){
    	
    	var doc_no =<%=vo.getDoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getDoc_email()%>'
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'doc_no' : doc_no ,'table' : table},
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				
    				var date = new Date(value.doc_date);
    				
    				if(value.doc_lev == 0){
    					//원글
    					
    				
    				if(value.doc_secret == 0){
    					//비밀글 x
    				
    				if(email!=value.doc_email &email !='null'){
    					//작성자인지 아닌지 확인
    				
    				a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    				a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    				a += '<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
    				a += '</div></div></div></li>';
    				}else if(id=='null'){
    					
    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
        				a += '<div class="comment_more">';
        				a += '</div></div></div></li>';
    					
    				}
    				else{
    				
    					a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
        				a += '<div class="comment_more">';
        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        				a += '</div></div></div></li>';
    					
    				}
    				
    				}else{
    					
    					if(email!=value.doc_email & email!=writer){
    						
    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    						
    					}else if(email==value.doc_email){
    					
    						
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '</div></div></div></li>';
    						
    						
    					}else{
    						
    					
    	    				
    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
            				a += '</div></div></div></li>';
    					
    					}
    						
    					}
    				
    				}else if(value.doc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				
    				
    				else{
    					
    					//댓글
    					if(value.doc_secret == 0){
        					
    	    				
    	    				if(email!=value.doc_email & email!='null'){
    	    			
    	    				
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
    	        				a += '</div></div></div></li>';
    	    				
    	    				
    	    				}else if(email == 'null'){
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '</div></div></div></li>';
    	    					
    	    				}
    	    				else{
    	    				
    	    					a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '</div></div></div></li>';
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					
    	    					if(email!=value.doc_email && email!=writer ){
    	    						
    	    						
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(email==value.doc_email){
    	    						
    	    						
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    						
    	    					}else{
    	    					
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
    	            				a += '</div></div></div></li>';
    	    	    				
    	    	    				
    	    	    				}
    	    						
    	    					}
    	    				
    					
    				}
    					
    				
    				
    				
    			});
    			
    			$(".list_comment").html(a);
    		},
    		error : function(){
    			alert("ajax 통신 실패 (list)!!!");
    		}
    		
    	});
    	if (event != null)
    		event.preventDefault();
    }
    
    function getFormatDate(date){
    	
    	var year = date.getFullYear();
    	var month = (1 + date.getMonth());
    	month = month >= 10 ? month : '0' + month;
    	var day = date.getDate();
    	day = day >= 10 ? day : '0' + day;
    	var hour = date.getHours();
    	var min = date.getMinutes();
    	return year + '-' + month + '-' + day + '&nbsp;'+hour + ':' + min;
    }
    
    function commentUpdateForm(cno,content,cnick,cdate){
    	
    	
    	var doc_no =<%=vo.getDoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getDoc_email()%>'
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'doc_no' : doc_no ,'table' : table },
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				var date = new Date(value.doc_date);
    				
    				if(value.doc_lev == 0){
    					
    					if(value.doc_secret == 0){
        					
    	    				
    	    				if(email!=value.doc_email){
    	    					//작성자 x ,원글, 비밀긅x
    	    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    	    			a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	    	    			a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	    	    			a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	    	    			a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	    	    			a += '</div></div></div></li>';
    	    				
    	    				}
    	    				
    	    				else{
    	    					//작성자
    	    					if(cno != value.doc_cno){
    	    					
    	    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    					
    	    					}else{
    	    						//작성자 수정폼
    	    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">수정</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    					
    	    				
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					if(email!=value.doc_email && email!=writer ){
    	    						
    	    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(email==value.doc_email){
    	    						
    	    						if(cno != value.doc_cno){
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    		            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    		            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    		            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    		            				a += '<div class="comment_more">';
    		            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    		            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    		            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    		            				a += '</div></div></div></li>';
    	    						
    	    						}else{
    	    							
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    		            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    		            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    		            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    		            				a += '<div class="comment_more">';
    		            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    		            				a += '</div></div>';
    		            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    		            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    		            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    		            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">수정</button></div>';
    		            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    						
    	    					}
    	    				
    	    				}
    			
    				}else if(value.doc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				else{
    					
    					if(value.doc_secret == 0){
        					
    	    				
    	    				if(email!=value.doc_email){
    	    					
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '</div></div></div></li>';
    	    				
    	    				}
    	    				
    	    				else{
    	    					
    	    					if(cno != value.doc_cno){
    	    					
    	    					
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    					
    	    					}else{
    	    						
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">수정</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					
    	    					if(email!=value.doc_email && email!=writer ){
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
  						
    	    					}else if(email==value.doc_email){
    	    						
    	    						if(cno != value.doc_cno){
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	    						
    	    						}else{
 	
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">수정</button></div>';
        	            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    	    				
    	    					}
    	    						
    	    					}
    					
    					
    					
    					
    					
    				}
    			});
    			$(".list_comment").html(a);
    		},
    		error : function(){
    			alert("ajax 통신 실패 (list)!!!");
    		}
    		
    	});
       	
    	event.preventDefault();
    }
    
    function commentUpdate(cno){
    	var updateContent = $('[name=content_'+cno+']').val();
    	if(updateContent == ''){
    		alert('수정하실 내용을 입력해주세요');
    		return false;
    	}
    	updateContent = updateContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
    	var updateSecret ='';
    	if($('#secretcheck'+cno).attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
    		updateSecret = 1;
    	}else{
    		updateSecret = 0;
    	}
    	
    	$.ajax({
    		url: 'comment_update.bo',
    		//type: 'post',
    		dataType : 'json',
    		data:{'doc_content' : updateContent, 'doc_cno' : cno , 'doc_secret' : updateSecret , 'table' : table},
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			if(data == 1) commentList();
    			
    		},
    		error:function(){
    			alert("ajax 통신 실패 update!!!");
    		}
    	});
    }
    
    function commentRefly(cno,content,cnick,cdate){
    	
    	var doc_no =<%=vo.getDoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getDoc_email()%>'
    	
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'doc_no' : doc_no , 'table' : table },
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				var date = new Date(value.doc_date);
    				
    				if(value.doc_lev == 0){
    				
    				if(value.doc_secret == 0){
    					
    				
    				if(email!=value.doc_email){
    					//작성자가 아닐경우
    					
    					if(cno != value.doc_cno){
    						
    				
    					
    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    			a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	    			a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	    			a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	    			a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	    			a += '</div></div></div></li>';
    					
    					}else{
    					
    				
    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
            				a += '</div></div>';
            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
            				a += '<div class="wrap_menu"><div class="area_r"><button  id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
            				a += '</div></div></div></div></div></div></li>';
    					
    					}
    				
    				}
    				
    				else{
    					
    					if(cno != value.doc_cno){
    				
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '</div></div></div></li>';
        				
    					}
    					else{
    						
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
            				a += '</div></div>';
            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
            				a += '</div></div></div></div></div></div></li>';
    						
    					}
    				}
    				
    				}else{
    					//비밀글일 경우
    					
    					if(email!=value.doc_email && email!=writer ){
    						
    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    						
    					}else if(email==value.doc_email){
    						//비밀글 작성자일 경우
    						
    						if(cno != value.doc_cno){
    						
    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
	            				a += '<div class="comment_more">';
	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
	            				a += '</div></div></div></li>';
            				
    						}else{
    							
    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
	            				a += '<div class="comment_more">';
	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');;">삭제</a>';
	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
	            				a += '</div></div>';
	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
	            				a += '</div></div></div></div></div></div></li>';
    							
    						}
    					}else{
    						
    						if(cno != value.doc_cno){
    							
    						
    	    				
    							a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
                				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
                				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
                				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
                				a += '<div class="comment_more">';
                				a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
                				a += '</div></div></div></li>';
    	    				
    						}else{
    							
    							a += '<li style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
                				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
                				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
                				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
                				a += '<div class="comment_more">';
                				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
	            				a += '</div></div>';
	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
	            				a += '</div></div></div></div></div></div></li>';
    							
    							
    						}
    	    				}
    						
    					}
    				
    				}else if(value.doc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				
    				
    				
    				else{
    					
    					if(value.doc_secret == 0){
        					
    	    				
    	    				if(email!=value.doc_email){
    	    					//작성자가 아닐경우
    	    					
    	    					if(cno != value.doc_cno){
    	    						
    	    				
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	        				a += '</div></div></div></li>';
    	    					
    	    					}
    	    					
    	    					else{
    	    				
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    				
    	    				}
    	    				
    	    				else{
    	    					//작성자일 경우
    	    					
    	    					if(cno != value.doc_cno){
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	        				
    	    					}
    	    					
    	    					else{
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.doc_content+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    					}
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글일 경우
    	    					
    	    					if(email!=value.doc_email && email!=writer ){
    	    						
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(email!=value.doc_email){
    	    						//비밀글 작성자일 경우
    	   						
    	    						if(cno != value.doc_cno){
    	    					
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	            				
    	    						}
    	    						
    	    						else{
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.doc_cno+','+value.doc_lev+');">삭제</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
        	            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						if(cno != value.doc_cno){
    	    							
    	    					
    	    							a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.doc_cno+',\''+value.doc_content+'\',\''+value.doc_nick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	    	    				
    	    	    				
    	    						}
    	    						
    	    						else{
    	    							
    	    							a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.doc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.doc_nick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.doc_content+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.doc_cno+')">등록</button></div>';
        	            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    	    				}
    	    						
    	    					}
    					
    					
    					
    					
    					
    				}
    				
    				
    				
    			});
    			$(".list_comment").html(a);
    		},
    		error : function(){
    			alert("ajax 통신 실패 (list)!!!");
    		}
    	});
    	
    	
    	event.preventDefault();
    	
    	
    }
    
    function reflyInsert(cno){
    	
    	var updateContent = $('[name=content_'+cno+']').val();
    	if(updateContent == ''){
    		alert('내용을 입력해주세요');
    		return false;
    	}
    	updateContent = updateContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
    	var updateSecret ='';
    	if($('#secretcheck'+cno).attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
    		updateSecret = 1;
    	}else{
    		updateSecret = 0;
    	}
    	
    	var doc_no =<%=vo.getDoc_no()%>
    	
    	
    	$.ajax({
    		url: 'comment_refly.bo',
    		//type: 'post',
    		dataType : 'json',
    		data:{'doc_content' : updateContent, 'doc_cno' : cno , 'doc_secret' : updateSecret ,'doc_ref' : cno , 'doc_lev' : 1 ,'doc_no' : doc_no , 'table' : table , 'doc_table' : doc_table },
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			if(data == 1) commentList();
    			
    		},
    		error:function(){
    			alert("ajax 통신 실패 update!!!");
    		}
    	});
    }
    
    function commentDelete(cno,lev){
    	
    	var doc_no =<%=vo.getDoc_no()%>
    	
    	$.ajax({
    		url: 'comment_delete.bo',
    		//type: 'post',
    		data : {'doc_cno' : cno , 'doc_lev' : lev , 'doc_no' : doc_no ,'table' : table , 'doc_table' : doc_table },
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success :function(data){
    			if(data ==1)
    				commentList(); // 댓글 삭제후 목록 출력
    		},
    		error:function(){
    			alert("ajax 통신 실패 (delete)!!!");
    		}
    	});
    	event.preventDefault();
    	
    }
    
    
    $(document).ready(function(){
    	
    	commentList(); //페이지 로딩시 댓글 목록 출력
    	comment_refly();
    	
    	$(document).on('click','.btn_g_ico',function() {
    		
    		($(this).attr('class') == 'btn_g_ico btn_item secret_button ico_on') ? $(this).attr('class','btn_g_ico btn_item secret_button') : $(this).attr('class','btn_g_ico btn_item secret_button ico_on');
    		
        });
    	
    	$(document).on("change","input[name='w_reason']",function(){
    		
            if($(this).attr('id') == 'reason4'){
            	$('#etc_reason').removeAttr('disabled');
                $('#etc_reason').show();
            }else{
            	$('#etc_reason').hide();
            	$('#etc_reason').attr('disabled','disabled');
            	$('#etc_reason').val('');
            }
        });
    	
    	
    	
    });

 
function warning_ori(dno,cnick,content){
	
	event.preventDefault();
    $('#ex7').empty();
    var a = '';
    var id ='<%=id%>';
    var email = '<%=email%>';
    a += '<div class="modal-header"><h1>신고하기</h1></div>';
    a += '<div class="modal-body">';
    a += '<form id= "warning_form" name="warning_form" method="post" action="warning.bo">';
    a += '<input type="hidden" name="w_email" value="'+email+'">';
    a += '<input type="hidden" name="w_doc_no" value="'+dno+'">';
    a += '<input type="hidden" name="w_nick" value="'+id+'">';
    a += '<div class="warning_container"><div class="warning_report">';
    a += '<div class="report_title" style ="margin:10px 10px 10px 10px;">제&nbsp;&nbsp;&nbsp;목 :';
    a += '<span class="report_content" style="margin :0px 0px 0px 10px;">'+content+'</span></div>';
    a += '<div class="report_title" style ="margin:10px 10px 10px 10px;">작성자:';
    a += '<span class="report_content" style="margin :0px 0px 0px 10px;">'+cnick+'</span></div></div>';
    a += '<div class="warning_reason">';
    a += '<div class="report_title" style ="margin:10px 10px 10px 10px;"><span>사유 선택</span> : ';
    a += '<div class="report_content"><p class="">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요</p></div>';
    a += '<ul class=""><li><input type="radio" name="w_reason" id="reson1" value="부적절한 홍보 게시글">';
    a += '<label for="reason1">&nbsp;부적절한 홍보 게시글</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason2" value="음란성 또는 청소년에게 부적합한 내용">';
    a += '<label for="reason2">&nbsp;음란성 또는 청소년에게 부적합한 내용</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason3" value="명예훼손/사생활 침해 및 저작권침해등">';
    a += '<label for="reason3">&nbsp;명예훼손/사생활 침해 및 저작권침해등</label></li>';
    a += '<li><input type="radio" name="w_reason" id="reason4">';
    a += '<label for="reason4">&nbsp;기타</label></li></ul>';
    a += '<textarea disabled name="etc_reason" id="etc_reason" cols="50" rows="5" class="" style="width:405px; height:80px; display:none;" placeholder="신고 사유를 기재해 주세요"></textarea></div>';
    a += '</div></form></div></div><div class="modal-footer">';
    a += '<button type="button" id="waring_submit" onclick="warning_submit();" class="btn btn-default">신고하기</button>';
    a += '<button type="button" onclick="modal_close();" class ="btn btn-default">취소하기</button>';
	
	
	$('#ex7').append(a);
	$('#ex7').modal('show');
}
function modal_close(){
	
	$.modal.close();
	
}

function warning_submit(){
	
	var data = $('#warning_form').serialize();
	if($('input:radio[name="w_reason"]').is(':checked') ==false){
		alert('신고 사유를 체크해주세요');
		return false;
	}

	if($('input[name="w_reason"]:checked').attr('id')=="reason4" && $('#etc_reason').val() == ''){
		alert('신고 사유를 입력해주세요');
		return false;
	}
	$.ajax({
		url : 'doc_warning.bo',
		type : 'POST',
		data :  data,
		success: function(data){
			if(data ==1){
				$.modal.close();
				//$( 'input[name="w_reason"]' ).attr( 'checked', false );
				$('#ex1').modal('show');
			}
		},
		error:function(){
			alert("ajax 통신 실패 (insert!!!!)");
			
		}
	});
}
$(document).ready(function() {
	
	function warning(){
		event.preventDefault();
		$('#ex7').modal('show');
	}
	
$("#fdoc_agree").change(function(){
	fdoc_check();   
	
});
$(document).on("change","input[name='w_reason']",function(){
	
    if($(this).attr('id') == 'reason4'){
    	$('#etc_reason').removeAttr('disabled');
        $('#etc_reason').show();
    }else{
    	$('#etc_reason').hide();
    	$('#etc_reason').attr('disabled','disabled');
    	$('#etc_reason').val('');
    }
});
});




	
	
</script>
<body>
<div class ="body_content">
<header id = "header">

	<div class ="inout_gocen">
		<%if(email != null){ %>
			
			<input  type="button" class= "header_btn"  value="로그아웃" onclick="location.href='logout.me'">
			<input  type="button" class= "header_btn"  value="마이페이지" onclick="location.href='mypage.me'">
			<%}else{ %>
			<input  type="button" class= "header_btn" value="로그인" onclick="location.href='loginForm.me'">
			<input  type="button" class= "header_btn" value="회원가입" onclick="location.href='joinform.me'">
			<%} %>
			<a href="customer_service.me"><input type="button" class= "header_btn" id="gocen" value="고객센터"></a>
		</div>
	
	
		<div class="nav-menu">
            <ul class="sticky-wrapper">
               <li class="dropdown"><a href="home.me">HOME</a></li>
               <li class="dropdown"><a href="home_list.bo">분양</a>
                  <ul class="dropdown-menu board">
                     <li><a href="home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="fdoclist.bo">책임분양</a></li>
                     <li><a href="selladopt_list.bo">업체분양</a></li>
                  </ul></li>
             <li class="dropdown"><a href="SJ/pet_list">보호소</a>
                  <ul class="dropdown-menu care">
                     <li><a href="SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
                     <li><a href="SJ/payang/list">파양</a></li>
                     <li><a href="SJ/missing/list">실종</a></li>
                  </ul></li>
               <li class="dropdown"><a href="doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu commu">
                     <li><a href="doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="auth_fdoc.bo">책임분양인증</a></li>
                     <li><a href="hospital_map.me">Map</a></li>
                  </ul></li>
            </ul>
				
	<div class="header-top">
		<div class="mainlogo">
		<a href="home.me">
		<img src = "resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	
	
	<form action="home_search.me" method="post" name="home_search">
            <div class="search-wrapper">
               <input class="search-box input"  id="keyword" name="keyword" type="text" placeholder="Search">
               <button class="search-box" type="submit">
                  <i class="fas fa-search"></i>
               </button>
            </div>
      </form>
	
	</div><!-- nav-menu -->
</header>
		
		<div class="main-content">
			<div class="content-wrap">
			
			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
				
			
			<ul class="list-group list-group-flush">
				<li class="list-group-item click"><a href="doclist.bo">자유게시판</a></li>
				<li class="list-group-item"><a href="auth_fdoc.bo">책임분양인증</a></li>
				<li class="list-group-item"><a href="hospital_map.me">Map</a></li>
			</ul>
			</div>
			
			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
				<!-- 수정시작 -->
				<div class="contents">
					<div class="article-head">
						<p style="font-szie:16px;font-weight:bold;">커뮤니티 &nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;자유 게시판</p>
						<h2 class="headsubject"><%=vo.getDoc_subject()%></h2>
						<p class="name"><%=vo.getDoc_nick()%></p>
					
						<div class="option-info">
							<span class="date option"><i class="far fa-clock"></i>&nbsp;<%=vo.getDoc_date()%></span>
							<span class="pv option"><i class="far fa-eye"></i>&nbsp;<%=vo.getDoc_readcount()%></span>
							<span class="cmt"><i class="far fa-comment"></i>&nbsp;<%=vo.getDoc_comment()%></span>
							<div class="option-wrap">
							<%
								if (email != null) {

									if (!email.equals(vo.getDoc_email())) {
							%>
							<span><a href="#"
								onclick="warning_ori(<%=vo.getDoc_no()%>,'<%=vo.getDoc_nick()%>','<%=vo.getDoc_subject()%>');">신고하기</a></span>
							<%
								} else {
							%>
							<span><a href="doc_update.bo?doc_no=<%=vo.getDoc_no()%>">수정</a>&nbsp;&nbsp;&nbsp;</span><span><a href="doc_delete.bo?doc_no=<%=vo.getDoc_no()%>">삭제</a></span>
							<%
								}
								}
							%>
						</div>
						</div>
					</div>
					<div class="article-view-content" style="min-height:400px;">
						<div class="article-content">
							<%=vo.getDoc_content()%>
						</div>
						

					</div>
				
						<div class="cont_comment" style="background-color: #f8f8f8;">
							<div style="width: 100%; margin: 0;">
								<div class="comment_view">
									<ul class="list_comment"></ul>
								</div>
							</div>
							<div style="margin: 0; width: 100%; background-color: #F8F8F8;">
								<%if(email != null){ %>
								<div id="fdoc_refly"></div>
								<%} %>
							</div>

						</div>
				</div>


			</div>
		</div>






		<!-- 카카오톡 채널 상담 -->
		<div class="kakaoChat">
			<a href="javascript:void plusFriendChat()"> <img
				src="./resources/img/kakaolink_btn_medium.png" width="45px"
				height="45px" class="kakao_btn">
			</a>
		</div>

		<!-- pageup button -->
		<div class="back-to-top">
			<a href="#" class="back-to-top" style="display: inline;"> <i
				class="fas fa-angle-up"></i>
			</a>
		</div>
		<footer id="footer">
			<p style="text-align:center;">
				Copyright ©2021 All rights reserved | This template is made with <i
					class="fas fa-heart"></i> by SamSam
		</footer>

	</div>
	</div>
	<!-- 바디컨텐트 -->


	<!-- 
		<footer id="footer">
<p style="text-align:center;">Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam

</footer>
 -->

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

	<div id="ex7" class="modal" style="overflow: visible;"></div>

	<div id="ex1" class="modal" style="overflow: visible;">
		<p>신고가 접수되었습니다. 감사합니다</p>
		<a href="#" rel="modal:close">Close</a>
	</div>



</body>
<style>
.blocker {
z-index:200;
}

</style>