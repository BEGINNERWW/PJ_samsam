<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.project.samsam.fdocboard.FdocVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>

<%
	FdocVO vo = (FdocVO) request.getAttribute("vo");
	DecimalFormat form = new DecimalFormat("###,###,###");
	String fdoc_Code = (String) vo.getFdoc_code();
	int fdoc_price = vo.getFdoc_price();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	id = "지금";
	email = "456@gmail.com";
%>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
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
table {
	margin: auto;
	width: 60%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
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

@charset "utf-8";

* {
	margin: 0;
	padding: 0;
}

html {
	margin: 0 auto;
	width: 100%;
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
	min-height: 600px;
	box-sizing: content-box;
	line-height: 1.7;
	color: gray;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	font-size: .9rem;
}

a {
	text-decoration: none;
	color: #9494b8;
}

body {
	text-align: -webkit-center;
}

.body_content {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: auto;
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

.inout_gocen {
	position: fixed;
	top: 20px;
	right: 390px;
}

.header-top {
	margin-top: 40px;
	display: flex;
	justify-content: flex-start;
	margin-right: auto;
}

.header_btn {
	width: 70px;
	height: 30px;
	background-color: #fff;
	color: #9494b8;
	border-radius: 5px;
	border: none;
	outline: 0;
}

.header_btn:hover {
	color: #6200cc;
	font-weight: 700;
}

#logout, #mypage {
	display: none;
}

.img-circle {
	width: 450px;
	height: 150px;
	display: block;
	margin: 0 auto;
}

.nav-menu {
	margin: 0 auto;
	display: flex;
	justify-content: space-around;
	align-items: baseline;
	width: 1200px;
}

.sticky-wrapper {
	width: 400px;
	height: 50px;
	margin: 0;
	margin-left: 0;
	position: sticky;
	list-style: none;
	display: flex;
	padding: 0;
}

.sticky-wrapper>li {
	padding: 8px 8px;
	list-style-type: none;
	float: left;
}

.sticky-wrapper>ul {
	padding: 8px 8px;
}

li.dropdown {
	color: #9494b8;
	background: #fff;
	transition: .3s all ease;
	font-size: 20px;
	width: 90px;
	height: 50px;
	text-align: -webkit-center;
}

.sticky-wrapper.active {
	position: fixed;
	top: 0px;
}

/* dropdown */
.dropdown-menu {
	display: none;
	justify-content: flex-start;
	position: absolute;
	list-style: none;
	visibility: visible;
	background-color: rgb(0, 0, 0, 0);
	width: 350px;
	top: 48px;
	padding: 5px;
	border: none;
}
.dropdown_1{
	backgrond-color:transparent !important;
	border:0px;
	
}


.dropdown-menu li {
	margin-right: 40px;
	text-decoration: none;
    color: #9494b8;
}

.dropdown:hover .dropdown-menu {
	display: flex;
	visibility: visible;
}

/* search-wrapper */
.search-wrapper {
	padding: 5px;
	width: 280px;
	height: 38px;
	display: flex;
	justify-content: space-betwwen;
	background: #fff;
	border: 2px solid #9494b8;
	border-radius: 10px;
}

.search-box {
	height: 100%;
	padding: 0;
	border: none;
	background: #fff;
}

.search-box.input {
	width: 80%;
	margin-left: 15px;
	font-size: .9rem;
}

.search-box.input:focus {
	outline: none;
}

.search-box.btn {
	color: #9494b8;
	text-align: left;
}

/* search-wrqpper */
.main-content {
	width: 100%;
	height: 100%;
	margin: 0 auto;
}

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




p {
	text-align: left;
}

.fa-heart {
	color: red;
}

/* pageup button */
.back-to-top {
	width: 40px;
	height: 40px;
	margin: 0 auto;
	font-size: 24px;
	color: white;
	background-color: #149DDD;
	border-radius: 50%;
	visibility: visible;
	position: fixed;
	bottom: 45px;
	right: 30px;
	text-align: center;
}
/* pageup button */
*, ::after, ::before {
	box-sizing: border-box;
}

/*카카오톡 톡상담*/
.kakaoChat {
	width: 44px;
	height: 100px;
	margin: 0 auto;
	font-size: 24px;
	color: white;
	border-radius: 50%;
	visibility: visible;
	position: fixed;
	bottom: 45px;
	right: 30px;
	text-align: center;
}

.kakao_btn {
	border-radius: 1rem !important;
}

/* side menu와 내용 묶음 */
.content-wrap {
    width: 1200px;
    margin: 0 auto;
    position: relative;
    top: 50px;
    overflow: visible;
    margin-bottom: 100;

}

.cont_comment {
	margin-top: 35px;
}

.content-wrap::-webkit-scrollbar {
	display: none;
}

.sidemenu-section {
	width: 200px;
	position: absolute;
	font-size: 18px;
	text-align: left;
	height: 100%;
	padding: 0px 0px 0 0;
	margin-left: 0;
}

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

.content-section::-webkit-scrollbar {
	display: none;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .75rem 1.25rem;
	margin-bottom: -1px;
	background-color: white;
	border: 1px solid rgba(0, 0, 0, .125);
}

li.list-group-item.click>a {
	font-weight: bold;
	color: #5c5c8a;
}

.list-group-item>a {
	text-decoration: none;
}

.dropdown-menu {
	display: none;
	justify-content: flex-start;
	position: absolute;
	list-style: none;
	visibility: visible;
	background-color: rgb(0, 0, 0, 0);
	width: 350px;
	top: 48px;
	padding: 5px;
	border: none;
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
.option-info{
	color:#94969b;
}
.headsubject{
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
	a += '<div class="warning_container"><div class="warning_report">';
	a += '<div class="report_title">내&nbsp;&nbsp;&nbsp;용 :</div>';
	a += '<div class="report_content">'+content+'</div>';
	a += '<div class="report_title">작성자:</div>';
	a += '<div class="report_content">'+cnick+'</div></div>';
	a += '<div class="warning_reason">';
	a += '<div class="report_title"><span>사유 선택</span> : </div>';
	a += '<div class="report_content"><p class="">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요</p>';
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
	a += '<button type="button" id="waring_submit" onclick="warning_submit();">신고하기</button>';
	a += '<button type="button" onclick="modal_close();">취소하기</button>';
	
	
	
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
		url : 'fdoc_warning.bo',
		type : 'POST',
		data :  data,
		success: function(data){
			if(data ==1){
				$.modal.close();
				$('#ex1').modal('show');
			}
		},
		error:function(){
			alert("ajax 통신 실패 (insert!!!!)");
			
		}
	});
}
	
	function comment_refly(){
		
		
		var a = '';
		
		a += '<div class="text_write_g comment_write"><div class="inner_text_write"><div class="box_textarea">';
		a += '<textarea id="fdoc_ccontent" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height: 86px;"></textarea>';
		a += '</div><div class="wrap_menu"><div class="area_r"><button id="secretcheck" class="btn_g_ico btn_item secret_button" data-is-hidden=""><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentInsert();" id="fdoc_submit" style="font-size: 13px;">등록</button>';
		a += '</div></div></div></div></div>';
		
		$("#fdoc_refly").html(a);
		
	}
	
    
    function commentInsert(){
    	var fdoc_ccontent = $('#fdoc_ccontent').val();
    	fdoc_ccontent = fdoc_ccontent.replace(/(?:\r\n|\r|\n)/g, '<br />');
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	var updateSecret ='';
    	if($('#secretcheck').attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
    		updateSecret = 1;
    	}else{
    		updateSecret = 0;
    	}
    	
    	$.ajax({
    		url : 'comment_insert.bo',
    		type : 'POST',
    		data :  {'fdoc_no' : fdoc_no,'fdoc_ccontent' : fdoc_ccontent , 'fdoc_csecret' : updateSecret },
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
    	
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getFdoc_nick()%>'
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'fdoc_no' : fdoc_no},
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				var date = new Date(value.fdoc_cdate);
    				
    				if(value.fdoc_lev == 0){
    					//원글
    					
    				
    				if(value.fdoc_csecret == 0){
    					//비밀글 x
    				
    				if(id!=value.fdoc_cnick &id !='null'){
    					//작성자인지 아닌지 확인
    				
    				a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    				a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    				a += '<a class="link_write" href="#" onclick="warning('+value.fdoc_cno+','+fdoc_no+',\''+value.fdoc_cnick+'\',\''+value.fdoc_ccontent+'\');">신고</a>';
    				a += '</div></div></div></li>';
    				}else if(id=='null'){
    					
    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
        				a += '<div class="comment_more">';
        				a += '</div></div></div></li>';
    					
    				}
    				else{
    				
    					a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
        				a += '<div class="comment_more">';
        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        				a += '</div></div></div></li>';
    					
    				}
    				
    				}else{
    					
    					if(id!=value.fdoc_cnick & id!=writer){
    						
    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    						
    					}else if(id == value.fdoc_cnick){
    					
    						
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '</div></div></div></li>';
    						
    						
    					}else{
    						
    					
    	    				
    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '<a class="link_write" href="#" onclick="warning('+value.fdoc_cno+','+fdoc_no+',\''+value.fdoc_cnick+'\',\''+value.fdoc_ccontent+'\');">신고</a>';
            				a += '</div></div></div></li>';
    					
    					}
    						
    					}
    				
    				}else if(value.fdoc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				
    				
    				else{
    					
    					//댓글
    					if(value.fdoc_csecret == 0){
        					
    	    				
    	    				if(id!=value.fdoc_cnick & id!='null'){
    	    			
    	    				
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '<a class="link_write" href="#" onclick="warning('+value.fdoc_cno+','+fdoc_no+',\''+value.fdoc_cnick+'\',\''+value.fdoc_ccontent+'\');">신고</a>';
    	        				a += '</div></div></div></li>';
    	    				
    	    				
    	    				}else if(id == 'null'){
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '</div></div></div></li>';
    	    					
    	    				}
    	    				else{
    	    				
    	    					a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '</div></div></div></li>';
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					
    	    					if(id!=value.fdoc_cnick && id!=writer ){
    	    						
    	    						
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(id == value.fdoc_cnick){
    	    						
    	    						
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    						
    	    					}else{
    	    					
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '<a class="link_write" href="#" onclick="warning('+value.fdoc_cno+','+fdoc_no+',\''+value.fdoc_cnick+'\',\''+value.fdoc_ccontent+'\');">신고</a>';
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
    	
    	
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getFdoc_nick()%>'
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'fdoc_no' : fdoc_no},
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				var date = new Date(value.fdoc_cdate);
    				
    				if(value.fdoc_lev == 0){
    					
    					if(value.fdoc_csecret == 0){
        					
    	    				
    	    				if(id!=value.fdoc_cnick){
    	    					//작성자 x ,원글, 비밀긅x
    	    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    	    			a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	    	    			a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	    	    			a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	    	    			a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	    	    			a += '</div></div></div></li>';
    	    				
    	    				}
    	    				
    	    				else{
    	    					//작성자
    	    					if(cno != value.fdoc_cno){
    	    					
    	    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    					
    	    					}else{
    	    						//작성자 수정폼
    	    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.fdoc_cno+')">수정</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    					
    	    				
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					if(id!=value.fdoc_cnick && id!=writer ){
    	    						
    	    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(id == value.fdoc_cnick){
    	    						
    	    						if(cno != value.fdoc_cno){
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    		            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    		            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    		            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    		            				a += '<div class="comment_more">';
    		            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    		            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    		            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    		            				a += '</div></div></div></li>';
    	    						
    	    						}else{
    	    							
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    		            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    		            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    		            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    		            				a += '<div class="comment_more">';
    		            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    		            				a += '</div></div>';
    		            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    		            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    		            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    		            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.fdoc_cno+')">수정</button></div>';
    		            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    						
    	    					}
    	    				
    	    				}
    			
    				}else if(value.fdoc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				else{
    					
    					if(value.fdoc_csecret == 0){
        					
    	    				
    	    				if(id!=value.fdoc_cnick){
    	    					
    	    					a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	        				a += '<div class="comment_more">';
    	        				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	        				a += '</div></div></div></li>';
    	    				
    	    				}
    	    				
    	    				else{
    	    					
    	    					if(cno != value.fdoc_cno){
    	    					
    	    					
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    					
    	    					}else{
    	    						
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.fdoc_cno+')">수정</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글
    	    					
    	    					if(id!=value.fdoc_cnick && id!=writer ){
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
  						
    	    					}else if(id == value.fdoc_cnick){
    	    						
    	    						if(cno != value.fdoc_cno){
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	    						
    	    						}else{
 	
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.fdoc_cno+')">수정</button></div>';
        	            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
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
    		data:{'fdoc_ccontent' : updateContent, 'fdoc_cno' : cno , 'fdoc_csecret' : updateSecret},
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
    	
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	var id = '<%=id%>'
    	var writer = '<%=vo.getFdoc_nick()%>'
    	
    	
    	$.ajax({
    		url : 'comment_list.bo',
    		type : 'post',
    		data : { 'fdoc_no' : fdoc_no},
    		dataType : 'json',
    		contentType : 'application/x-www-form-urlencoded;charset=utf-8',
    		success : function(data){
    			
    			var a = '';
    			$.each(data, function(key,value){
    				var date = new Date(value.fdoc_cdate);
    				
    				if(value.fdoc_lev == 0){
    				
    				if(value.fdoc_csecret == 0){
    					
    				
    				if(id!=value.fdoc_cnick){
    					//작성자가 아닐경우
    					
    					if(cno != value.fdoc_cno){
    						
    				
    					
    					a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    	    			a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	    			a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	    			a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	    			a += '<div class="comment_more"><a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	    			a += '</div></div></div></li>';
    					
    					}else{
    					
    				
    						a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
            				a += '</div></div>';
            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
            				a += '<div class="wrap_menu"><div class="area_r"><button  id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
            				a += '</div></div></div></div></div></div></li>';
    					
    					}
    				
    				}
    				
    				else{
    					
    					if(cno != value.fdoc_cno){
    				
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
            				a += '</div></div></div></li>';
        				
    					}
    					else{
    						
    						a += '<li style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
            				a += '<div class="comment_more">';
            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
            				a += '</div></div>';
            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
            				a += '</div></div></div></div></div></div></li>';
    						
    					}
    				}
    				
    				}else{
    					//비밀글일 경우
    					
    					if(id!=value.fdoc_cnick && id!=writer ){
    						
    						a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    						
    					}else if(id == value.fdoc_cnick){
    						//비밀글 작성자일 경우
    						
    						if(cno != value.fdoc_cno){
    						
    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
	            				a += '<div class="comment_more">';
	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
	            				a += '</div></div></div></li>';
            				
    						}else{
    							
    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
	            				a += '<div class="comment_more">';
	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');;">삭제</a>';
	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
	            				a += '</div></div>';
	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
	            				a += '</div></div></div></div></div></div></li>';
    							
    						}
    					}else{
    						
    						if(cno != value.fdoc_cno){
    							
    						
    	    				
    							a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
                				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
                				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
                				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
                				a += '<div class="comment_more">';
                				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
                				a += '</div></div></div></li>';
    	    				
    						}else{
    							
    							a += '<li style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
                				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
                				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
                				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
                				a += '<div class="comment_more">';
                				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
	            				a += '</div></div>';
	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
	            				a += '</div></div></div></div></div></div></li>';
    							
    							
    						}
    	    				}
    						
    					}
    				
    				}else if(value.fdoc_lev == 2){
    					
    					a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
						a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
						a+= '</p></div></div></div></div></li>';
    					
    				}
    				
    				
    				
    				else{
    					
    					if(value.fdoc_csecret == 0){
        					
    	    				
    	    				if(id!=value.fdoc_cnick){
    	    					//작성자가 아닐경우
    	    					
    	    					if(cno != value.fdoc_cno){
    	    						
    	    				
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	        				a += '</div></div></div></li>';
    	    					
    	    					}
    	    					
    	    					else{
    	    				
    	    						a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    						
    	    					}
    	    				
    	    				}
    	    				
    	    				else{
    	    					//작성자일 경우
    	    					
    	    					if(cno != value.fdoc_cno){
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	        				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	        				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	        				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
        	        				a += '<div class="comment_more">';
        	        				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	        				
    	    					}
    	    					
    	    					else{
    	    					
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
    	            				a += '</div></div>';
    	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
    	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
    	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
    	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
    	            				a += '</div></div></div></div></div></div></li>';
    	    						
    	    					}
    	    					
    	    				}
    	    				
    	    				}else{
    	    					//비밀글일 경우
    	    					
    	    					if(id!=value.fdoc_cnick && id!=writer ){
    	    						
    	    						a+= '<li class="refly_section" style="background-color:#F8F8F8;" id="refly"'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	    						a+= '<div class="comment_post"><div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span>';
    	    						a+= '&nbsp;&nbsp;&nbsp;해당 댓글은 작성자와 운영자만 볼 수 있습니다.';
    	    						a+= '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></p></div></div></div></div></li>';
    	    						
    	    					}else if(id == value.fdoc_cnick){
    	    						//비밀글 작성자일 경우
    	   						
    	    						if(cno != value.fdoc_cno){
    	    					
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	            				
    	    						}
    	    						
    	    						else{
    	    						
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+','+value.fdoc_lev+');">삭제</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
        	            				a += '</div></div></div></div></div></div></li>';
    	    							
    	    						}
    	    						
    	    					}else{
    	    						
    	    						if(cno != value.fdoc_cno){
    	    							
    	    					
    	    							a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	    	    				
    	    	    				
    	    						}
    	    						
    	    						else{
    	    							
    	    							a += '<li class="refly_section" style="background-color:#F8F8F8;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
        	            				a += '</div></div>';
        	            				a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
        	            				a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
        	            				a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.fdoc_cno+'" class="btn_g_ico btn_item secret_button ico_on" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
        	            				a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+value.fdoc_cno+')">등록</button></div>';
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
    	updateContent = updateContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
    	var updateSecret ='';
    	if($('#secretcheck'+cno).attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
    		updateSecret = 1;
    	}else{
    		updateSecret = 0;
    	}
    	
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	
    	
    	$.ajax({
    		url: 'comment_refly.bo',
    		//type: 'post',
    		dataType : 'json',
    		data:{'fdoc_ccontent' : updateContent, 'fdoc_cno' : cno , 'fdoc_csecret' : updateSecret ,'fdoc_ref' : cno , 'fdoc_lev' : 1 ,'fdoc_no' : fdoc_no},
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
    	
    	var fdoc_no =<%=vo.getFdoc_no()%>
    	
    	$.ajax({
    		url: 'comment_delete.bo',
    		//type: 'post',
    		data : {'fdoc_cno' : cno , 'fdoc_lev' : lev , 'fdoc_no' : fdoc_no},
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
	a += '<div class="report_title">제&nbsp;&nbsp;&nbsp;목 :</div>';
	a += '<div class="report_content">'+content+'</div>';
	a += '<div class="report_title">작성자:</div>';
	a += '<div class="report_content">'+cnick+'</div></div>';
	a += '<div class="warning_reason">';
	a += '<div class="report_title"><span>사유 선택</span> : </div>';
	a += '<div class="report_content"><p class="">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요</p>';
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
	a += '<button type="button" id="waring_submit" onclick="warning_submit();">신고하기</button>';
	a += '<button type="button" onclick="modal_close();">취소하기</button>';
	
	
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
		url : 'fdoc_warning.bo',
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


function fdoc_check(){
	var agree_check = document.getElementById("agree_check");
	if($('#fdoc_agree').prop('checked')){
		agree_check.innerHTML = "<b><font color='green' size='2px'>&nbsp;&nbsp;동의 합니다</font></b>";
		code_check();
	}else{
		$('#pay_button').attr('disabled','disabled');
		agree_check.innerHTML = "<b><font color='red' size='2px'>&nbsp;&nbsp;동의 하셔야 결제버튼이 활성화 됩니다</font></b>";
	}
};

function code_check(){
	var code = $('#fdoc_code').val();
	var code_check = document.getElementById("code_check");
	
	if(code == '<%=fdoc_Code%>'){
		$('#pay_button').removeAttr('disabled');
		code_check.innerHTML = "<b><font color='green' size='2px'>&nbsp;인증 완료</font></b>";
	}else{
		$('#pay_button').attr('disabled','disabled');
		code_check.innerHTML = "<b><font color='red' size='2px'>&nbsp;분양코드가 틀립니다&nbsp;&nbsp;&nbsp;</font></b>";
	}
};

//iamport

function pay(){
	
	var id = '<%=id%>'
	var email = '<%=email%>'
	
	
	
	
	
		var IMP = window.IMP; //IMP 객체 생성
		var code = "imp67740651";//가맹점 식별코드
		IMP.init(code);
		
		//결제 요청
		IMP.request_pay({
			//name과 amount만 있어도 결제 진행가능
			pg : 'inicis',//pg사 선택(kakao,kakaopay 둘다가능)
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '<%=fdoc_Code%>',
			amount : 110,
			//amount : <%=fdoc_price%>, 
			buyer_email : email,
			buyer_tel : '010-1111-2222',
			buyer_addr : '경기도 고양시 덕양구',
			buyer_postcode : '123-456',
			//결제 완료후 이동할 페이지, kakao나 kakao pay는 생략함
			//m_redirect_url:'https://localhost:8080/payments/complete'/
		},function(rsp){//결제정보를 받아옴
			if(rsp.success){//결제 성공시
				var msg = '결제가 완료되었습니다.';
				
				$.ajax({
					
					url : 'pay_insert.bo',
					type : 'POST',
					data : {'confirm_no': rsp.merchant_uid,'confirm_fdoc_no':<%=vo.getFdoc_no()%>,'confirm_fdoc_s_email' : "<%=vo.getFdoc_email()%>" ,'confirm_fdoc_r_email' : email,'confirm_fdoc_code' : "<%=vo.getFdoc_code()%>",'confirm_fdoc_expiry' : <%=vo.getFdoc_expiry()%>,'confirm_fdoc_price' :<%=vo.getFdoc_price()%>,'confirm_fdoc_kindof' : "<%=vo.getFdoc_kindof()%>", 'confirm_fdoc_img' : "<%=vo.getFdoc_thumbnail()%>"},
					success: function(data){
					if(data==1)
						location.href ='my_free_auth.bo'; //나중에 me로 수정
						
					},
					error:function(){
						alert("결제 회원정보 ajax 실패 (pay_select!!!!)");
						
					}
				});
				
			}
			else{ //결제 실패시
				var msg = '결제에 실패하였습니다.'+ rsp.error_msg;
			}
		alert(msg);
		});
		
	}
	
	function cancelPay(){
		jQuery.ajax({
			url: "/springimport/cancel.do",
			type: "post",
			//dataType : "json",
			contentType : 'application/x-www-form-urlencoded',
			data:{
				"merchant_uid" : "merchant_6" //주문번호
				//"cancel_request_amount" : 2000, //환불 금액
				//"reason" : "테스트 결제 환불", //환불 사유
				//"refund_holder" : "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
				//"refund_bank" : "88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드
				//"refund_account" : "217051-52-123224"//[가상계좌 환불시필수입력] 환불 가상계좌 번호
			}
		}).done(function(result){ //환불 성공시 로직
			alert("환불 성공 :" + result);
		}).fail(function(error){//환불 실패시 로직
			alert("환불 실패" + error);
		});
	}
	
	
	
</script>
<body>

	<div class="body_content">

		<header id="header">

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
				<div class="search-wrapper">
					<input class="search-box input" type="text" placeholder="Search">
					<button class="search-box btn" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<!-- nav-menu -->
		</header>


		<div class="content-wrap">

			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section" id="left">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="home_list.bo">가정분양</a></li>
					<li class="list-group-item click"><a href="fdoclist.bo">책임분양</a></li>
					<li class="list-group-item"><a href="selladopt_list.bo">업체분양</a></li>
				</ul>
			</div>

			<!-- 오른쪽. 내용이 들어갈 부분 -->

			<div class="content-section" id="right">
				<!-- 수정시작 -->
				<div class="contents">
					<div class="article-head">
						<p style="font-szie:16px;font-weight:bold;">분양 &nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;책임분양 게시판</p>
						<h2 class="headsubject"><%=vo.getFdoc_subject()%></h2>
						<p class="name"><%=vo.getFdoc_nick()%></p>
						<div class="option-info">
							<span class="big option"> <%
 	if (vo.getFdoc_big().equals("강아지")) {
 %>
								<i class="fas fa-dog"></i> <%
 	} else if (vo.getFdoc_big().equals("고양이")) {
 %>
								<i class="fas fa-cat"></i> <%
 	} else {
 %> <i class="fas fa-dove"></i>
								<%
									}
								%> &nbsp;<%=vo.getFdoc_big()%></span> <span class="kind_of option"><i
								class="fas fa-tags"></i>&nbsp;<%=vo.getFdoc_kindof()%></span> <span
								class="local option"><i
								class="fas fa-map-marker-alt"></i>&nbsp;<%=vo.getFdoc_loc()%></span>
					
							<span class="expiry option"><i
								class="fas fa-clipboard-list" title="책임기간"></i>&nbsp;<%=vo.getFdoc_expiry()%>개월</span>
							<span class="price option"><i class="fas fa-won-sign"
								title="책임분양비"></i>&nbsp;<%=form.format(vo.getFdoc_price())%>원</span>
					 </div> 
						<div class="option-info">
							<span class="date option"><i class="far fa-clock"></i>&nbsp;<%=vo.getFdoc_date()%></span>
							<span class="pv option"><i class="far fa-eye"></i>&nbsp;<%=vo.getFdoc_readcount()%></span>
							<span class="cmt"><i class="far fa-comment"></i>&nbsp;<%=vo.getFdoc_comment()%></span>
							<div class="option-wrap">
							<%
								if (id != null) {

									if (!id.equals(vo.getFdoc_nick())) {
							%>
							<span><a href="#"
								onclick="warning_ori(<%=vo.getFdoc_no()%>,'<%=vo.getFdoc_nick()%>','<%=vo.getFdoc_subject()%>');">신고하기</a></span>
							<%
								} else {
							%>
							<span><a href="fdoc_update.bo?fdoc_no=<%=vo.getFdoc_no()%>">수정</a>&nbsp;&nbsp;&nbsp;</span><span><a href="fdoc_delete.bo?fdoc_no=<%=vo.getFdoc_no()%>">삭제</a></span>
							<%
								}
								}
							%>
						</div>
						</div>
					</div>
					<div class="article-view-content">
						<div class="article-content">
							<%=vo.getFdoc_content()%>
						</div>
						<%
									if (id != null) {
								%>
						<div class="">
							책임 분양 안내사항&nbsp;&nbsp;<input type="checkbox" id="fdoc_agree"
								value="Y"><span id="agree_check"><font size="2"
								color="#737373">&nbsp;&nbsp;안내사항과 분양코드를 입력하세요</font></span>
						
							
							<div class="agreement">
								<textarea cols="154" rows="10" readonly
									style="background-color: #f3f5f7;">
 제 1 장 총 칙

 

제 1 조 (목적)
이 약관은 {COMPANY_NAME}(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

 

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

 

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

 

제 2 장 서비스 이용계약

 

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

 

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

 

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우

 

제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.

 

제 3 장 계약 당사자의 의무

 

제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.

 

제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

 

제 4 장 서비스 제공 및 이용

 

제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.

 

제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.

 

제5장 계약사항의 변경, 해지

 

제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.

 

제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.

 

제6장 손해배상

 

제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.

 

제 15 조 (관할법원)

 

서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.

 

[부칙]

 

(시행일) 이 약관은 2015년 01월부터 시행합니다.
     		 </textarea>
							</div>
							<div style="margin-top: 15px;">
								<span id="code_check"><font size="2" color="#737373">분양코드는
										분양자와 연락하여 받으세요&nbsp;&nbsp;&nbsp;</font></span> <span>분양코드 : <input type="text"
									id="fdoc_code" size="8" onblur="fdoc_check();">&nbsp;&nbsp;&nbsp;<input 
									type="button" id="pay_button" disabled value="결제하기"
									onclick="pay();"></span>
							</div>
							
								
						</div>

					<%
									}
								%>



					</div>
						<div class="cont_comment" style="background-color: #f8f8f8;">
							<div style="width: 100%; margin: 0;">
								<div class="comment_view">
									<ul class="list_comment"></ul>
								</div>
							</div>
							<div style="margin: 0; width: 100%; background-color: #F8F8F8;">
								<%
									if (id != null) {
								%>
								<div id="fdoc_refly"></div>
								<%
									}
								%>
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


