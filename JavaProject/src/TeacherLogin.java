

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TeacherLogin
 */
@WebServlet("/TeacherLogin")
public class TeacherLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		HttpSession session = request.getSession(false);
		
		String url = "jdbc:mysql://127.0.0.1:3307/sys";
		String usrname = "root";
		String passwd = "manan5401";
		String q = "select username,catagory from Teacher where username=? and password=?";
		//System.out.println("Hello");
		try {
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			//System.out.println("Hello");
			Connection conn = DriverManager.getConnection(url,usrname,passwd);
			//System.out.println(conn);
			//System.out.println("Hello");
			Statement st = conn.createStatement();
			//int c = st.executeUpdate("insert into manan values('"+ name +"',"+ id + ")");
			//System.out.println(c);
			PreparedStatement p = conn.prepareStatement(q);
			//System.out.println(p);
			p.setString(1, username);
			p.setString(2, password);
			ResultSet rs = p.executeQuery();
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
			if(rs.next()) {
				if(username.equals("admin")) {
					session.setAttribute("admin", true);
				}
				session.setAttribute("name", rs.getString(1));
				session.setAttribute("catagory", rs.getString(2));
				session.setAttribute("login", true);
				
			}else {
				rd = request.getRequestDispatcher("login.jsp?msg=Invalid username/password...!!");
				rd.forward(request, response);
			}
			st.close();
			conn.close();
			response.sendRedirect("home.jsp");
			//System.out.println("Hello");
		}catch(SQLException e) {
			System.out.println(e);
		}
	}

}
