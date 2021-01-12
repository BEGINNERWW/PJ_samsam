<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.text.SimpleDateFormat"%>
 <%
    String fdoc_no = request.getParameter("fdoc_no");
 	String fdoc_Nick =request.getParameter("fdoc_Nick");
 	String id = request.getParameter("id");
 	id = "1";
 	String email = request.getParameter("email");
 	email = "gmail.com";
 	
    %>
<head>
<style>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jquery modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<div class="cont_comment" style="width:100%;background-color: #f8f8f8;">
 <div style="width:100%; margin:0;">
    	<div class="comment_view">
    	<ul class="list_comment"></ul>
    	</div>
    </div>
 <div style="margin:0; width:100%; background-color:#F8F8F8;">
    <%if(id!=null){ %>
    <div id="fdoc_refly">   
    </div>
    <%} %>
    </div>
  
   </div>

<script>


function warning(cno,dno,cnick,content){
	event.preventDefault();
	$('#ex7').empty();
	var a = '';
	var id ='<%=id %>';
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
    	var fdoc_no =<%=fdoc_no%>
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
    	
    	var fdoc_no =<%=fdoc_no%>
    	var id = '<%=id %>'
    	var writer = '<%=fdoc_Nick%>'
    	
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
        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    				
    				}else{
    					
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
    	        				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	
    	
    	var fdoc_no =<%=fdoc_no%>
    	var id = '<%=id %>'
    	var writer = '<%=fdoc_Nick%>'
    	
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    		            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
    		            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    		            				a += '</div></div></div></li>';
    	    						
    	    						}else{
    	    							
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
    		            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    		            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    		            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
    		            				a += '<div class="comment_more">';
    		            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    			
    				}else{
    					
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
    	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
    	            				a += '</div></div></div></li>';
    	    					
    	    					}else{
    	    						
    	    						a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
    	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
    	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
    	            				a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+value.fdoc_ccontent+'</span></p></div>';
    	            				a += '<div class="comment_more">';
    	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
        	            				//a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
        	            				a += '</div></div></div></li>';
    	    						
    	    						}else{
 	
    	    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_re"><div class="comment_info">';
        	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
        	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
        	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
        	            				a += '<div class="comment_more">';
        	            				a += '<a class="link_write" href="#" onclick="commentList();">접기</a>';
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	
    	var fdoc_no =<%=fdoc_no%>
    	var id = '<%=id %>'
    	var writer = '<%=fdoc_Nick%>'
    	
    	
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
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
	            				a += '<a class="link_write" href="#" onclick="commentRefly('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">답글</a>';
	            				a += '</div></div></div></li>';
            				
    						}else{
    							
    							a += '<li class="refly_section" style="background-color:#EFF3F7;" id="refly'+value.fdoc_cno+'"><div class="comment_section"><div class="comment_info">';
	            				a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+value.fdoc_cnick+'</b></div>';
	            				a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+getFormatDate(date)+'</span></div>';
	            				a += '<div class="box_post"><p class="desc_info"><span class="ico_bbs ico_lock">비밀글(이미지)</span><span class="original_comment">&nbsp;&nbsp;&nbsp;'+value.fdoc_ccontent+'</span></p></div>';
	            				a += '<div class="comment_more">';
	            				a += '<a class="link_write" href="#" onclick="commentUpdateForm('+value.fdoc_cno+',\''+value.fdoc_ccontent+'\',\''+value.fdoc_cnick+'\',\''+getFormatDate(date)+'\');">수정</a>';
	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    				
    				}else{
    					
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
        	            				a += '<a class="link_write" href="#" onclick="commentDelete('+value.fdoc_cno+');">삭제</a>';
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
    	
    	var fdoc_no =<%=fdoc_no%>
    	
    	
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
    
    function commentDelete(cno){
    	$.ajax({
    		url: 'comment_delete.bo',
    		//type: 'post',
    		data : {'fdoc_cno' : cno},
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

</script>
