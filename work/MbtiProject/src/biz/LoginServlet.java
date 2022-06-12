package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MbtiDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String id, pwd;
		boolean result = false;
		PrintWriter out = response.getWriter();
		
		id = request.getParameter("id");
		pwd = request.getParameter("pw");
		
		MbtiDao dao = new MbtiDao();
		result = dao.getMemberPwd(id, pwd);
		
		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("logOK", id);
			response.sendRedirect("/index.jsp");
		}else {
			out.print("<script> alert('회원 정보가 일치 하지 않습니다.'); "
					+ "history.back(); </script>");
		}
	}
}
