<%@page import="java.util.ArrayList"%>
<%@page import="dao.MbtiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>궁합보기</title>
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
    
  
  	/*로딩중 요정 화면*/
  	#loading {
   		margin: 100px auto 0 auto;
		width: 502px;
		text-align: center;    	
   }
   #loading h2 {
   		margin-top: -50px;
   		font-size: 35px;
   		text-shadow: 2px 2px 15px hotpink;
   		color: rgb(255, 251, 211);
   }
   #loading span > img {
   		width: 80px;
   		height: 80px;
   }
   
   /*결과 화면*/
    #wrapper {
    	margin: 150px auto 0 auto;
    	width: 1700px;
    	display: flex;
    	justify-content: space-between;
    }
    .box {
        width: 800px;
        display: flex;
        justify-content: space-between;
        position: relative;
    }
    .heart {
        font-size: 60px;
        position: absolute;
        top: 35%;
        left: 45%;
        color: rgb(255, 0, 34);
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
<%	
	MbtiDao dao = new MbtiDao();
	// 로그인한 사용자의 정보 가져와서
	ArrayList<String> user = dao.getMember((String)session.getAttribute("loginOK"));
	// 그 엠비티아이에 맞는 엠비티아이들 목록을 꺼내옴
	ArrayList<String> result = dao.getChemiList(user.get(3));
	
%>

	<div id="loading">
        <div>
            <img src="/resources/fairy.png">
        </div>
        <h2>당신의 천생연분은 어떤 유형?</h2>
        <span><img src="/resources/loading.gif"></span>
    </div>

	<div id="wrapper">
		<div class="box">
	        <div>
	            <img src="/resources/<%= user.get(3) %>.png">
	        </div>
	        <div>
	            <img src="/resources/<%= result.get(0) %>.png">
	        </div>
	        <div class="heart">♥</div>
	    </div>
	    
	    <div class="box">
	        <div>
	            <img src="/resources/<%= user.get(3) %>.png">
	        </div>
	        <div>
	            <img src="/resources/<%= result.get(1) %>.png">
	        </div>
	        <div class="heart">♥</div>
	    </div>
	</div>
    
    
    <footer>
        Copyright 2022. YYDH Software 2-2. All rights reserved.
    </footer>
    
<%
	// ● 수업 내 활용하지 않은 기능 ● 
	// 페이지가 로딩되자마자 #loading을 3초 동안 보이게 해서 로딩중 화면같은 효과를 주는 자바스크립트 코드. 3초가 지나면 원래의 컨텐츠가 보임. 
	// 자바스크립트 setTimeout() 매소드 이용.
	out.print("<script> window.addEventListener('load', () => {document.querySelector('#wrapper').style.display = 'none';document.querySelector('#loading').style.display = 'block';setTimeout(() => {document.querySelector('#wrapper').style.display = 'flex';document.querySelector('#loading').style.display = 'none';	}, 3500);});</script>");
%>
</body>
</html>