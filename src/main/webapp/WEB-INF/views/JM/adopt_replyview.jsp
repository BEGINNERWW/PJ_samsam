<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<%

String home_no = request.getParameter("home_no");

String home_nick = "user";
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
	
	<div class="text_write_g comment_write">
	
		<div class="inner_text_write">
		
			<div class="box_textarea">
				<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." id ="home_ccontent"  maxlength="600" style="height: 86px;"></textarea>
								
			</div>

			<div class="wrap_menu">

				
				<div class="area_r">
					<span class="num_text"><span class="sr_only">글자 수</span><span class="num_count empty">0</span>/<span class="sr_only">총 글자 갯수</span>600</span>
					<button class="btn_g_ico btn_item secret_button" data-is-hidden=""><span class="ico_bbs ico_lock_state" id="secretcheck">비밀글</span></button>
					<div class="btn_group">
						<button class="btn_g full_type1 confirm_button"  style="font-size: 13px;" name = "adopt_replyBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>

</div>
<script type = "text/javascript" src = "https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
 	
	function reply_reTextarea(cno) {//답글버튼 클릭시
		
		$.ajax({ 	
			url : 'adopt_replylist.bo',
			type : 'post',
			data : {'home_no':home_no},	
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success :function(data){
				var a= '';
					
		            $.each(data, function(key, value){
			            if(value.home_cemail==home_nick){
			            	if(value.home_lev !=0){
			            		if(value.home_cno ==cno){
						            a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
						            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
						            a += '<a href="#" onclick="replyDelete('+value.home_cno+');">&nbsp;&nbsp;삭제</a></div>';
						            a += '<a href="#" class = reply_reTextarea onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
						            a += '</div></div></div>';
						            
			            		}
			            		
			            		else{
			            			a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
						            a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
						            a += '<a href="#" onclick="replyDelete('+value.home_cno+');">&nbsp;&nbsp;삭제</a></div>';
						            a += '<a href="#" class = reply_reTextarea onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>'; 
						            a += '</div></div></div>';
			            		}
				            }
			            	else{
			            		
				            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>';
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
								if(value.home_cno ==cno){
									 a += '<input type="hidden" name="home_ref" value="'+cno+'">	';
									 a += '<input type="hidden" name="home_no" value="'+home_no+'">	';
									 a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
			            			 a += '<div class="box_textarea"><textarea wrap="hard" name="home_ccontent'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
			            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.home_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
			            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.home_cno+')">등록</button></div>';
			            			 a += '</div></div></div></div></div></div></li>';
							         
			            		}
			            	}
			            }
			            else{
			            	if(value.home_lev !=0){
					            a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
					            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
					            
					            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
					            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
					            a += '</div></div></div>';
				            }
			            	else{
			            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
						            
						        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						        a += '</div></div></div>';
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
			$.ajax({ 	
				url : 'adopt_replylist.bo',
				type : 'post',
				data : {'home_no':home_no},	
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success :function(data){
					var a= '';
					
			            $.each(data, function(key, value){
				            if(value.home_cemail==home_nick){
				            	if(value.home_lev !=0){
				            		 a += '<div class="replyspace" style="border-bottom:1px solid darkgray; margin:0px 0px 15px 39px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +'</strong>';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">33수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'; 
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
					            }	
				            	else{
				            		 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							         a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +'</strong>';
							         a += '<a href="#" onclick="commentUpdateForm('+value.home_cno+',\''+value.home_ccontent+'\');">22수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.home_cno+');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.home_cno+');">&nbsp;&nbsp;답글</a></div>'; 
							         a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							         a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small>'+value.home_cdate +'</small></p>';
							         a += '</div></div></div>';
				            	}
				            }
				            else{
				            	if(value.home_lev !=0){
						            a += '<div style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
						            
						            a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
						            a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
						            a += '</div></div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.home_cno+'"><strong>'  +value.home_cemail +	'</strong>' + '&nbsp;&nbsp;';
							            
							        a += '<div class="commentContent' +value.home_cno+'"> <p> '+value.home_ccontent +'</p>';
							        a += '<div class="cdate' +value.home_cno+'"> <p style = "color:#a497a4"><small> '+value.home_cdate +'</small></p>';
							        a += '</div></div></div>';
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
	    	if($('#secretcheck'+cno).attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
	    		updateSecret = 1;
	    	}else{
	    		updateSecret = 0;
	    	}
	    	
	    	var fdoc_no =<%=home_no%>
	    	
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
			
			var a = '';
			 a += '<div>';
			 a += '<input type ="text" name = "content'+cno+'" value = "'+content+'"/>';
			 a += '<span><button type = "button" onclick="commentUpdate('+cno+');">수정</button></span>';
			 a += '</div>';
			 
			 $('.commentContent'+cno).html(a);
		}
		
		//댓글 수정
		function commentUpdate(cno){
			var updateContent = $('[name=content_'+cno+']').val();
			
			$.ajax({
				url : 'comment_update.bo',
				//type : 'post',
				dataType : 'json',
				data : {'content':updateContent, 'cno':cno},
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
		
		//댓글 삭제
		function replyDelete(cno){
			
			$.ajax({
				url : 'homereply_delete.bo',
				//type : 'post',
				data : {'home_cno':cno},
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
		});
</script>