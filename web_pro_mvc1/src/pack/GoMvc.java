package pack;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoMvc
 */
@WebServlet("/GoMvc")
public class GoMvc extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name;
		try {
			name = request.getParameter("name");
		} catch (Exception e) {
			name = null;
		}
		String result="", viewName="";
		
		//클라이언트의 요청을 판단
		if(name == null || name.equals("")) {
			result = "환영합니다";
			viewName = "/gomvc_view1.jsp";
		}else if(name.equals("korea")) {
			result ="한국인이군요";
			viewName = "/gomvc_view2.jsp";
		}else {
			result = name + "님 반가워요";
			viewName = "/gomvc_view3.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
		request.setAttribute("result", result);
		dispatcher.forward(request, response);
		
	}

}
