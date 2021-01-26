package web_pro6;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TestJstlServlet")
public class TestJstlServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String irum = "마당쇠";
		request.setAttribute("man", irum);

		Person person = new Person();
		person.setName("한송이");
		request.setAttribute("person", person);
		
		String[] ani = {"말", "댕댕이", "호랑이"};
		request.setAttribute("animal", ani);
		
		String[] foods = {"당근", "개밥", "고기"};
		
		List<Object> list = new ArrayList<Object>();
		list.add(ani);
		list.add(foods);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("jstl_ex3_view.jsp").forward(request, response);

	}

}
