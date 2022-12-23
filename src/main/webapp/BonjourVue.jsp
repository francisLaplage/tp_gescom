<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
	
	
			
					<!-- 
				Balises JSP :
					- <%   %>  ==>  Utilisation du code java
					- <%--    --%>  ==> Commentaires
					- <%--  - <%=  %>   ==>  Affichage du contenu d'une variable	   --%> 
			 -->
			 
			 <%
			 		// Code java
			 	String login = request.getParameter("txtLogin");
				String pwd = request.getParameter("txtPwd");
				 if(login == null) login="";
			 %>
			 
			<form method='POST' action='Bonjour' >
				  <div>
					 <label for='txtLogin'>Login :</label><br>
					 <input type='text' id='txtLogin' name='txtLogin' value=' <%= login  %>' > 
				  </div>
				  <div>
					 <label for='txtPwd'>Password : </label><br>
				  	  <input type='password' id='txtPwd' name='txtPwd' >
					</div>			
				  <input type='submit' id='btnConnexion' name='btnConnexion' value='Connexion' > <br> <br>	  			
			</form>
			
		</div>
	</body>
</html>