<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.project.samsam.community.DocVO" %>
<%
	List<DocVO> doclist = (List<DocVO>)request.getAttribute("doclist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	SimpleDateFormat date = new SimpleDateFormat("yy/MM/dd");
	DecimalFormat form = new DecimalFormat("###,###,###");
	DocVO searchVO = (DocVO)request.getAttribute("vo");
	
	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<style>

.contents {
    width: 736px;
    min-height: 800px;
}
.wrap-srch-home {
    position: relative;
    display:block;
    
}

.wrap-srch-home .inp-srch {
    display: block;
    width: 736px;
    height: 60px;
    padding: 0 10px 0 62px;
    border: 2px solid #222;
    border-radius: 30px;
    font-size: 18px;
    box-sizing: border-box;
}

header.add_gnb~.container .wrap-srch-home .btn-srch {
    top: 2px;
}
.wrap-srch-home .btn-srch {
    top: 2px;
    right: auto;
    left: 10px;
    width: 56px;
    height: 56px;
    color: #fff;
}
.wrap-srch-home .btn-srch {
    position: absolute;
    z-index: 1;
    top: -46px;
    right: 157px;
    width: 30px;
    height: 30px;
    text-indent: -9999px;
     overflow: visible;
    border: 0;
    background-color: transparent;
    cursor: pointer;

}
#search_button{

top: 2px;
    right: auto;
    left: 10px;
    width: 56px;
    height: 56px;
    color: #fff;
}

a, button {
    touch-action: manipulation;
}
.wrap-srch-home .btn-srch:before {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    display: block;
    width: 24px;
    height: 24px;
    background: url(./resources/images/free-icon-search-1250705.png) center no-repeat;
    content: "";
}

.home-list {
    display: flex;
    flex-wrap: wrap;
    border-top: 8px solid #f2f2f3;
}
.home-list .best-list {
    width: 100%;
    margin: 35px 0 0;
}
.best-icon{
    background: url(./resources/images/free-icon-best-1288710.png) center no-repeat;
	display: inline-block;
    width: 32px;
    height: 32px
}
.home-list .free-list {
    width: 100%;
    margin: 35px 0 0;
}
.free-icon{
    background: url(./resources/images/free-icon-dog-2064847.png) center no-repeat;
	display: inline-block;
    width: 32px;
    height: 32px
}
.comment_icon{
	 background: url(./resources/images/free-icon-speech-bubble-2462719.png) center no-repeat;

	 display: inline-block;
    width: 16px;
    height: 16px;
   
}
.recount_icon{
	background: url(./resources/images/free-icon-eye-660022.png) center no-repeat;

	 display: inline-block;
    width: 16px;
    height: 16px;
}
.detail-read{
	float:right;
	margin-right:135px;
}
.article:first-of-type {
    padding-top: 11px;
}
.article {
    display: flex;
    margin-top: 2px;
    padding: 0 120px 0 0;
}
.article {
    padding: 0;
    border-bottom: none;
}
.article_subject{
	display:inline-block;
	width:60%;
}
.article_writer{
	display:inline-block;
	width:10%
}
.article_no{
	color:#999;
	line-height:1.3;
	margin-bottom:0;
	width:5%;
}
a, a:active, a:focus, a:hover {
    text-decoration: none;
    color: #222;
}

</style>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script type="text/javascript">

</script>
</head>
<body>
<div class="content">
<div class="wrap-srch-home">
<input name="keyword" type="search" placeholder="관심있는 내용을 검색해보세요!" autocomplete="off" class="inp-srch">
<button id="search_button" type="button" class="btn-srch">검색</button>
</div>
<div class="home-list">
<div class="best-list">
<h2><span class="best-icon"></span>&nbsp;주간 베스트</h2>
<!--  주간베스트 반복문 시작 -->

</div>
<div class="free-list">
<h2><span class="free-icon"></span>&nbsp;자유 게시판</h2>
 <!--  
 <div class="article">

          <div class="article_no">제목</div>
          <div class="article_writer">글쓴이</div>
          <span class="date-read">작성일</span><span class="detail-read">&nbsp;&nbsp;&nbsp;&nbsp;</span>
          </div>
-->
   <%
      	int num = listcount - ((nowpage - 1) * 10);
      	for(int i=0; i<doclist.size();i++){
      		DocVO vo=(DocVO)doclist.get(i);
      	
          %>
          <div class="article">
          <div class="article_no">#<%=vo.getDoc_no() %></div>
          <div class="article_subject"><a href="./docdetail.bo?doc_no=<%=vo.getDoc_no()%>&page=<%=nowpage%>"><%=vo.getDoc_subject() %></a></div>
          <div class="article_writer"><%=vo.getDoc_nick() %></div>
          <span class="date-read"><%=date.format(vo.getDoc_date()) %></span><span class="detail-read">&nbsp;&nbsp;&nbsp;&nbsp;<span class="recount_icon"></span>&nbsp;<%=vo.getDoc_readcount() %>&nbsp;&nbsp;<span class="comment_icon"></span>&nbsp;<%=vo.getDoc_comment() %></span>
          </div>
          <%
        	num--;  
      	} %>
      	
</div>
</div>
<div class="write"><button type="button" onclick="location.href='./docform.bo'">글쓰기</button></div>
<div class="paging_box">
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

</div>

</body>
</html>