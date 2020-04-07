

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
 * Servlet implementation class EditStudentDetail
 */
@WebServlet("/EditStudentDetail")
public class EditStudentDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentDetail() {
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
		String url = "jdbc:mysql://127.0.0.1:3307/sys";
		String usrname = "root";
		String passwd = "manan5401";
		
		String firstname = request.getParameter("firstname");
		String middlename = request.getParameter("middlename");
		String lastname = request.getParameter("lastname");
		String birthdate = request.getParameter("birthdate");
		String attendence = request.getParameter("attendence");
		String percentage = request.getParameter("percentage");
		String feestatus = request.getParameter("feestatus");
		
		System.out.println(attendence+" "+percentage);
		String username = request.getParameter("username");
		String q = "update Student set firstname=? , middlename=?, lastname=? , birthdate=? where username=?";
		String q2 = "update StudentDetail set attendence=? , percentage=? , feestatus=? where username=?";
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
			p.setString(1, firstname);
			p.setString(2, middlename);
			p.setString(3, lastname);
			p.setString(4, birthdate);
			p.setString(5, username);
			int d = p.executeUpdate();
			
			PreparedStatement p2 = conn.prepareStatement(q2);
			p2.setString(1, attendence);
			p2.setString(2, percentage);
			p2.setString(3, feestatus);
			p2.setString(4, username);
			
			int d2 = p2.executeUpdate();
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
			
			st.close();
			conn.close();
			rd = request.getRequestDispatcher("ShowStudent?username="+username+"&msg=Details Updated...");
			rd.forward(request, response);
			//System.out.println("Hello");
		}catch(SQLException e) {
			System.out.println(e);
		}
	}

}
