

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
 * Servlet implementation class AddStudentDetail
 */
@WebServlet("/AddStudentDetail")
public class AddStudentDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentDetail() {
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
		
		String username = request.getParameter("username");
		String attendence = request.getParameter("attendence");
		String percentage = request.getParameter("percentage");
		String feestatus = request.getParameter("feestatus");
		
		if(attendence.equals(null) || attendence.equals("0") || attendence.equals("00") || attendence.equals("%")) {
			attendence = "00%";
		}
		if(percentage.equals(null) || percentage.equals("0") || percentage.equals("00") || percentage.equals("%")) {
			percentage = "00%";
		}
		
		String q = "update StudentDetail set username=? , attendence=?, feestatus=? , percentage=? where username=?";
		String q2 = "select * from Student where username=?";
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
			p.setString(2, attendence);
			p.setString(3, feestatus);
			p.setString(4, percentage);
			p.setString(5, username);
			int d = p.executeUpdate();
			
			PreparedStatement p2 = conn.prepareStatement(q2);
			p2.setString(1, username);
			
			ResultSet rs = p2.executeQuery();
			rs.next();
//			while(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
			
			st.close();
			conn.close();
			rd = request.getRequestDispatcher("addstudentdetail.jsp?msg=Details Updated...");
			rd.forward(request, response);
			//System.out.println("Hello");
		}catch(SQLException e) {
			System.out.println(e);
		}
	}

}
