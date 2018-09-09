package Dbwrk;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;

public class curd extends HttpServlet {
	String lang, lang1, lang2, lang3, lang4;
	private static final long serialVersionUID = 1L;

	public curd() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		dconnect mongo = dconnect.createInstance();
		DBCollection coll = mongo.getCollection("Student");

		String name, bday, gender, bgroup, relegion, nation;
		String grade, father, occupation, addr, email, contact;
		int age = 0, zipcode, income, id = 0, check = 0;

		String btn = request.getParameter("Button");
		try 
		{
			id = Integer.parseInt(request.getParameter("ID"));
		} 
		catch (Exception e) 
		{
			session.setAttribute("msg", "NULLID");
			out.println("<script>window.location ='Students.jsp' </script>");
		}

		if ("SAVE".equals(btn)) 
		{
			try 
			{
				name = request.getParameter("SNAME");
				bday = request.getParameter("BDAY");
				age = Integer.parseInt(request.getParameter("AGE"));
				gender = request.getParameter("GENDER");
				bgroup = request.getParameter("BGROUP");
				relegion = request.getParameter("RELEGION");
				nation = request.getParameter("NATIONALITY");

				if (request.getParameter("TAMIL") != null || request.getParameter("ENGLISH") != null || request.getParameter("HINDI") != null || request.getParameter("OTHERL") != null) 
				{
					try 
					{
						lang1 = request.getParameter("TAMIL");
						lang2 = request.getParameter("ENGLISH");
						lang3 = request.getParameter("HINDI");
						lang4 = request.getParameter("OTHERL");
					} 
					catch (NullPointerException e) 
					{

					}

				} 
				else
				{
					session.setAttribute("msg", "CHECKERR");
					out.println("<script>window.location ='Students.jsp' </script>");
				}

				grade = request.getParameter("QUALIFICATION");
				father = request.getParameter("FNAME");
				occupation = request.getParameter("OCCUPATION");
				income = Integer.parseInt(request.getParameter("AINCOME"));
				addr = request.getParameter("ADDRESS");
				zipcode = Integer.parseInt(request.getParameter("ZCODE"));
				contact = request.getParameter("CNUMBER");
				email = request.getParameter("EADDRESS");

				BasicDBObject contacts = new BasicDBObject();
				contacts.put("ADDRESS", addr);
				contacts.put("ZIPCODE", zipcode);
				contacts.put("CONTACT", contact);
				contacts.put("EMAIL", email);

				BasicDBObject lang = new BasicDBObject();
				lang.put("LANG_1", lang1);
				lang.put("LANG_2", lang2);
				lang.put("LANG_3", lang3);
				lang.put("LANG_4", lang4);

				BasicDBObject doc = new BasicDBObject();
				doc.put("ID", id);
				doc.put("NAME", name);
				doc.put("BIRTHDAY", bday);
				doc.put("AGE", age);
				doc.put("GENDER", gender);
				doc.put("BLOOD GROUP", bgroup);
				doc.put("RELEGION", relegion);
				doc.put("NATIONALITY", nation);
				doc.put("LANGUAGE", lang);
				doc.put("QUALIFICATION", grade);
				doc.put("FATHER'S NAME", father);
				doc.put("FATHER'S NAME", father);
				doc.put("OCCUPATION", occupation);
				doc.put("ANNUAL INCOME", income);
				doc.put("CONTACT_DETAILS", contacts);

				BasicDBObject search = new BasicDBObject();
				search.put("ID", id);

				try 
				{
					coll.update(search, doc, true, false);
					session.setAttribute("msg", "INSERT");
					out.println("<script>window.location ='Students.jsp' </script>");
				} 
				catch (Exception e) 
				{
					session.setAttribute("msg", "ERR");
					out.println("<script>window.location ='Students.jsp' </script>");
				}

			} 
			catch (Exception e) 
			{
				out.println(e);
			}

		} 
		else if ("DELETE".equals(btn)) 
		{
			BasicDBObject search = new BasicDBObject();
			search.put("ID", id);
			if (id != 0)
				session.setAttribute("msg", "DELETE");
			out.println("<script>window.location ='Students.jsp' </script>");
			coll.remove(search);

		}

	}

}
