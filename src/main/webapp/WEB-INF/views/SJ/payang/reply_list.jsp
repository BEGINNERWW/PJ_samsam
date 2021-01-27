<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>

<%
	String email = (String) session.getAttribute("email");
%>

<style>
	.reply_nick { font-size: larger; }
	.reply_date { color: gray; margin-left: 20px; }
	.reply_content { padding-left: 20px; margin-top: 5px; margin-bottom: 10px; }

</style>

<input type="hidden" value="${doc_no}" id="doc_no" />
<c:forEach var="reply" items="${reply}" varStatus="status">
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

		<c:if test="${email != null }">
			<c:if test="${email == reply.doc_email }">
				<div class="btn-area" style="text-align: right">
					<span style="cursor: pointer;" class="btnReplyModify">${reply.btnModify}</span>
					<span style="cursor: pointer;" class="btnReplyRemove" data="${reply.doc_cno}">${reply.btnRemove}</span>
				</div>
				<div class="btn-area-edit" style="text-align: right; display: none;">
					<span style="cursor: pointer;" class="btnReplyCancel" >취소</span>
					<span style="cursor: pointer;" class="btnReplyConfirm" data="${reply.doc_cno}">등록</span>
				</div>
			</c:if>
		</c:if>
	</li>
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

</script>