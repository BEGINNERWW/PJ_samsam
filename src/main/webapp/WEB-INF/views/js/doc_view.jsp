<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.samsam.community.DocVO" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	DocVO vo = (DocVO)request.getAttribute("vo");
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	id = "abc1";
	email = "456@gmail.com";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

  
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
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
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
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
    padding: 2px;
    
}
.name{
color:#37acc9;
font-size: 14px;
margin-top: 16px;
line-height: 16px;
}
.agreement{
	margin:10px auto;
}
li, ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.dropdown-menu {
    display: none;
    justify-content: flex-start;
    position: absolute;
    list-style: none;
    visibility: visible;
    background-color: rgb(0,0,0,0);
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
    padding: 0 100px;
}
.cont_comment{
    width: 1000px;
    height: 100%;
    position: absolute;
    left: 200px;
    text-align: left;
    font-size: 14px;
    margin-top: 3px;
    color: black;
    margin-left: 50px;
}
.cont_comment .txt_date {
    color: #959595;
}

.comment_view{
padding-top: 10px;
}
.comment_section .comment_info .comment_post .opt_more_g{
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
.link_write:hover{
	text-decoration:underline;
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
.comment_more .link_write{
    color: #666;
    float: left;
    margin-right:10px;
    
}
.comment_section .comment_info .comment_post .ico_bbs {
    margin-top: 2px;
    margin-left: 1px;
}
.comment_re .comment_post + .comment_write {
    padding-top: 23px;
}

.ico_bbs.ico_lock{
    width: 14px;
    height: 14px;
    margin-top:3px;
}

.ico_bbs {
    display: inline-block;
    vertical-align: top;
    text-indent: -9999px;
}
.ico_bbs.ico_lock {
    background: url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/14_lock.svg);
}


body, button, div, input, select, table, td, textarea, th {

    font-family: Arial, "Malgun Gothic", "맑은 고딕", system-ui, -apple-system, AppleSDGothicNeo-Regular, Helvetica, sans-serif;
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
.comment_section .comment_info .comment_post .ico_bbs.ico_new, .comment_section .comment_info .comment_post .ico_role, .comment_section .comment_info .comment_post .link_write, .comment_section .comment_info .comment_post .tag_comment, .comment_section .comment_info .comment_post .txt_date, .comment_section .comment_info .comment_post .txt_name {
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
    background-color: rgba(0,0,0,0);
    vertical-align: top;
}
button, input, select {
    font-size: 13px;
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
}
.btn_g_ico.ico_on .ico_lock_state {
    background: url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_on.svg);
}
.ico_bbs.ico_lock_state {
    background: url(//t1.daumcdn.net/cafe_image/cf_img4/skin/W01/18_lock_default.svg);
}
.btn_g_ico.ico_on .ico_lock_state,.ico_bbs.ico_lock_state{
    width: 18px;
    height: 18px;
}
.text_write_g .wrap_menu .btn_group {
    display: inline-block;
    margin-left: 15px;
}

.text_write_g .box_textarea .info_text, .text_write_g .box_textarea textarea {
    width: 100%;
    height: 86px;
    padding: 0;
    border: 0;
    font-size: 13px;
    background-color: rgba(0,0,0,0);
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
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
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
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
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

  
</style>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script>
function warning_ori(dno,cnick,content){
	
	event.preventDefault();
	$('#ex7').empty();
	var a = '';
	var id ='<%=id %>';
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
		url : 'doc_warning.bo',
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

$(document).ready(function() {
	
	function warning(){
		event.preventDefault();
		$('#ex7').modal('show');
	}
	
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

</head>

<body>
			<!-- 수정시작 -->
			<div class="contents" style="width:60%; margin:auto;">
			<div class="article-head">
			<h1>커뮤니티 > 자유 게시판</h1>
			<h2><%=vo.getDoc_subject() %></h2>
			<p class="name"><%=vo.getDoc_nick() %></p>
			
			<div class="wrap-info">
			<span class="date"><i class="far fa-clock"></i>&nbsp;<%=vo.getDoc_date() %></span>
			<span class="pv"><i class="far fa-eye"></i>&nbsp;<%=vo.getDoc_readcount() %></span>
			<span class="cmt"><i class="far fa-comment"></i>&nbsp;<%=vo.getDoc_comment() %></span>
			</div>
			</div>
			<div class="article-view-content">
			<div class="article-content">
			<%=vo.getDoc_content() %>
			</div>
			<div class="option-wrap">
			<%if(id !=null){  
			
			if(!id.equals(vo.getDoc_nick())){%>
			<span><a href="#" onclick="warning_ori(<%=vo.getDoc_no()%>,'<%=vo.getDoc_nick()%>','<%=vo.getDoc_subject()%>');">신고하기</a></span>
			<%}else{ %>
			<span>수정</span><span>삭제</span>
			<%}} %>
			</div>
			</div>
			</div>
			
 <div id="ex7" class="modal"> 
 </div>
 
	<div id="ex1" class="modal">
  	<p>신고가 접수되었습니다. 감사합니다</p>
 	<a href="#" rel="modal:close">Close</a>
 	
</div>
</body>
</html>