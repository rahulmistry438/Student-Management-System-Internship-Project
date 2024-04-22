<%@page import="java.sql.*" %>

<html>
	<head>
		<title> Delete St.</title>
		<style>
			body {
				background-color : lightyellow;
			}
		</style>
	</head>
	<body>
		<center>
			<h2>Delete Record Form</h2>
			<form>
				<label for="rno">Enter rno :</label>
				<input type="number" name="rno" id="rno" pattern=" [0-9]+" min="0" required>
				<br><br>
				<input type="submit" value="Save" name="btn">
				<br><br>
				<input type="button" value="Back" onclick="history.back()">
			</form>

			<%
				Statement stm = null;
				ResultSet rs = null;

				if(request.getParameter("btn") != null)
				{
					int rno = Integer.parseInt(request.getParameter("rno"));
					
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/internshipproject";
						Connection con = DriverManager.getConnection(url, "root", "abc123");

						String query = "select rno from student where rno=" +rno;
						stm = con.createStatement();
						rs = stm.executeQuery(query);

						if(rs.isBeforeFirst())
						{
							String sql = "delete from student where rno = ?";
							PreparedStatement pst = con.prepareStatement(sql);
							pst.setInt(1, rno);
							long r = pst.executeUpdate();
							out.println(r + " record deleted");
							con.close();
						}
						else
						{
							out.println("record does not exists");
							con.close();
						}
						con.close();
					}
					catch(SQLException e)
					{
						out.println("issue " + e);
					}
				}
			%>
		</center>
	</body>
</html>