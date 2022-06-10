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
	<header>
	    <nav>
	        <div id="logo">
	        	MBTIwithLove
	        </div>
	        <ul>
	            <li><a href="/work/chemistry.jsp">궁합보기</a></li>
	            <li><a href="/work/matching.jsp">매칭하기</a></li>
	            <li><a href="/register/mypage.jsp">MYPAGE</a></li>
	            <li><a href="/register/login.jsp">로그인</a></li>
	            <li><a href="/register/join.jsp">회원가입</a></li>
	        </ul>
	    </nav>
	</header>
<%	
	MbtiDao dao = new MbtiDao();
	ArrayList<String> result = dao.getChemiList("INFP");
	// out.print(result.get(0));
	// out.print(result.get(1));
%>

	<div id="loading">
        <div>
            <!-- 요정 -->
            <img src="/resources/fairy.png">
        </div>
        <h2>당신의 천생연분은 어떤 유형?</h2>
        <span><img src="/resources/loading.gif"></span>
    </div>

	<div id="wrapper">
		<div class="box">
	        <div>
	            <img src="/resources/INFP.png">
	        </div>
	        <div>
	            <img src="/resources/<%= result.get(0) %>.png">
	        </div>
	        <div class="heart">♥</div>
	    </div>
	    
	    <div class="box">
	        <div>
	            <img src="/resources/INFP.png">
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
    
    
    <script>
    	window.addEventListener('load', () => {
    		document.querySelector("#wrapper").style.display = "none";
    		document.querySelector("#loading").style.display = "block";
    		setTimeout(() => {
    			document.querySelector("#wrapper").style.display = "flex";
        		document.querySelector("#loading").style.display = "none";	
    		}, 3500);
    	});
    </script>
</body>
</html>