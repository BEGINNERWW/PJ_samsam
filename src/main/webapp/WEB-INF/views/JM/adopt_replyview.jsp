<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- jquery modal -->




<%



String doc_no = request.getParameter("doc_no");
String doc_email = request.getParameter("doc_email");
String doc_nick =request.getParameter("doc_nick");



%>
<head>

</head>

<div>

	
	<div>
		<div style="width: 100%; margin: 0;">
			<div class="comment_view">
				<ul class="adopt_replydiv"></ul>
			</div>
		</div>
		
		
		<div style="margin: 0; width: 100%; background-color: #F8F8F8;">
			<%
				if (doc_email != null) {
			%>
			<div id="fdoc_refly"></div>
			<%
				}
			%>
		</div>
	</div>
	
	<%
	if(doc_email == null){
	%>
	
	<div id="fdoc_refly"></div>
	<% 
	}
	else{
	%>
	
	<div class="text_write_g comment_write" id = "aa">
	
		<div class="inner_text_write">
		
			<div class="box_textarea">
				<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." id ="doc_content"  maxlength="600" style="height: 86px;"></textarea>
								
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
	<%
	}
	 %>
	
	<div style="margin:0; width:100%; background-color:#F8F8F8;">
    <%if(doc_email!=null){ %>
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

var doc_no = <%=doc_no %>; 
var doc_nick ='<%=doc_nick %>';

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
	          data : {'doc_cno' : cno , 'doc_lev' : lev , 'doc_no' : doc_no},
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
	var email ='<%=doc_email %>';
	a += '<div class="modal-header"><h1>신고하기</h1></div>';
	a += '<div class="modal-body">';
	a += '<form id= "warning_form" name="warning_form" method="post" action="warning.bo">';
	a += '<input type="hidden" name="w_fdoc_cno" value="'+cno+'">';
	a += '<input type="hidden" name="w_fdoc_dno" value="'+dno+'">';
	a += '<input type="hidden" name="w_fdoc_id" value="'+email+'">';
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
	a += '<button type="button" id="waring_submit" onclick="warning_submit();" class="btn btn-default">신고하기</button>';
	a += '<button type="button" onclick="modal_close();" class="btn btn-default">취소하기</button>';
	
	
	
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
		var doc_no =<%=doc_no%>
    	var email = '<%=doc_email %>'
    	var writer = '<%=doc_email%>'
    	
		$.ajax({ 	
			url : 'adopt_replylist.bo',
			type : 'post',
			data : {'doc_no':doc_no},	
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success :function(data){
				var a= '';
					
		            $.each(data, function(key, value){
		            	if(email==writer && email != value.doc_email && email!='null'){//원글 작성자일때
		            		if(value.doc_lev !=0){	 //원글이 아닐시
		            			a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 0px 39px;" >';
					            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>' + '&nbsp;&nbsp;';
					            a += '<a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\' );">수정</a>';
					            a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a></div>';
					            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
					            a += '</div></div>';
				            }
			            	else{
			            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
						         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>' + '&nbsp;&nbsp;';
						         a += '<a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
						         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
						         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></div>';
						         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
						         a += '</div></div>';
							if(value.doc_cno ==cno){
								 a += '<input type="hidden" name="doc_ref" value="'+cno+'">	';
								 a += '<input type="hidden" name="doc_no" value="'+doc_no+'">	';
								 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
		            			 a += '<div class="box_textarea"><textarea wrap="hard" name="doc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
		            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.doc_cno+')">등록</button></div>';
		            			 a += '</div></div></div></div></div></div></li>';
							         
			            		}
			            	}
		            	}
		           	 	else if(email == value.doc_email && email != 'null'){ //댓글 작성자일시
			            	if(value.doc_lev !=0){	 //원글이 아닐시
		            			a += '<div style="border-bottom:1px solid #eee; padding:0px 45px 0px 84px; background-color:#EFF3F7;" >';
					            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>' + '&nbsp;&nbsp;';
					            a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
					            a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a></span></div>';
					            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
					            a += '</div></div>';
				            }
			            	else{
			            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; padding:0px 45px 0px 45px; background-color:#EFF3F7;"">';
						         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>' + '&nbsp;&nbsp;';
						         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
						            a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
						         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
						         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
						         a += '</div></div>';
							if(value.doc_cno ==cno){
								 a += '<input type="hidden" name="doc_ref" value="'+cno+'">	';
								 a += '<input type="hidden" name="doc_no" value="'+doc_no+'">	';
								 a += '<div class="text_write_g comment_write" style = "padding:0px 0px 15px 84px; background-color:#EFF3F7;"><div class="inner_text_write">';
		            			 a += '<div class="box_textarea"><textarea wrap="hard" name="doc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
		            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
		            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.doc_cno+')">등록</button></div>';
		            			 a += '</div></div></div></div></div></div></li>';
							         
			            		}
			            	}
			            }
			            else if(id != value.doc_nick && id != 'null'){//작성자가 아닐시
			            	if(value.doc_secret == 0){//비밀글이 아닐시
				            	if(value.doc_lev !=0){ //답글일때
						            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
						            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';         
						            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';	           
						            a += '</div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';   
							        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							        a += '</div></div>';
							        if(value.doc_cno ==cno){
										 a += '<input type="hidden" name="doc_ref" value="'+cno+'">	';
										 a += '<input type="hidden" name="doc_no" value="'+doc_no+'">	';
										 a += '<div class="text_write_g comment_write" style = "padding:0px 45px 0px 84px;"><div class="inner_text_write">';
				            			 a += '<div class="box_textarea"><textarea wrap="hard" name="doc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
				            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
				            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.doc_cno+')">등록</button></div>';
				            			 a += '</div></div></div></div></div></div></li>';
								         
				            		}
				            	}
			            	}
			            	else{//비밀글이 맞을시
			            		if(value.doc_lev !=0){
						            a += '<div style="border-bottom:1px solid #eee; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';
						            
						            a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';         
						            a += '</div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';
							            
							        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
							        a += '</div></div>';
				            	}
			            	}
			            }
			            else{//비로그인시
			            	if(value.doc_secret == 0){//비밀글이 아닐시
				            	if(value.doc_lev !=0){
						            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
						            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';         
						            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';      
						            a += '</div></div>';
						            
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';   
							        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							        a += '</div></div>';
				            	}
			      
			            	}
			            	else{//비밀글이 맞을시
			            		if(value.doc_lev !=0){
						            a += '<div style="border-bottom:1px solid #eee; margin-bottom:15px;">';
						            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';
						            
						            a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
						            a += '</div></div>';
					            }
				            	else{
				            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
							        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';
							            
							        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
							       
							        a += '</div></div>';
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
			
			
			var doc_no =<%=doc_no%>
	    	var email = '<%=doc_email %>'
	    	var writer = '<%=doc_email%>'
	    	
			$.ajax({ 	
				url : 'adopt_replylist.bo',
				type : 'post',
				data : {'doc_no':doc_no},	
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success :function(data){
					var a= '';
					
			            $.each(data, function(key, value){
			            	var date = new Date(value.doc_date);
			            	if(email==writer && email != value.doc_email && email!='null'){//원글 작성자일때
			            		if(value.doc_lev ==2){	 //원글이 아닐시
			            			a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;" >';
						            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>' + '&nbsp;&nbsp;';
						            a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
						            a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a></span></div>';
						            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
						            a += '</div></div>';
					            }
				            	else if(value.doc_lev == 3){
				                    
				                   a+= '<li style="background-color:#F8F8F8;" id="refly"'+value.doc_cno+'"><div class="comment_section"><div class="comment_info">';
				                   a+= '<div class="comment_post"><div class="box_post"><p class="desc_info">';
				                   a+= '&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.';
				                   a+= '</p></div></div></div></div></li>';
				                    
				                 }
			            	
				            	else{
				            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
							         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>' + '&nbsp;&nbsp;';
							         a += '<span class ="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
							         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							         a += '</div></div>';
								if(value.doc_cno ==cno){
									 a += '<input type="hidden" name="doc_ref" value="'+cno+'">	';
									 a += '<input type="hidden" name="doc_no" value="'+doc_no+'">	';
									 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
			            			 a += '<div class="box_textarea"><textarea wrap="hard" name="doc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
			            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
			            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.doc_cno+')">등록</button></div>';
			            			 a += '</div></div></div></div></div></div></li>';
								         
				            		}
				            	}
			            	}
			            	else if(email==value.doc_email && email!='null'){//작성자일 경우
				            	if(value.doc_lev !=0){//댓글일시
				            		 a += '<div class="replyspace" style="border-bottom:1px solid #eee; background-color:#EFF3F7; padding:0px 45px 0px 84px;">';
							         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>';
							         a += '<span class ="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
							     
							         a += '</div>'; 
							         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							        
							         a += '</div></div>';
					            }	
				            	else{
				            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; background-color:#EFF3F7;">';
							         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>';
							         a += '<span class ="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
							         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
							         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
							         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							        
							         a += '</div></div>';
				            	}
				            }
				            else if(email!=value.doc_email && email!='null'){//작성자가 아닐시
				            	if(value.doc_secret == 0){ //비밀글이 아닐시
					            	if(value.doc_lev !=0){//댓글일시
							            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>';
							            a += '<span class= "btn_box>"<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a></div>';
							            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p></span>';
							   
							            a += '</div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>';
								        a += '<span class="btn_box>"<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
								        a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a><span></div>'
								        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
								        
								        a += '</div></div>';
					            	}
				            	}
				            	else{
			            		//비밀글이 맞을시
				            		if(value.doc_lev !=0){
							            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong></div>';	      
							            a += '<div class="commentContent' +value.doc_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
							          
							            a += '</div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>';
								        a += '</div>';
								        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
								        
								        a += '</div></div>';
					            	}
				            	}
				            }
				            else{//비로그인일시
				            	if(value.doc_secret == 0){ //비밀글이 아닐시
					            	if(value.doc_lev !=0){
							            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong></div>';	      
							            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							            a += '<div class="cdate' +value.doc_cno+'"> <p style = "color:#a497a4"><small> '+getFormatDate(date) +'</small></p>';
							            a += '</div></div></div>';
							            $('#aa').empty();
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'</strong>';
								        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
								        a += '<div class="cdate' +value.doc_cno+'"> <p style = "color:#a497a4"><small> '+getFormatDate(date) +'</small></p>';
								        a += '</div></div></div>';
								        $('#aa').empty();
					            	}
				            	}
				            	else{
			            		//비밀글이 맞을시
				            		if(value.doc_lev !=0){
							            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
							            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong></div>';	      
							            a += '<div class="commentContent' +value.doc_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
							            a += '<div class="cdate' +value.doc_cno+'"> <p style = "color:#a497a4"><small> '+getFormatDate(date) +'</small></p>';
							            a += '</div></div></div>';
						            }
					            	else{
					            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
								        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp;'+ getFormatDate(date)+'</strong>';
								        a += '</div>';
								        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
								        a += '<div class="cdate' +value.doc_cno+'"> <p style = "color:#a497a4"><small> '+getFormatDate(date) +'</small></p>';
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
		
		
			
			var doc_no = <%=doc_no %>; 
			var doc_nick ='<%=doc_nick %>';
			//댓글 목록
			
		
	
		//댓글 등록	
		function adoptreplyinsert(){
				
			var doc_content = $('#doc_content').val();
	    	doc_content = doc_content.replace(/(?:\r\n|\r|\n)/g, '<br />');
	    	var doc_no =<%=doc_no%>
	    	var updateSecret ='';
	    	if($('#secretcheck').attr('class')== 'btn_g_ico btn_item secret_button ico_on'){
	    		updateSecret = 1;
	    	}else{
	    		updateSecret = 0;
	    	}
	    	
			$.ajax({
				url : 'adopt_replyinsert.bo',
				type : 'post',
				data:{'doc_content' : doc_content,'doc_secret' : updateSecret ,'doc_no' : doc_no},
				success :function(data){
					
					if(data == 1){
						adoptreplyList(); //댓글 작성후 댓글 목록 reload
						$('[name=doc_content]').val('');
					}
				},
				error:function(){
					alert("ajax통신 실패(insert)!!!");
				}
			});
		}
		
		function adoptreplyreinsert(cno){ //대댓글 등록
			
			var updateContent = $('[name=doc_content'+cno+']').val();
	    	updateContent = updateContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
	    	var updateSecret ='';
	    	if($('#secretcheck'+cno).attr('class') == 'btn_g_ico btn_item secret_button ico_on'){
	    		updateSecret = 1;
	    	}else{
	    		updateSecret = 0;
	    	}
	    
	    	
	    	var doc_no =<%=doc_no%>
	    	
			$.ajax({
				url : 'adopt_replyReinsert.bo',
				type : 'post',
				data : {'doc_content' : updateContent, 'doc_cno' : cno , 'doc_secret' : updateSecret ,'home_ref' : cno , 'doc_lev' : 1 ,'doc_no' : doc_no},	
				success :function(data){
					if(data == 1){
						adoptreplyList(); //댓글 작성후 댓글 목록 reload
						$('[name=doc_content]').val('');
					}
				},
				error:function(){
					alert("ajax통신 실패(insert)!!!");
				}
			});
		}
		
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
		function commentUpdateForm(cno,content){
			var doc_no =<%=doc_no%>
	    	var email = '<%=doc_email %>'
	    	var writer = '<%=doc_email%>'
	    	
	    		$.ajax({ 	
					url : 'adopt_replylist.bo',
					type : 'post',
					data : {'doc_no':doc_no},	
					dataType : 'json',
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					success :function(data){
						var a= '';
						
				            $.each(data, function(key, value){
				            	if(email==writer && email != value.doc_email && email!='null'){//원글 작성자일때
				            		if(value.doc_lev !=0){	 //원글이 아닐시
				            			a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 0px 39px;" >';
							            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>' + '&nbsp;&nbsp;';
							            a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
							            a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a></span></div>';
							            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
							           
							            a += '</div></div>';
						            }
					            	else{
					            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
								         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>' + '&nbsp;&nbsp;';
								         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
								         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
								         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
								         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
								        
								         a += '</div></div>';
									if(value.doc_cno ==cno){
										 a += '<input type="hidden" name="doc_ref" value="'+cno+'">	';
										 a += '<input type="hidden" name="doc_no" value="'+doc_no+'">	';
										 a += '<div class="text_write_g comment_write" style = "margin:0px 0px 15px 39px;"><div class="inner_text_write">';
				            			 a += '<div class="box_textarea"><textarea wrap="hard" name="doc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
				            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
				            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="adoptreplyreinsert('+value.doc_cno+')">등록</button></div>';
				            			 a += '</div></div></div></div></div></div></li>';
									         
					            		}
					            	}
				            	}
				            	else if(id==value.doc_nick && id!='null'){//작성자일 경우
					            	if(value.doc_cno == cno){
					            		if(value.doc_lev ==0){//댓글 수정시
					            			 a += '<div class="commentArea" style="border-bottom:1px solid #eee; background-color:#EFF3F7; padding:0px 45px 0px 39px;">';
									         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>' + '&nbsp;&nbsp;';
									         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
									         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
									         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									         
									         a += '</div></div>';
									         
						            		 a += '<div class="text_write_g comment_write" style = "padding:0px 45px 0px 39px; background-color:#EFF3F7;"><div class="inner_text_write">';
					            			 a += '<div class="box_textarea"><textarea wrap="hard" name="Udoc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
					            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
					            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">등록</button></div>';
					            			 a += '</div></div></div></div></div></div></li>';
					            		}
					            		else{//대댓글
					            			a += '<div class="commentArea" style="border-bottom:1px solid #eee; background-color:#EFF3F7; padding:0px 45px 0px 84px;">';
									         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>' + '&nbsp;&nbsp;';
									         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
									         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>';
									         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									        
									         a += '</div></div>';
									        
					            			 a += '<div class="text_write_g comment_write" style = "padding:0px 45px 0px 84px; background-color:#EFF3F7;"><div class="inner_text_write">';
					            			 a += '<div class="box_textarea"><textarea wrap="hard" name="Udoc_content'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
					            			 a += '<div class="wrap_menu"><div class="area_r"><button id="secretcheck'+value.doc_cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
					            			 a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="commentUpdate('+value.doc_cno+')">등록</button></div>';
					            			 a += '</div></div></div></div></div></div></li>';
					            		}
					            	}
					            	else{
					            	
						            	if(value.doc_lev !=0){//댓글일시
						            		 a += '<div class="replyspace" style="border-bottom:1px solid #eee; padding:0px 45px 0px 84px; background-color:#EFF3F7;">';
									         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '</strong>';
									         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a></span></div>';
							
									         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									         
									         a += '</div></div>';
							            }	
						            	else{
						            		 a += '<div class="commentArea" style="border-bottom:1px solid #eee; padding:0px 45px 0px 39px; background-color:#EFF3F7;">';
									         a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>';
									         a += '<span class="btn_box"><a href="#" onclick="commentUpdateForm('+value.doc_cno+',\''+value.doc_content+'\');">수정</a>';
									         a += '<a href="#" onclick="replyDelete('+value.doc_cno+',\''+value.doc_lev+'\');">&nbsp;&nbsp;삭제</a>';
									         a += '<a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>'; 
									         a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									         
									         a += '</div></div>';
						            	}
					            	}
					            }
					            else if(email!=value.doc_email && email!='null'){//작성자가 아닐시
					            	if(value.doc_secret == 0){ //비밀글이 아닐시
						            	if(value.doc_lev !=0){
								            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong></div>';	      
								            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
								           
								            a += '</div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>';
									        a += '<a class="link_write" href="#" onclick="warning('+value.doc_cno+','+doc_no+',\''+value.doc_nick+'\',\''+value.doc_content+'\');">신고</a>';
									        a += '<span class="box_btn"><a href="#" onclick="reply_reTextarea('+value.doc_cno+');">&nbsp;&nbsp;답글</a></span></div>'
									        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									       
									        a += '</div></div>';
						            	}
					            	}
					            	else{
				            		//비밀글이 맞을시
					            		if(value.doc_lev !=0){
								            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong></div>';	      
								            a += '<div class="commentContent' +value.doc_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
								            
								            a += '</div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>';
									        a += '</div>';
									        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
									       
									        a += '</div></div>';
						            	}
					            	}
					            }
					            else{//비로그인일시
					            	if(value.doc_secret == 0){ //비밀글이 아닐시
						            	if(value.doc_lev !=0){
								            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick + '&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong></div>';	      
								            a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
								            
								            a += '</div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +	'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+	'</strong>';
									        a += '<div class="commentContent' +value.doc_cno+'"> <p> '+value.doc_content +'</p>';
									       
									        a += '</div></div>';
						            	}
					            		
					            	}
					            	else{
				            		//비밀글이 맞을시
					            		if(value.doc_lev !=0){
								            a += '<div style="border-bottom:1px solid #eee; margin:0px 0px 15px 39px;">';
								            a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong></div>';	      
								            a += '<div class="commentContent' +value.doc_cno+'"> <p> 해당 댓글은 작성자와 운영자만 볼 수 있습니다 </p>';
								            
								            a += '</div></div>';
							            }
						            	else{
						            		a += '<div class="commentArea" style="border-bottom:1px solid #eee; margin-bottom:15px;">';
									        a += '<div class="commentInfo' +value.doc_cno+'"><strong>'  +value.doc_nick +'&nbsp;&nbsp;&nbsp; '+ getFormatDate(date)+'</strong>';
									        a += '</div>';
									        a += '<div class="commentContent' +value.doc_cno+'"> <p>해당 댓글은 작성자와 운영자만 볼 수 있습니다</p>';
									       
									        a += '</div></div>';
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
			var updateContent = $('[name=Udoc_content'+cno+']').val();
			$.ajax({
				
				url : 'comment_update.bo',
				//type : 'post',
				dataType : 'json',
				data : {'doc_content':updateContent, 'doc_cno':cno},
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
				data : {'doc_cno':cno,'doc_lev':lev,'doc_no':doc_no},
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