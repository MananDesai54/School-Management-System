

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
 * Servlet implementation class ShowTeacher
 */
@WebServlet("/ShowTeacher")
public class ShowTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTeacher() {
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
		String q = "select * from Teacher where username=?";
		System.out.println(username);
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
			String[] arr = new String[5];
			arr[0] = rs.getString("firstname");
			arr[1] = rs.getString("lastname");
			arr[2] = rs.getString("middlename");
			arr[3] = rs.getString("birthdate");
			arr[4] = username;
			session.setAttribute("detail", arr);
			st.close();
			conn.close();
			String msg = request.getParameter("msg");
			if(msg!=null) {
				rd = request.getRequestDispatcher("edittescherdetail.jsp?msg="+msg);
			}else  {
				rd = request.getRequestDispatcher("editteacherdetail.jsp");
			}
			rd.forward(request, response);
			//System.out.println("Hello");
		}catch(SQLException e) {
			System.out.println(e);
		}
	}

}
