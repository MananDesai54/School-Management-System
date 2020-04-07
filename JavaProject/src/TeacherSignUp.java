

import java.io.IOException;
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
 * Servlet implementation class TeacherSignUp
 */
@WebServlet("/TeacherSignUp")
public class TeacherSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = (String)request.getParameter("password");
		String repassword = (String)request.getParameter("repassword");
		RequestDispatcher rd = null;
		if(!password.equals(repassword)) {
			rd = request.getRequestDispatcher("signup.jsp?msg=Passwords do not match...!!!");
			rd.forward(request, response);
		}else {
				HttpSession session = request.getSession(false);
				String username = (String)request.getParameter("username");
				String firstname = (String)request.getParameter("firstname");
				String middlename = (String)request.getParameter("middlename");
				String lastname = (String)request.getParameter("lastname");
				String birthdate = (String)request.getParameter("bday");
				String subject = (String)request.getParameter("subject");
				String catagory = (String)request.getParameter("catagory");
				
				String url = "jdbc:mysql://127.0.0.1:3307/sys";
				String usrname = "root";
				String passwd = "manan5401";
				String q = "insert into Teacher values (?,?,?,?,?,?,?,?)";
				String q2 = "select username from Teacher where username=?";
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
					PreparedStatement p2 = conn.prepareStatement(q2);
					p2.setString(1, username);
					ResultSet r = p2.executeQuery();
					if(r.next()) {
						rd = request.getRequestDispatcher("signup.jsp?msg=username already exists...!!!");
						rd.forward(request, response);
					}else {
						PreparedStatement p = conn.prepareStatement(q);
						//System.out.println(p);
						p.setString(1, username);
						p.setString(2, firstname);
						p.setString(3, lastname);
						p.setString(4, middlename);
						p.setString(6, password);
						p.setString(7, birthdate);
						p.setString(5, subject);
						p.setString(8, catagory);
						int d = p.executeUpdate();
						if(username.equals("admin")) {
							session.setAttribute("admin", true);
						}
//						session.setAttribute("name", username);
//						session.setAttribute("catagory", catagory);
	//					ResultSet rs = st.executeQuery("select * from Student");
			//			while(rs.next()) {
			//				System.out.println(rs.getString(1) + " " +rs.getString(2));
			//			}
						st.close();
						conn.close();
						response.sendRedirect("teachersignup.jsp?msg=Teacher Successfully added...");
						//System.out.println("Hello");
					}
				}catch(SQLException e) {
					System.out.println(e);
				}
		}
	}

}
