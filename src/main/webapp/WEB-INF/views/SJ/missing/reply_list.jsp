<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%
	String id = (String) session.getAttribute("nick");
	String email = (String) session.getAttribute("email");
	String table = "missing_reply";
	String doc_table = "missing_doc";
%>

<style>
	.reply_nick { font-size: larger; }
	.reply_date { color: gray; margin-left: 20px; }
	.reply_content { padding-left: 20px; margin-top: 5px; margin-bottom: 10px; }

</style>

<input type="hidden" value="${doc_no}" id="doc_no" />
<c:forEach var="reply" items="${reply}" varStatus="status">
	<c:if test="${reply.doc_ref == -1 }">
		<li class="doc-comment">
			<div>
				<span class="reply_nick">
					${reply.doc_nick}
				</span>
				<span class="reply_date">
					${reply.doc_date_fmt}
				</span>
			
			</div>
			<div>
				<p class="reply_content">
					${reply.doc_content}
				</p>
				<textarea class="doc_content" name="doc_content" style="display: none;">${reply.doc_content}</textarea>
			</div>
			
			<div class="btn-area" style="text-align: right">
				<c:if test="${email == reply.doc_email }">	
					<span style="cursor: pointer;" onclick="warning_ori('${reply.doc_cno}','${reply.doc_no }','${reply.doc_nick }','${reply.doc_content }');return false;">신고</span>
				</c:if>
				<fmt:formatDate var="formatDate" value="${reply.doc_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				<c:if test="${email != null }">
					<span style="cursor: pointer;" class="btnReReplyEditShow" onclick="commentRefly('${reply.doc_cno}', '${reply.doc_content }', '${reply.doc_nick }', '${formatDate}')">답글</span>
					<span style="cursor: pointer; display: none;" class="btnReReplyEditHide">답글닫기</span>
					<c:if test="${email == reply.doc_email }">	
						<span style="cursor: pointer;" class="btnReplyModify">수정</span>
						<span style="cursor: pointer;" class="btnReplyRemove" data="${reply.doc_cno}">삭제</span>
					</c:if>
				</c:if>
			</div>
			<c:if test="${email != null }">
				<c:if test="${email == reply.doc_email }">
					<div class="btn-area-edit" style="text-align: right; display: none;">
						<span style="cursor: pointer;" class="btnReplyCancel" >취소</span>
						<span style="cursor: pointer;" class="btnReplyConfirm" data="${reply.doc_cno}">등록</span>
					</div>
				</c:if>
			</c:if>
			<!-- 대댓글출력 -->
			<c:forEach var="rereply" items="${reply.rereList}" varStatus="status">
				<li class="doc-comment" style="padding: 0 80px;">
					<div>
						<span class="reply_nick">
							${rereply.doc_nick}
						</span>
						<span class="reply_date">
							${rereply.doc_date_fmt}
						</span>
					
					</div>
					<div>
						<p class="reply_content">
							${rereply.doc_content}
						</p>
						<textarea class="doc_content" name="doc_content" style="display: none;">${rereply.doc_content}</textarea>
					</div>
			
					<div class="btn-area" style="text-align: right">
						<c:if test="${email == rereply.doc_email }">	
							<span style="cursor: pointer;" onclick="warning_ori('${rereply.doc_cno}','${rereply.doc_no }','${rereply.doc_nick }','${rereply.doc_content }'); return false;">신고</span>
						</c:if>
						<c:if test="${email != null }">
							<c:if test="${email == rereply.doc_email }">	
								<span style="cursor: pointer;" class="btnReplyModify">수정</span>
								<span style="cursor: pointer;" class="btnReplyRemove" data="${rereply.doc_cno}">삭제</span>
							</c:if>
						</c:if>
					</div>
					<c:if test="${email != null }">
						<c:if test="${email == rereply.doc_email }">
							<div class="btn-area-edit" style="text-align: right; display: none;">
								<span style="cursor: pointer;" class="btnReplyCancel" >취소</span>
								<span style="cursor: pointer;" class="btnReplyConfirm" data="${rereply.doc_cno}">등록</span>
							</div>
						</c:if>
					</c:if>
				</li>
			</c:forEach>
			<div class="text_write_g comment_write" style="display:none;">
				<div class="inner_text_write">
					<div class="box_textarea">
						<textarea wrap="hard" id="content_${reply.doc_cno}" name="content_1" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea>
					</div>
					<div class="wrap_menu">
						<div class="area_r">
							<button id="secretcheck1" class="btn_g_ico btn_item secret_button" data-is-hidden="true">
								<span class="ico_bbs ico_lock_state">비밀글</span>
							</button>
							<div class="btn_group">
								<button class="btn_g full_type1 confirm_button" onclick="rereplyInsert(${reply.doc_cno})">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
	</c:if>
</c:forEach>



<script>
	$(document).ready(function() {
		// 댓글 삭제 버튼 클릭 이벤트
		$('.btnReplyRemove').on('click',function() {
			var doc_cno = $(this).attr('data');
			
			commentRemove(doc_cno);
			
		}); 
		// 댓글 수정 버튼 클릭 이벤트
		$('.btnReplyModify').on('click',function() {
			/* var doc_cno = $(this).attr('data');
			commentModify(doc_cno); */
			var item = $(this).parents('li.doc-comment');
			item.find('p.reply_content').hide();
			var text = item.find('p.reply_content').text().trim();
			item.find('textarea.doc_content').val(text);
			item.find('textarea.doc_content').show();
			item.find('.btn-area').hide();
			item.find('.btn-area-edit').show();
		}); 

		// 댓글 수정 취소 버튼 클릭 이벤트
		$('.btnReplyCancel').on('click',function() {
			var item = $(this).parents('li.doc-comment');
			item.find('p.reply_content').show();
			item.find('textarea.doc_content').hide();
			item.find('.btn-area').show();
			item.find('.btn-area-edit').hide();
		});
		
		// 댓글 수정 확인 버튼 클릭 이벤트
		$('.btnReplyConfirm').on('click',function() {
			var doc_cno = $(this).attr('data');
			var item = $(this).parents('li.doc-comment');
			item.find('p.reply_content').show();
			item.find('textarea.doc_content').hide();
			item.find('.btn-area').show();
			item.find('.btn-area-edit').hide();
			var textVal = item.find('textarea.doc_content').val();

			commentModify(doc_cno, textVal, item);
		});
		// 대댓글 기능 보여주기 버튼
		/* $('.btnReReplyEditShow').on('click',function() {
			var item = $(this).parents('li.doc-comment');
			item.find('.doc_content').show();
			item.find('.reply_content').hide();
			$(this).hide();
			item.find('.btnReReplyEditHide').show();
		}); */
		// 대댓글 기능 닫기 버튼
		$('.btnReReplyEditHide').on('click',function() {
			var item = $(this).parents('li.doc-comment');
			item.find('.doc_content').hide();
			item.find('.reply_content').show();
			$(this).hide();
			item.find('.btnReReplyEditShow').show();
		})	
	});
	
	
	// 댓글 수정
	function commentModify(doc_cno, textVal, item) {
		var doc_no = $("#doc_no").val();
		
		$.ajax({
		    url:'comment_modify', //request 보낼 서버의 경로
		    type : 'get',
    		data :  {	
    					'doc_no' : doc_no,
    					'doc_cno' : doc_cno,
    					"doc_content" : textVal
    				},
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		        if (data == '00') {
			        item.find('p.reply_content').text(textVal);
			        item.find('textarea.doc_content').val(textVal);
		        } else {
		        	alert("처리가 진행되지 않았습니다.");
		        }
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
	}
	
	// 댓글 삭제
	function commentRemove(doc_cno) {
		var doc_no = $("#doc_no").val();
		
		$.ajax({
		    url:'comment_remove', //request 보낼 서버의 경로
		    type : 'get',
    		data :  {	
    					'doc_no' : doc_no,
    					'doc_cno' : doc_cno
    				},
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		        $('.list_comment').empty();
		        $('.list_comment').append(data);
		        commentList();
		        
		        
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
		
	}
	//대댓글 기능 ,,,
	function rereplyInsert(doc_cno){
		var doc_content = $("#content_"+doc_cno).val();
		
		var doc_no = "${doc_no}";
		// 나중에 세션 정보로 변경할 것
		var doc_email = "tt@naver.com"; //"<%=email%>";
		var doc_nick = "댕동";//"<%=id%>";
		
		
		
		$.ajax({
			url : 'recomment_insert',
			type : 'POST',
			data : {
				'doc_no' : doc_no,
				'doc_content' : doc_content , 
				'doc_email' : doc_email , 
				'doc_nick' : doc_nick , 
				'doc_secret' : doc_secret,
				'doc_ref': doc_cno
			},
			success: function(data) {
				if(data==1) {
					commentList();
					$("#content_1").val('');
				}
			}
				/* var a = '';
				$.each(data, function(key, value){
					var date = new Date(value.doc_date);
					
				
				}) */
		});
	}
	// 대댓글 삭제
	function rereplyRemove(doc_cno) {
		var doc_no = $("#doc_no").val();
		
		$.ajax({
		    url:'comment_remove', //request 보낼 서버의 경로
		    type : 'get',
    		data :  {	
    					'doc_no' : doc_no,
    					'doc_cno' : doc_cno
    				},
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
		        $('.list_comment').empty();
		        $('.list_comment').append(data);
		        commentList();
		        
		        
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
	}

    function commentRefly(cno,content,cnick,cdate){
    	var doc_no ='${doc_no}';
    	var id = '<%=id%>'
    	var writer = '${email}';
		var a = '';

		a += '<li style="background-color:#F8F8F8;" id="refly'+cno+'"><div class="comment_section"><div class="comment_info">';
			a += '<div class="comment_post"><div class="profile_info"><div class="opt_more_g"><b>'+cnick+'</b></div>';
			a += '<span class="txt_date">&nbsp;&nbsp;&nbsp;'+cdate+'</span></div>';
			a += '<div class="box_post"><p class="desc_info"><span class="original_comment">'+content+'</span></p></div>';
			a += '<div class="comment_more">';
			a += '<a class="link_write" href="#" onclick="commentList();">답글접기</a>';
			a += '</div></div>';
			a += '<div class="text_write_g comment_write"><div class="inner_text_write">';
			a += '<div class="box_textarea"><textarea wrap="hard" name="content_'+cno+'" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600" style="height:86px;"></textarea></div>';
			a += '<div class="wrap_menu"><div class="area_r"><button  id="secretcheck'+cno+'" class="btn_g_ico btn_item secret_button" data-is-hidden="true"><span class="ico_bbs ico_lock_state">비밀글</span></button>';
			a += '<div class="btn_group"><button class="btn_g full_type1 confirm_button" onclick="reflyInsert('+cno+')">등록</button></div>';
			a += '</div></div></div></div></div></div></li>';

		$(".list_comment").html(a);
    	
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

    	var doc_no ='${doc_no}';
    	
    	
    	$.ajax({
    		url: '/SJ/missing/comment_refly.bo',
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
    
</script>