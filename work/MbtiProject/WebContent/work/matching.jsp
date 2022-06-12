<%@page import="java.util.ArrayList"%>
<%@page import="dao.MbtiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭하기</title>
<style>
   /* 공통--- */
   body {
       margin: 0;
       padding: 0;
       background-color: rgb(255, 233, 243); 
   }
   
   .wrapper {
       margin: auto;
       width: 1000px;
   }

   footer {
       position: absolute;
       bottom: 20px;
       left: 40%;
       text-align: center;
       color: gray;
   }

   .text-right {
       text-align: right;
   }
   
   h1 {
       font-size: 40px;
   }
   
   /* 헤더 */
   header {
       padding: 20px 0;
       width: 100%;
       background: white;
   }
   nav {
       padding: 0 35px;
       display: flex;
       justify-content: space-between;
   }
   nav > ul {
       margin: 0;
       padding: 0;
       list-style: none;
       display: flex;
   }
   nav > ul > li {
       margin-left: 2rem;
       font-size: 20px;
       font-weight: bold;
   }
   nav a:link {
       color: black;
       font-size: 16px;
       font-weight: bold;
       text-shadow: 2px 2px 5px hotpink;
       text-decoration: none;
   }
   nav a:visited {
       color: black;
       font-size: 16px;
       font-weight: bold;
       text-shadow: 2px 2px 5px hotpink;
       text-decoration: none;
   }
   nav a:hover {
       color: violet;
       font-size: 16px;
       font-weight: bold;
       text-shadow: 2px 2px 5px hotpink;
       text-decoration: none;
   }
   #logo {
       font-size: 25px;
       font-weight: bold;
   }
   /* ------ */
   
   
   
   /*회원목록*/
   #box {
       margin: 100px auto 0 auto;
       width: 800px;
       display: grid;
       grid-template-columns: 1fr 1fr 1fr 1fr;
       gap: 2rem;
   }

   .item {
       width: 180px;
       height: 220px;
       border-radius: 20px;
       overflow: hidden;
       background-color: white;
       box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
   }

   .item_img {
       width: 100%;
       height: 120px;
       background-image: url("/resources/backgorund_01.jpg");
   }
   .item_img > img {
       width: 100%;
       height: 100%;
       object-fit: contain;
   }

   .item_txt {
       padding: 0.5rem 1rem;
   }

   .item_txt > span {
       display: block;
   }

   .item_txt > span:nth-child(1) {
       font-size: 22px;
   }
   
   
    h2 {
    	margin-top: 50px;
   		font-size: 35px;
   		text-align: center;
   		text-shadow: 2px 2px 15px hotpink;
   		color: rgb(255, 251, 211);
   }
</style>
</head>
<body>
<%
	// 로그인 세션 상태 확인하고 접근권한 처리하는 로직
	if ((String)session.getAttribute("loginOK") == null) {
		out.print("<script>alert('로그인이 필요한 서비스입니다♥'); history.back();</script>");
		// ● 수업 내 활용하지 않은 기능 ●
		// JSP에서 아래 코드가 실행되지 않고 끝나도록 exit하는
		if( true ) return ;
	}
%>


	<header>
	    <nav>
	        <div id="logo">
	        	MBTIwithLove
	        </div>
	        <ul>
	            <li><a href="/work/chemistry.jsp">궁합보기</a></li>
	            <li><a href="/work/matching.jsp">매칭하기</a></li>
            <%
            	if ((String)session.getAttribute("loginOK") == null) {
            %>
            	<li><a href="/register/join.jsp">회원가입</a></li>
            	<li><a href="/register/login.jsp">로그인</a></li>
            <%	
            	} else {
            %>
	            <li><a href="/register/mypage.jsp">마이페이지</a></li>
	            <li><a href="/logout">로그아웃</a></li>
	        <%
            	}
	        %>
	            
	        </ul>
	    </nav>
	</header>
	

	<h2>당신과 잘 맞는 다른 회원</h2>
	
	<div id="box">
	
<%  
	MbtiDao dao = new MbtiDao();
	// 세션에 로그인한 사용자 아이디를 이용해 그 사용자의 엠비티아이를 가져와서	
	ArrayList<String> user = dao.getMember((String)session.getAttribute("loginOK"));
	// 유저 테이블에서 궁합 좋은 엠비티아이를 가진 다른 회원 리스트 꺼내옴
	ArrayList<String> result = dao.getMatchingList(user.get(3));
	
	// 반복문을 리스트 길이만큼 도는데, 
	// 회원의 한개한개정보들을 주르륵 배열로 응답받았기 때문에 한번에 i를 3번 증가해서 한 회원의 정보를 한번에 처리하도록 함.
	// id, name, mbti 세 개가 반복되는 형태의 배열
	for(int i = 0; i < result.size(); i++) {
%>

		<div class="item">
            <div class="item_img">
                <img src="/resources/fairy.png">
            </div>
            <div class="item_txt">
                <span><%= result.get(i) %></span>
                <span><%= result.get(i+1) %></span>
                <span><%= result.get(i+2) %></span>
            </div>
        </div>
	
<%	
		i += 2;
	}
%>
        
	</div>

    <footer>
        Copyright 2022. YYDH Software 2-2. All rights reserved.
    </footer>
</body>
</html>