


<%@page import="java.sql.*" %>

<html>
	<head>
		<title>Add St.</title>
		<style>
			body {
				background-color : lightyellow;
			}
		</style>
	</head>
	<body>
		<center>
			<h2>Add Record Form</h2>
			<form>
				<label for="rno">Enter rno :</label>
				<input type="number" name="rno" id="rno" min="1" required>
				<br><br>
				<label for="name">Enter name :</label>
				<input type="text" name="name" id="name" onkeydown="return /[a-zA-Z]/i.test(event.key)" minlength="2" onpaste="return false" autocomplete="off" required>
				<br><br>
				<label for="s1">Enter Sub 1 marks :</label>
				<input type="number" name="marks1" id="s1" min="0" max="100"  required>
				<br><br>
				<label for="s2">Enter Sub 2 marks :</label>
				<input type="number" name="marks2" id="s2" min="0" max="100"  required>
				<br><br>
				<label for="s3">Enter Sub 3 marks :</label>
				<input type="number" name="marks3" id="s3" min="0" max="100"  required>
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
					String name = request.getParameter("name");
					int marks1 = Integer.parseInt(request.getParameter("marks1"));
					int marks2 = Integer.parseInt(request.getParameter("marks2"));
					int marks3 = Integer.parseInt(request.getParameter("marks3"));
			
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
							out.println("record already exists");
							con.close();
						}
						else
						{
							String sql = "insert into student values(?, ?, ?, ?, ?)";
							PreparedStatement pst = con.prepareStatement(sql);
							pst.setInt(1, rno);
							pst.setString(2, name);
							pst.setInt(3, marks1);
							pst.setInt(4, marks2);
							pst.setInt(5, marks3);
							pst.executeUpdate();
							con.close();
							out.println("record created");
						}
						con.close();
					}
					catch(SQLException e)
					{
						out.println("issue " + e);
					}
				}
			%>
		</center
	</body>
</html>