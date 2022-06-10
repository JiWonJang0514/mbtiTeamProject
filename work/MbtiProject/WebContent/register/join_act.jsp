<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="dao.MbtiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	
		String id, pwd, name, mbti;
		MbtiDao dao = new MbtiDao();
		int n = 0;
		
		id = request.getParameter("id");
		pwd = request.getParameter("pw");
		name = request.getParameter("name");
		mbti = request.getParameter("mbti");
		
		n = dao.insertMember(id, pwd, name, mbti);
			
		if(n>0)
			response.sendRedirect("/register/login.jsp");
		else
			out.print("<script>alert('회원 가입 실패')</script>");
			out.print("<script> history.back() </script>");
			
	%>
</body>
</html>