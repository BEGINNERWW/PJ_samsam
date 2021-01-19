<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- jquery modal -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />



<%

String home_no = request.getParameter("home_no");
String home_nick =request.getParameter("home_nick");
String id = request.getParameter("id");

id = "user";
%>
<head>
	<style>
		.comment_view .list_comment>li {
    position: relative;
    padding: 0 100px;
}
.cont_comment{
    margin: 0 -28px;
    padding: 0 0 29px;
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
a:link, a:visited {
    text-decoration: none;
    color: #666;
}
a:hover{
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
</head>

<div>

	
	<div>
		<div class = "adopt_replydiv"></div>
	</div>
	
	<div class="text_write_g comment_write" id = "aa">
	
		<div class="inner_text_write">
		
			<div class="box_textarea">
				<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." id ="home_ccontent"  maxlength="600" style="height: 86px;"></textarea>
								
			</div>

			<div class="wrap_menu">

				
				<div class="area_r">
					<span class="num_text"><span class="sr_only">글자 수</span><span class="num_count empty">0</span>/<span class="sr_only">총 글자 갯수</span>600</span>
					<button class="btn_g_ico btn_item secret_button" id="secretcheck" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>
					<div class="btn_group">
						<button class="btn_g full_type1 confirm_button"  style="font-size: 13px;" name = "adopt_replyBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	<div style="margin:0; width:100%; background-color:#F8F8F8;">
    <%if(id!=null){ %>
    <div id="fdoc_refly">   
    </div>
    <%} %>
    </div>
    
    <div id="ex7" class="modal" style = "overflow:visible;"></div>
	<div id="ex1" class="modal">
  		<p>신고가 접수되었습니다. 감사합니다</p>
 		<a href="#" rel="modal:close">Close</a>
 	
	</div>

</div>


<script>

var home_no = <%=home_no %>; 
var home_nick ='<%=home_nick %>';

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
	
	
	 function commentDelete(cno,lev){
	       
	       
	       $.ajax({
	          url: 'comment_delete.bo',
	          //type: 'post',
	          data : {'home_cno' : cno , 'home_lev' : lev , 'home_no' : home_no},
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
	
	
	
	//신고
	
	function warning(cno,dno,cnick,content){
	event.preventDefault();
	$('#ex7').empty();
	var a = '';
	var id ='<%=id %>';
	a += '<div class="modal-header"><h1>신고하기</h1></div>';
	a += '<div class="modal-body">';
	a += '<form id= "warning_form" name="warning_form" method="post" action="warning.bo">';
	a += '<input type="hidden" name="w_fdoc_cno" value="'+cno+'">';
	a += '<input type="hidden" name="w_fdoc_dno" value="'+dno+'">';
	a += '<input type="hidden" name="w_fdoc_id" value="'+id+'">';
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
 	
	function reply_reTextarea(cno) {//답글버튼 클릭시
		var home_no =<%=home_no%>
    	var id = '<%=id %>'
    	var writer = '<%=home_nick%>'
    	
		$.ajax({ 	
			url : 'adopt_replylist.bo',
			type : 'post',
			data : {'home_no':home_no},	
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success :function(data){
				var a= '';
					
		            $.each(data, function(key, value){
		            	if(id==writer && id != value.home_cnick && id!='null'){//원글 작성자일때
		            		if(value.home_lev !=0){	 //원글이 아닐시
		            			a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;" >';
					            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
					            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
					            a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a></div>';
					            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
					            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
					            a += '</div></div></div>';
				            }
			            	else{
			            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
						         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
						         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
						         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
						         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						         a += '</div></div></div>';
						         
						         
							if(value.home_cno ==cno){
								 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
								 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
								 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
		            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
		            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
		            			 a += '</div></div></div></div></div></div></li>';
							         
			            		}
			            	}
		            	}
		           	 	else if(id == value.home_cnick && id != 'null'){ //작성자일시
			            	if(value.home_lev !=0){	 //원글이 아닐시
		            			a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;" >';
					            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
					            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
					            a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a></div>';
					            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
					            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
					            a += '</div></div></div>';
				            }
			            	else{
			            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
						         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
						         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
						         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
						         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						         a += '</div></div></div>';
							if(value.home_cno ==cno){
								 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
								 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
								 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
		            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
		            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
		            			 a += '</div></div></div></div></div></div></li>';
							         
			            		}
			            	}
			            }
			            else if(id != value.home_cnick && id != 'null'){//작성자가 아닐시
			            	if(value.home_csecret == 0){//비밀글이 아닐시
				            	if(value.home_lev !=0){ //답글일때
						            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';         
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						            a += '</div></div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';   
							        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							        a += '</div></div></div>';
							        if(value.home_cno ==cno){
										 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
										 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
										 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 0px;"><div class="inner_text_write">';
				            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
				            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
				            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
				            			 a += '</div></div></div></div></div></div></li>';
								         
				            		}
				            	}
			            	}
			            	else{//비밀글이 맞을시
			            		if(value.home_lev !=0){
						            a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';
						            
						            a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						            a += '</div></div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';
							            
							        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
							        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							        a += '</div></div></div>';
				            	}
			            	}
			            }
			            else{//비로그인시
			            	if(value.home_csecret == 0){//비밀글이 아닐시
				            	if(value.home_lev !=0){
						            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';         
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						            a += '</div></div></div>';
						            
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';   
							        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							        a += '</div></div></div>';
				            	}
			      
			            	}
			            	else{//비밀글이 맞을시
			            		if(value.home_lev !=0){
						            a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';
						            
						            a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						            a += '</div></div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';
							            
							        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
							        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							        a += '</div></div></div>';
				            	}
			            	}
			            }
		            });
				
				$(".adopt_replydiv").html(a);
			},
			error:function(){
				alert("ajax통신 실패(list)!!!");
			}	
		});
		 event.preventDefault();
	}
	
 
	$('[name=adopt_replyBtn]').click(function(){ //댓글 등록
		adoptreplyinsert(); 
		});
		
		
		
		
		function adoptreplyList(){//댓글 목록
			var home_no =<%=home_no%>
	    	var id = '<%=id %>'
	    	var writer = '<%=home_nick%>'
	    	
			$.ajax({ 	
				url : 'adopt_replylist.bo',
				type : 'post',
				data : {'home_no':home_no},	
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success :function(data){
					var a= '';
					
			            $.each(data, function(key, value){
			            	if(id==writer && id != value.home_cnick && id!='null'){//원글 작성자일때
			            		if(value.home_lev ==2){	 //원글이 아닐시
			            			a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;" >';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
						            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
						            a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a></div>';
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
						            a += '</div></div></div>';
					            }
				            	else if(value.home_lev == 3){
				                    
				                   a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.home_cno+'"><div class="comment_section"><div class="comment_info">';
				                   a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
				                   a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
				                   a+= '</p></div></div></div></div></li>';
				                    
				                 }
			            	
				            	else{
				            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
								if(value.home_cno ==cno){
									 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
									 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
									 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
			            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
			            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
			            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
			            			 a += '</div></div></div></div></div></div></li>';
								         
				            		}
				            	}
			            	}
			            	else if(id==value.home_cnick && id!='null'){//작성자일 경우
				            	if(value.home_lev !=0){//댓글일시
				            		 a += '<div class="replyspace" style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong>';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
							         a += '</div>'; 
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
					            }	
				            	else{
				            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong>';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'; 
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
				            	}
				            }
				            else if(id!=value.home_cnick && id!='null'){//작성자가 아닐시
				            	if(value.home_csecret == 0){ //비밀글이 아닐시
					            	if(value.home_lev !=0){//댓글일시
							            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
							            a += '<a class="link_write" href="#" onclick="warning('+value.home_cno+','+home_no+',\''+value.home_cnick+'\',\''+value.home_ccontent+'\');">신고</a></div>';
							            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							            a += '</div></div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
								        a += '<a class="link_write" href="#" onclick="warning('+value.home_cno+','+home_no+',\''+value.home_cnick+'\',\''+value.home_ccontent+'\');">신고</a>';
								        a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'
								        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
								        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								        a += '</div></div></div>';
					            	}
				            	}
				            	else{
			            		//비밀글이 맞을시
				            		if(value.home_lev !=0){
							            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong></div>';	      
							            a += '<div class="commentContent' +value.home_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
							            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							            a += '</div></div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
								        a += '</div>';
								        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
								        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								        a += '</div></div></div>';
					            	}
				            	}
				            }
				            else{//비로그인일시
				            	if(value.home_csecret == 0){ //비밀글이 아닐시
					            	if(value.home_lev !=0){
							            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';	      
							            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							            a += '</div></div></div>';
							            $('#aa').empty();
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
								        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
								        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								        a += '</div></div></div>';
								        $('#aa').empty();
					            	}
				            	}
				            	else{
			            		//비밀글이 맞을시
				            		if(value.home_lev !=0){
							            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong></div>';	      
							            a += '<div class="commentContent' +value.home_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
							            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							            a += '</div></div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
								        a += '</div>';
								        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
								        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								        a += '</div></div></div>';
					            	}
				            	}
				            }
			            });
					
					$(".adopt_replydiv").html(a);
				},
				error:function(){
					alert("ajax통신 실패(list)!!!");
				}
				
			});
		}
		
		
			
			var home_no = <%=home_no %>; 
			var home_nick ='<%=home_nick %>';
			//댓글 목록
			
		
	
		//댓글 등록	
		function adoptreplyinsert(){
				
			var home_ccontent = $('#home_ccontent').val();
	    	home_ccontent = home_ccontent.replace(/(?:\r\n|\r|\n)/g, '<br />');
	    	var home_no =<%=home_no%>
	    	var updateSecret ='';
	    	if($('#secretcheck').attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
	    		updateSecret = 1;
	    	}else{
	    		updateSecret = 0;
	    	}
	    	
			$.ajax({
				url : 'adopt_replyinsert.bo',
				type : 'post',
				data:{'home_ccontent' : home_ccontent,'home_csecret' : updateSecret ,'home_no' : home_no},
				success :function(data){
					
					if(data == 1){
						adoptreplyList(); //댓글 작성후 댓글 목록 reload
						$('[name=home_ccontent]').val('');
					}
				},
				error:function(){
					alert("ajax통신 실패(insert)!!!");
				}
			});
		}
		
		function adoptreplyreinsert(cno){ //대댓글 등록
			
			var updateContent = $('[name=home_ccontent'+cno+']').val();
	    	updateContent = updateContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
	    	var updateSecret ='';
	    	if($('#secretcheck'+cno).attr('class') == 'btn_g_ico btn_item secret_button ico_on'){
	    		updateSecret = 1;
	    	}else{
	    		updateSecret = 0;
	    	}
	    
	    	
	    	var home_no =<%=home_no%>
	    	
			$.ajax({
				url : 'adopt_replyReinsert.bo',
				type : 'post',
				data : {'home_ccontent' : updateContent, 'home_cno' : cno , 'home_csecret' : updateSecret ,'home_ref' : cno , 'home_lev' : 1 ,'home_no' : home_no},	
				success :function(data){
					if(data == 1){
						adoptreplyList(); //댓글 작성후 댓글 목록 reload
						$('[name=home_ccontent]').val('');
					}
				},
				error:function(){
					alert("ajax통신 실패(insert)!!!");
				}
			});
		}
		
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
		function commentUpdateForm(cno,content){
			var home_no =<%=home_no%>
	    	var id = '<%=id %>'
	    	var writer = '<%=home_nick%>'
	    	
	    		$.ajax({ 	
					url : 'adopt_replylist.bo',
					type : 'post',
					data : {'home_no':home_no},	
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					success :function(data){
						var a= '';
						
				            $.each(data, function(key, value){
				            	if(id==writer && id != value.home_cnick && id!='null'){//원글 작성자일때
				            		if(value.home_lev !=0){	 //원글이 아닐시
				            			a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;" >';
							            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
							            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
							            a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a></div>';
							            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
							            a += '</div></div></div>';
						            }
					            	else{
					            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
								         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>' + '&nbsp;&nbsp;';
								         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
								         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
								         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
								         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
								         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								         a += '</div></div></div>';
									if(value.home_cno ==cno){
										 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
										 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
										 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
				            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
				            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
				            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
				            			 a += '</div></div></div></div></div></div></li>';
									         
					            		}
					            	}
				            	}
				            	else if(id==value.home_cnick && id!='null'){//작성자일 경우
					            	if(value.home_cno == cno){
					            		if(value.home_lev ==0){//댓글 수정시
						            		 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 0px;"><div class="inner_text_write">';
					            			 a += '<div class="box_textarea"><textarea wrap="hard" name="Uhome_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
					            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
					            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.home_cno+')">등록</button></div>';
					            			 a += '</div></div></div></div></div></div></li>';
					            		}
					            		else{
					            			 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
					            			 a += '<div class="box_textarea"><textarea wrap="hard" name="Uhome_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
					            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
					            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.home_cno+')">등록</button></div>';
					            			 a += '</div></div></div></div></div></div></li>';
					            		}
					            	}
					            	else{
					            	
						            	if(value.home_lev !=0){//댓글일시
						            		 a += '<div class="replyspace" style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
									         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong>';
									         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
									         a += '</div>'; 
									         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
									         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
									         a += '</div></div></div>';
							            }	
						            	else{
						            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
									         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong>';
									         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.home_cno+',\''+value.home_lev+'\');">&nbsp;&nbsp;삭제</a>';
									         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'; 
									         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
									         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
									         a += '</div></div></div>';
						            	}
					            	}
					            }
					            else if(id!=value.home_cnick && id!='null'){//작성자가 아닐시
					            	if(value.home_csecret == 0){ //비밀글이 아닐시
						            	if(value.home_lev !=0){
								            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';	      
								            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
								            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								            a += '</div></div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
									        a += '<a class="link_write" href="#" onclick="warning('+value.home_cno+','+home_no+',\''+value.home_cnick+'\',\''+value.home_ccontent+'\');">신고</a>';
									        a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'
									        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
									        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
									        a += '</div></div></div>';
						            	}
					            	}
					            	else{
				            		//비밀글이 맞을시
					            		if(value.home_lev !=0){
								            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong></div>';	      
								            a += '<div class="commentContent' +value.home_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
								            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								            a += '</div></div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
									        a += '</div>';
									        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
									        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
									        a += '</div></div></div>';
						            	}
					            	}
					            }
					            else{//비로그인일시
					            	if(value.home_csecret == 0){ //비밀글이 아닐시
						            	if(value.home_lev !=0){
								            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong></div>';	      
								            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
								            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								            a += '</div></div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
									        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
									        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
									        a += '</div></div></div>';
						            	}
					            		
					            	}
					            	else{
				            		//비밀글이 맞을시
					            		if(value.home_lev !=0){
								            a += '<div style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +'</strong></div>';	      
								            a += '<div class="commentContent' +value.home_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
								            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
								            a += '</div></div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cnick +	'</strong>';
									        a += '</div>';
									        a += '<div class="commentContent' +value.home_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
									        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
									        a += '</div></div></div>';
						            	}
					            	}
					            }
				            });
						
						$(".adopt_replydiv").html(a);
					},
					error:function(){
						alert("ajax통신 실패(list)!!!");
					}
					
				});
		}
		
		//댓글 수정
		function commentUpdate(cno){
			var updateContent = $('[name=Uhome_ccontent'+cno+']').val();
			$.ajax({
				
				url : 'comment_update.bo',
				//type : 'post',
				dataType : 'json',
				data : {'home_ccontent':updateContent, 'home_cno':cno},
				contentType :'application/x-www-form-urlencoded; charset=utf-8',
				success :function(data){
					if(data == 1)
						adoptreplyList(); 

				},
				error:function(){
					alert("ajax통신 실패(update)!!!");
				}
			});
		}
		
		//댓글 삭제
		function replyDelete(cno,lev){

			$.ajax({
				url : 'homereply_delete.bo',
				//type : 'post',
				data : {'home_cno':cno,'home_lev':lev},
				dataType : 'json',
				contentType :'application/x-www-form-urlencoded; charset=utf-8',
				success :function(data){
					if(data == 1)
						adoptreplyList(); //댓글 작성후 댓글 목록 reload

				},
				error:function(){
					alert("ajax통신 실패(update)!!!");
				}
			});
		}
		
		
		
		
		
		$(document).ready(function(){
			adoptreplyList();//페이지 로딩시 댓글 목록 출력
			$(document).on('click','.btn_g_ico',function() {
	    		
	    		($(this).attr('class') == 'btn_g_ico btn_item secret_button ico_on') ? $(this).attr('class','btn_g_ico btn_item secret_button') : $(this).attr('class','btn_g_ico btn_item secret_button ico_on');
	    		
	        });
			
			
			
			//신고사유중 기타를 눌렀을시
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