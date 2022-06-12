<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MBTI는 사랑을 싣고</title>
<style>
    /* 공통--- */
    body {
        margin: 0;
        padding: 0;
        background-image: url('/resources/backgorund_01.jpg');
    }
    
    .wrapper {
        margin: auto;
        width: 900px;
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

    /* 소개글 */
    #intro {
        margin: 60px 0;
        text-align: center;
    }

    /* 배너 하나 */
    .banner {
        margin-bottom: 20px;
        padding: 70px 80px;
        border-radius: 20px;
        background-color: white;
    }
    .banner h2 {
    	margin-top: 0;
   	}
    
    .wrapper a:link {
	    color: black;
    	font-size: 16px;
    	font-weight: bold;
    	text-shadow: 0px 0px 10px hotpink;
    }
    .wrapper a:visited {
   	    color: black;
    	font-size: 16px;
    	font-weight: bold;
    	text-shadow: 2px 2px 10px hotpink;
    }
    .wrapper a:hover {
    	color: white;
    	font-size: 16px;
    	font-weight: bold;
    	text-shadow: 2px 2px 15px rgb(198, 9, 66);
    }
</style>
</head>
<body>
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
	
	<div class="wrapper">
        <div id="intro">
            <h1>MBTI는 사랑을 싣고</h1>
            <p>
                재미로 보는 엠비티아이 매칭! 자신과 맞는 인연을 찾아드립니다.
            </p>
            <a style="color: white" href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC">
                내 MBTI를 모른다면?
            </a>
        </div>
        
        <div class="banner">
            <div>
                <h2>천생연분 궁합을 알고 싶다면?</h2>
                <a href="work/chemistry.jsp">궁합보기</a>
            </div>
        </div>

        <div class="banner text-right">
            <div>
                <h2>나와 잘 맞을 다른 회원이 궁금하다면?</h2>
                <a href="work/matching.jsp">매칭하기</a>
            </div>
        </div>
    </div>

    <footer>
        Copyright 2022. YYDH Software 2-2. All rights reserved.
    </footer>
</body>
</html>