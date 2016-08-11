package com;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import com.mysql.jdbc.Connection;
//import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L; // The serialVersionUID is
														// a universal version
														// identifier for a
														// Serializable class.
														// Deserialization uses
														// this number to ensure
														// that a loaded class
														// corresponds exactly
														// to a serialized
														// object. If no match
														// is found, then an
														// InvalidClassException
														// is thrown.

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		// PrintWriter out = response.getWriter();
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "schema1";
		String driver = "com.mysql.jdbc.Driver";
		String userName = "root";
		String password = "root";

		Statement st;
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, password);
			System.out.println("Connected!");
			String foe = request.getParameter("foe");
			String time = request.getParameter("time");
			String loc = request.getParameter("loc");
			String bud1 = request.getParameter("bud1");
			String bud2 = request.getParameter("bud2");
			String num = request.getParameter("num");
			String apr = request.getParameter("apr");

			ArrayList<String> al = null;
			ArrayList<ArrayList<String>> pid_list = new ArrayList<ArrayList<String>>();
//			String query = "select * from worker where foe='" + foe + "' or aperf='" + time + "' or loc='" + loc
//					+ "' or fperf='" + bud1 + "' ";
			String query = "SELECT * FROM worker WHERE foe LIKE '%" + foe + "%'";

			System.out.println("Search.java - query: " + query);
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				al = new ArrayList<String>();

				// out.println(rs.getString(1));
				// out.println(rs.getString(2));
				// out.println(rs.getString(3));
				// out.println(rs.getString(4));
				// al.add(rs.getString(1));
				// al.add(rs.getString(2));
				// al.add(rs.getString(3));
				// al.add(rs.getString(4));

				al.add(rs.getString(5));
				al.add(rs.getString(4));
				al.add(rs.getString(14));
				al.add(rs.getString(15));

				System.out.println("al :: " + al);
				pid_list.add(al);
			}

			request.setAttribute("piList", pid_list);
			request.setAttribute("task", foe);
			RequestDispatcher view = request.getRequestDispatcher("/searchview.jsp");
			view.forward(request, response);
			conn.close();
			System.out.println("Disconnected!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// doGet(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * 
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
