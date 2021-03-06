<%@page import="dao.MbtiDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
/* 공통--- */
    body {
        margin: 0;
        padding: 0;
        background-image: url('/resources/backgorund_01.jpg');
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
    
    
    #container {
    	margin: 150px auto 0 auto;
    	padding: 10px 0 40px 0;
    	width: 400px;
    	border-radius: 20px;
    	background: white;
    }
    form {
    	margin: auto;
    	width: 200px;
    	text-align: center;
    	font-weight: bold;
    }
    form > div {
    	width: 100%;
    	text-align: left;
    }
    form button {
	padding: 10px 15px;
	border-radius: 20px;
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
	
<%
	MbtiDao dao = new MbtiDao();
	
	String s = (String)session.getAttribute("loginOK");
	ArrayList<String> user = dao.getMember(s);
%>
	<div class="wrapper">
	    <div id="container">
	        <form action="/update" method="post">
	            <h1>마이페이지</h1>
	
	            <div>
	            	<!-- 아이디, 비밀번호는 바꿀 수 없게 기획했기 때문에 입력 불가능한 disabled 속성을 넣어주고 자신의 아이디, 비밀번호 확인만 할 수 있게 함. -->
	            	<div>
	                    <small>아이디</small><br>
	                    <input type="text" value="<%= user.get(0) %>" disabled="disabled">
	                </div>
	                <div>
	                    <small>비밀번호</small><br>
	                    <input type="text" value="<%= user.get(1) %>" disabled="disabled">
	                </div>
	                <!-- 현재 이름, 엠비티아이 값을 기본으로 넣어서 확인 가능하게 함. -->
	                <div>
	                    <small>이름</small><br>
	                    <input type="text" name="name" id="name" value="<%= user.get(2) %>">
	                </div>
	                <div style="margin-top: 20px;">
	                    <small>엠비티아이</small><br>
	                    <select name="mbti" id="mbti" style="width: 177px;" value="<%= user.get(3) %>">
	                    	<option value="<%= user.get(3) %>"><%= user.get(3) %></option>
	                    
		                    <option value="INTJ">INTJ</option>
		                    <option value="INTP">INTP</option>
		                    <option value="ENTJ">ENTJ</option>
		                    <option value="ENTP">ENTP</option>
		    
		                    <option value="INFJ">INFJ</option>
		                    <option value="INFP">INFP</option>
		                    <option value="ENFJ">ENFJ</option>
		                    <option value="ENFP">ENFP</option>
		    
		                    <option value="ISTJ">ISTJ</option>
		                    <option value="ISFJ">ISFJ</option>
		                    <option value="ESTJ">ESTJ</option>
		                    <option value="ESFJ">ESFJ</option>
		    
		                    <option value="ISTP">ISTP</option>
		                    <option value="ISFP">ISFP</option>
		                    <option value="ESTP">ESTP</option>
		                    <option value="ESFP">ESFP</option>
		                </select>
	                </div>
	                
	            </div>
	            <br><br>
	
	            <button type="submit">수정하기</button>
	        </form>
	    </div>
	</div>
	
	
	<footer>
        Copyright 2022. YYDH Software 2-2. All rights reserved.
    </footer>
</body>
</html>
