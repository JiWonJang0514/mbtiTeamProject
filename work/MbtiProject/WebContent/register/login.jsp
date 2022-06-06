<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    /* 공통--- */
    body {
        margin: 0;
        padding: 0;
        background-image: url('../resources/background.png');
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
    	background: #eba7c6;
    }
    form {
    	margin: auto;
    	width: 170px;
    	text-align: center;
    	font-weight: bold;
    	color: white;
    }
    form > div {
    	width: 100%;
    	text-align: left;
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
	            <li><a href="#">궁합보기</a></li>
	            <li><a href="#">매칭하기</a></li>
	            <li><a href="#">MYPAGE</a></li>
	            <li><a href="#">로그인</a></li>
	            <li><a href="#">회원가입</a></li>
	        </ul>
	    </nav>
	</header>
	
	<div class="wrapper">
	
	    <div id="container">
	        <form action="/login" method="get">
	            <h1>로그인</h1>
	
	            <div>
	                <div>
	                    <small>아이디</small><br>
	                    <input type="text" name="id" id="id">
	                </div>
	                <div>
	                    <small>비밀번호</small><br>
	                    <input type="password" name="pw" id="pw">
	                </div>
	                
	            </div>
	            <br><br>
	
	            <button type="submit">로그인</button>
	        </form>
	    </div>
	</div>
	
	<footer>
        Copyright 2022. YYDH Software 2-2. All rights reserved.
    </footer>
</body>
</html>