

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
 * Servlet implementation class TeacherDetail
 */
@WebServlet("/TeacherDetail")
public class TeacherDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		HttpSession session = request.getSession(false);
		String username = (String) session.getAttribute("name");
		String url = "jdbc:mysql://127.0.0.1:3307/sys";
		String usrname = "root";
		String passwd = "manan5401";
		String q = "select * from Teacher where username=?";
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
			ResultSet rs = p.executeQuery();
			rs.next();
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
			System.out.println(rs.getString("subject"));
			session.setAttribute("firstname", rs.getString("firstname"));
			session.setAttribute("middlename", rs.getString("middlename"));
			session.setAttribute("lastname", rs.getString("lastname"));
			session.setAttribute("birthdate", rs.getString("birthdate"));
			session.setAttribute("subject", rs.getString("subject"));
			session.setAttribute("catagory", rs.getString("catagory"));
			st.close();
			conn.close();
			rd = request.getRequestDispatcher("detail.jsp");
			rd.forward(request, response);
			//System.out.println("Hello");
		}catch(SQLException e) {
			System.out.println(e);
		}
	}

}
