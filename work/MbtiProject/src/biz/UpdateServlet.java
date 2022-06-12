package biz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MbtiDao;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVaersionUID = 1L;
	
	public UpdateServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text.html; charset=UTF-8");
		
		MbtiDao dao = new MbtiDao();
		int n = 0;
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("mbti"));
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("loginOK"));
		n = dao.updateMember(request.getParameter("name"), request.getParameter("mbti"), (String)session.getAttribute("loginOK"));
		
		if (n > 0) {
			System.out.println("***************************마이페이지 수정 성공");
			response.sendRedirect("/index.jsp");
		} else {
			System.out.println("***************************마이페이지 수정 실패");
//			out.print("<><>");
		}
	}
}
