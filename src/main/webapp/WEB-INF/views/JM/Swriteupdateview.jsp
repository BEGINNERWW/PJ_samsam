<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.samsam.board.adopt_homeVO"%>


<%
adopt_homeVO vo = (adopt_homeVO) request.getAttribute("vo");
String email = (String) session.getAttribute("email");
%>
<html>
<head>


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<style>
body::-webkit-scrollbar { 
    display: none; 
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
   font-size: 20px;
   margin-top: 16px;
   line-height: 16px;
}

.agreement {
   margin: 10px auto;
}

.option {
   margin-right: 7px;
}

.wrap-info {
   margin-top: 10px;
   margin-bottom: 35px;
}

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

.search-box.btn1 {
  color : #9494b8;
  text-align : left; 
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
select,button, textarea {
    display: inline-block;
    font-family: "Malgun Gothic", 'MalgunGothic', '맑은고딕', sans-serif;
    font-size: 12px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.article-content{
   margin-bottom:60px;
}

.textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
   border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}
.content-form{
   padding-top:10px;
   padding-bottom:10px;

}
.option_box{
   margin-top:20px;
   margin-bottom:20px;
   padding: 15px 48px 20px 35px;
    border: 1px solid #ebecef;
}
.option1{
   display:inline-block;
   padding-bottom:10px;
   margin-right:24px;
}


</style>

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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>


<!-- include libraries(jQuery, bootstrap) -->
<script>
    $('.search-box btn').click(function(){
      
    });
    $('#keyword').keypress(function(event){
      if(event.which == 13){
        $('.search-box btn').click();
        return false;
      }
    });
</script>
<script>

$(document).ready(function() {
   //여기 아래 부분

   $('#summernote').summernote({
       toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
          ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        height: 600,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",               // 한글 설정
        placeholder: '사진을 등록해주세요. 처음 등록되는 사진이 썸네일 사진으로 지정됩니다.',   //placeholder 설정
          callbacks: {
               onImageUpload: function(files, editor, welEditable) {
                     for (var i = files.length - 1; i >= 0; i--) {
                        sendFile(files[i], this);
                     }
                 }
            }
          
   });
   $("div.note-editable").on('drop',function(e){
	    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
	    	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
	    }
	   e.preventDefault();
	})

   function sendFile(file, el) {
       var form_data = new FormData();
       form_data.append('file', file);
   
       $.ajax({
         data: form_data,
         type: "post",
         url: 'image.bo',
         cache: false,
         contentType: false,
         enctype: 'multipart/form-data',
         processData: false,
         success: function(url) {
               $(el).summernote('editor.insertImage', url);
         }
       });
     }
   
   $("input:radio[name=doc_big]").click(function(){
        $('#kind1').empty();
        $('#kind2').empty();
        $('#kind3').empty();
        if($("input[name='doc_big']:checked").val() =="강아지"){
           var output ='';
           output += '<div class="option1">';
           output += '<div><select class= "form-control" style="width:250px;" size="1" id="doc_doc_kindof" name="doc_kindof">';
           output += '<option value="hide">선택하세요</option>';
           output += '<option value="포메라니안">포메라니안</option>';
           output += '<option value="치와와">치와와</option>';
           output += '<option value="미니어처 핀셔(미니핀)">미니어처 핀셔(미니핀)</option>';
           output += '<option value="파피용">파피용</option>';
           output += '<option value="토이 푸들">토이 푸들</option>';
           output += '<option value="미니어쳐 닥스훈트">미니어처 닥스훈트</option>';
           output += '<option value="요크셔테리어">요크셔테리어</option>';
           output += '<option value="말티즈">말티즈</option>';
           output += '<option value="비숑 프리제">비숑 프리제</option>';
           output += '<option value="미니어쳐 슈나우저">미니어쳐 슈나우저</option>';
           output += '<option value="페키니즈">페키니즈</option>';
           output += '<option value="꼬똥 드 툴레아">꼬똥 드 툴레아</option>';
           output += '<option value="퍼그">퍼그</option>';
           output += '<option value="웰시 코기">웰시 코기</option>';
           output += '<option value="프렌치 불독">프렌치 불독</option>';
           output += '<option value="비글">비글</option>';
           output += '<option value="코카 스파니엘">코카 스파니엘</option>';
           output += '<option value="보스턴 테리어">보스턴 테리어</option>';
           output += '<option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option>';
           output += '<option value="이탈리안 그레이하운드">이탈리안 그레이하운드</option>';
           output += '<option value="스코티시 테리어">스코티시 테리어</option>';
           output += '<option value="베들링턴 테리어">베들링턴 테리어</option>';
           output += '<option value="시바이누">시바이누</option>';
           output += '<option value="불테리어">불테리어</option>';
           output += '<option value="보더콜리">보더콜리</option>';
           output += '<option value="시추">시추</option>';
           
           output += '</select></div></div>';
           $('#kind1').append(output);
        }
        else if($("input[name='doc_big']:checked").val() =="고양이"){
           var output ='';
           output += '<div class="option1">';
           output += '<div><select class="form-control" style="width:250px;" size="1" id="doc_kindof" name="doc_kindof">';
           output += '<option value="hide">선택하세요</option>';
           output += '<option value="노르웨이 숲 고양이">노르웨이 숲 고양이</option>';
           output += '<option value="데본렉스">데본렉스</option>';
           output += '<option value="라가머핀">라가머핀</option>';
           output += '<option value="라팜">라팜</option>';
           output += '<option value="렉돌">렉돌</option>';
           output += '<option value="러시안블루">러시안블루</option>';
           output += '<option value="맹크스 고양이">맹크스 고양이</option>';
           output += '<option value="메인쿤">메인쿤</option>';
           output += '<option value="발리네즈 고양이">발리네즈 고양이</option>';
           output += '<option value="버만">버만</option>';
           output += '<option value="버미즈">버미즈</option>';
           output += '<option value="봄베이">봄베이</option>';
           output += '<option value="브리티쉬 숏 헤어">브리티쉬 숏 헤어</option>';
           output += '<option value="샤트룩스">샤트룩스</option>';
           output += '<option value="샴">샴</option>';
           output += '<option value="셀커크 렉스">셀커크 렉스</option>';
           output += '<option value="소말리">소말리</option>';
           output += '<option value="스코티쉬 폴드">스코티쉬 폴드</option>';
           output += '<option value="스핑크스">스핑크스</option>';
           output += '<option value="시베리아">시베리아</option>';
           output += '<option value="싱가퓨라">싱가퓨라</option>';
           output += '<option value="아메리칸 밥테일">아메리칸 밥테일</option>';
           output += '<option value="아메리칸 숏헤어">아메리칸 숏헤어</option>';
           output += '<option value="아메리칸 와이어헤어">아메리칸 와이어헤어</option>';
           output += '<option value="아메리칸 컬">아메리칸 컬</option>';
           output += '<option value="아비니시안">아비니시안</option>';
           output += '<option value="오시캣">오시캣</option>';
           output += '<option value="유러피안 버미즈">유러피안 버미즈</option>';
           output += '<option value="이그저틱">이그저틱</option>';
           output += '<option value="이집션 마우">이집션 마우</option>';
           output += '<option value="재패니즈밥테일">재패니즈밥테일</option>';
           output += '<option value="컬러포인트쇼트헤어">컬러포인트쇼트헤어</option>';
           output += '<option value="코니시 렉스">코니시 렉스</option>';
           output += '<option value="코랫">코랫</option>';
           output += '<option value="터키시 반">터키시 반</option>';
           output += '<option value="터키쉬 앙고라">터키쉬 앙고라</option>';
           output += '<option value="통키니즈">통키니즈</option>';
           output += '<option value="페르시안">페르시안</option>';
           output += '<option value="하바나 브라운">하바나 브라운</option>';
           output += '<option value="자바니즈">자바니즈</option>';
           
           
           output += '</select></div></div>';
           $('#kind2').append(output);
        }
        else{
           var output = '';
           output += '<div class="option1"><input class="form-control" style="width:300px;" type="text" name="doc_kindof" placeholder="직접 입력해주세요"></div>'
            $('#kind3').append(output);
        }
     });
   //이용약관 동의 체크
   $("#home_agree").change(function(){
      $(this).prop('checked')?$('#home_submit').removeAttr('disabled'):$('#home_submit').attr('disabled','disabled');
      
   });
   
});
function setThumbnail(event) {
   
   var reader = new FileReader();
   reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
      };
      reader.readAsDataURL(event.target.files[0]); 
      }



function submit_check(){
	   

	   
	   
	   var subject = $('#doc_subject').val();
	   if(subject==''){
	      alert("제목을 입력해주세요");
	      return false;
	   }
	   if($("input:radio[name='doc_big']").is(":checked") == false){
	      alert("종류를 입력해주세요");
	      return false;
	   }
	   var kindof =  $("select[name=doc_kindof]").val();


	   if(kindof=='' ){
	      alert("품종을 입력해주세요");
	      return false;
	   }

	   var price = $('#doc_price').val();
	   if(price==''){
	      alert('분양비를 입력해주세요');
	      return false;
	   }

	   var content = $('#summernote').val();
	   var img_check = "img";
	   if(content.indexOf(img_check) == -1){
	      alert("이미지를 넣어주세요");
	      return false;
	   }
	   
	   return true;
	}
 

</script>

<body>

   <div class="body_content">

      <header id="header">

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
      <img src = "./resources/img/mainlogo.png" class = "img-circle">
      </a>
      </div>
   </div>
    <form action="home_search.me" method="post" name="doc_search">
            <div class="search-wrapper">
               <input class="search-box input"  id="keyword" name="keyword" type="text" placeholder="Search">
               <button class="search-box btn" type="submit">
                  <i class="fas fa-search"></i>
               </button>
            </div>
      </form>
         </div>
         <!-- nav-menu -->
      </header>

<div class="main-content">
      <div class="content-wrap">

         <!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
         <div class="sidemenu-section" id="left">
            <ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="home_list.bo">가정분양</a></li>
				<li class="list-group-item "><a href="fdoclist.bo">책임분양</a></li>
				<li class="list-group-item click"><a href="selladopt_list.bo">업체분양</a></li>
            </ul>
         </div>

         <!-- 오른쪽. 내용이 들어갈 부분 -->

         <div class="content-section" id="right">
            <!-- 수정시작 -->
            <div class="content-form">
      
       
   <form method="post" action="Sellhome_update.bo" enctype="multipart/form-data" onsubmit="return submit_check();">
	<input type="hidden" name="doc_no" value=<%=vo.getDoc_no() %>>
      <div><div><textarea name="doc_subject" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;"><%=vo.getDoc_subject() %></textarea></div></div>
     <div class="option_box">
     
       <div class="option1"><div style="display:inline-block;margin-right:10px;"><input type="radio" name="doc_big" value="강아지">&nbsp;&nbsp;강아지&nbsp;&nbsp;&nbsp;&nbsp;<span id="kind1"></span></div>
         <div style="display:inline-block;margin-right:10px;"><input type="radio" name="doc_big" value="고양이">&nbsp;&nbsp;고양이&nbsp;&nbsp;&nbsp;&nbsp;<span id="kind2"></span></div>
         <div style="display:inline-block;margin-right:10px;"><input type="radio" name="doc_big" value="기타">&nbsp;&nbsp;기타&nbsp;&nbsp;&nbsp;&nbsp;<span id="kind3"></span></div></div>
         
        
    <div>
   <div class="option1">분양비&nbsp;:&nbsp;&nbsp;&nbsp;<input class="form-control" style="width:200px; display:inline-block;" type="text" name="doc_price" placeholder="분양비를 입력해주세요" value=<%=vo.getDoc_price()%>></div> 
   <div class="option1">지&nbsp;&nbsp;역&nbsp;:&nbsp;&nbsp;&nbsp;<select class="form-control" style="width:200px; display:inline-block;" size="1" id="doc_loc" name="doc_loc">
            
            <option value="서울">서울</option>
            <option value="부산">부산</option>
            <option value="대구">대구</option>
            <option value="인천">인천</option>
            <option value="광주">광주</option>
            <option value="대전">대전</option>
            <option value="울산">울산</option>
            <option value="세종">세종</option>
            <option value="경기">경기</option>
            <option value="강원">강원</option>
            <option value="충북">충북</option>
            <option value="충남">충남</option>
            <option value="전북">전북</option>
            <option value="전남">전남</option>
            <option value="경북">경북</option>
            <option value="경남">경남</option>
            <option value="제주">제주</option>
   </select></div>
   
   </div></div>
   <!--  
   <tr><td>썸네일용 이미지를 업로드해주세요</td></tr>
   <tr><td><input type="file" name="home_Image" onchange="setThumbnail(event);"></td></tr>
   <tr><td><div id="image_container"></div></td></tr>     
     -->
      <div><div style="margin-top:20px;margin-bottom:20px;"> 
     
      <textarea id="summernote" name="doc_content"><%=vo.getDoc_content() %></textarea>
      </div>
      <div style="margin-bottom:20px;">

      
      </div>
      <div><input class="btn_g full_type1" type="submit" id="homeupdate_submit" value="수정" style="float: right;"><input class="btn_g full_type1" type="button" value="뒤로" onclick="javascript:history.go(-1)" style="float:right; margin-right:10px;"></div></div>
      
      
   </form>
   


      
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
</script>


</body>

<style>
	.note-editor.note-frame {
    border: 1px solid #ebecef;
}
</style>
