<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="Dbwrk.dconnect"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.BasicDBList"%>
<%@ page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>STUDENT DETAILS</title>
<link href="CSS/STYLES.css" rel="stylesheet" type="text/css" />
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

td {
	font-size: 14PX;
}

tr:nth-child(even) {
	background-color: #f8f8f8
}

tr:hover {
	background-color: #b9ebf9;
	cursor: pointer;
}

th {
	background-color: hsla(202, 100%, 50%, 1.00);
	color: white;
}
.Info
{
	height:550px;
	overflow-x:auto;
	overflow-y:auto;
}
</s
</style>

<%!String name, bday, gender, bgroup, relegion, nation, Student, Parent, Contacts;
	String lang, lang1, lang2, lang3, lang4, grade, father, occupation, addr, email, contact;%>
<%!int id = 0, age, zipcode, income, limit;%>
<%!String sort;
	int i;%>
<%!DBCursor cursor;
	BasicDBObject srt;%>
</head>

<body>

	<div>
		<Header>STUDENT FORM</Header>
		<form action="Viewall.jsp" method="post" name="VIEW" target="_self"
			id="STUDENT">
			<p>&nbsp;</p>
			<div class="container">
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Records : <select
						name="LIMIT" id="LIMIT" class="SORT point shadow"
						onchange="this.form.submit();">
						<option value="0"></option>
						<option value="1">1</option>
						<option value="10">10</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sort By : <select
						name="SORT" id="SORT" class="CONTACT point shadow"
						onchange="this.form.submit();">
						<option></option>
						<option value="ID">ID</option>
						<option value="NAME">NAME</option>
						<option value="BLOOD GROUP">BLOOD GROUP</option>
						<option value="RELEGION">RELEGION</option>
						<option value="GRADE">GRADE</option>
					</select>
				</p>
				<p>&nbsp;</p>
				<div class="Info">
					<table>
						<tbody>
							<tr>
								<th>Id</th>
								<th>Student</th>
								<th>Blood</th>
								<th>Relegion</th>
								<th>Grade</th>
								<th>Parent</th>
								<th>Contact</th>
							</tr>

							<%
								dconnect test = dconnect.createInstance();
								DBCollection coll = test.getCollection("Student");

								session.invalidate();
								if (request.getParameter("LIMIT") != null) 
								{
									i = Integer.parseInt(request.getParameter("LIMIT"));
								}
								if (i > 0)
									cursor = coll.find().limit(i);

								else if (request.getParameter("SORT") != null) 
								{
									sort = request.getParameter("SORT");
									srt = new BasicDBObject();
									srt.put(sort, 1);

									cursor = coll.find().sort(srt);
								} 
								else 
								{
									cursor = coll.find();
								}

								if (cursor != null) 
								{
									while (cursor.hasNext()) 
									{
										DBObject cur = cursor.next();
										id = Integer.parseInt(cur.get("ID").toString());
										name = cur.get("NAME").toString();
										bday = cur.get("BIRTHDAY").toString();
										age = Integer.parseInt(cur.get("AGE").toString());
										gender = cur.get("GENDER").toString();
										bgroup = cur.get("BLOOD GROUP").toString();
										relegion = cur.get("RELEGION").toString();
										nation = cur.get("NATIONALITY").toString();
										grade = cur.get("QUALIFICATION").toString();
										father = cur.get("FATHER'S NAME").toString();
										occupation = cur.get("OCCUPATION").toString();
										income = Integer.parseInt(cur.get("ANNUAL INCOME").toString());

										DBObject contacts = (BasicDBObject) cur.get("CONTACT_DETAILS");
										addr = contacts.get("ADDRESS").toString();
										zipcode = Integer.parseInt(contacts.get("ZIPCODE").toString());
										contact = contacts.get("CONTACT").toString();
										email = contacts.get("EMAIL").toString();

										Student = name + ", " + bday + ", " + age;
										Parent = father + ", " + occupation + ", " + income;
										Contacts = addr + ", " + nation + ", " + zipcode + ", " + contact + ", " + email;
							%>
							<tr>
								<td style="background-color: none;"><input type="submit"
									class="btn blue btn-effect" id="Button" form="STUDENT"
									formaction="Students.jsp" formmethod="post" name="UPDATE"
									value="<%=id%>" /></td>
								<td><%=Student%></td>
								<td><%=bgroup%></td>
								<td><%=relegion%></td>
								<td><%=grade%></td>
								<td><%=Parent%></td>
								<td><%=Contacts%></td>

							</tr>
							<%
									}

								}
							%>

						</tbody>
					</table>
				</div>
				<Footer>
				<p>&nbsp;</p>
				</Footer>

			</div>
		</form>

	</div>
</body>
</html>
