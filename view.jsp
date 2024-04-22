<%@page import="java.sql.*" %>

<html>
	<head>
		<title>View St.</title>
		<style>
			body {
				background-color : lightyellow;
			}
		</style>
	</head>
	<body>
		<center>
			<table border="5" style="width:50%;">
				<tr>
					<th> Rno </th>
					<th> Name </th>
					<th>S1</th>
					<th>S2</th>
					<th>S3</th>
				</tr>

				<%
					try
					{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/internshipproject";
						Connection con = DriverManager.getConnection(url, "root", "abc123");
						String sql = "select * from student";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next())
						{
							int rno = rs.getInt(1);
							String name = rs.getString(2);
							int marks1 = rs.getInt(3);
							int marks2 = rs.getInt(4);
							int marks3 = rs.getInt(5);
				%>
						<tr style="text-align:center;">
						<td> <%=rno %> </td>
						<td> <%=name %> </td>
						<td> <%=marks1 %> </td>
						<td> <%=marks2 %> </td>
						<td> <%=marks3 %> </td>
						</tr>
			<%
						}
					}
					catch(SQLException e)
					{
						out.println("issue " + e);
					}
			%>
			</table>

			<br><br>
			<input type="button" value="Back" onclick="history.back()">
		</center>
	</body>
</html>