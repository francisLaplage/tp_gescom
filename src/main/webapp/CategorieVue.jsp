<%@page import="java.util.ArrayList"%>
<%@page import="fr.francis.metier.modeles.Categorie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gestion des Catégorie</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav class="mt-3">
				<%@ include file="Menu.jsp" %>
			</nav>
		
			<h1 class="h1 text-center mt-3">LISTE DES CATEGORIES</h1>
			
			<a href="?action=insert" class="btn btn-success mt-2 mb-2">ADD CATEGORIE</a>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID CAT</th>
								<th>NOM CAT</th>
								<th colspan="3">ACTIONS</th>
							</tr>
						</thead>
						<tbody>
							<%
								// Récupération de la liste dans l'objet request
								List<Categorie> liste = new ArrayList();
											liste = (ArrayList) request.getAttribute("listeCat");
											
								for(int i =0;i<liste.size();i++){
							%>
									<tr>
										<td> <%= liste.get(i).getIdCat() %>  </td>
										<td> <%= liste.get(i).getNomCat() %></td>		
										<td> <a href="?action=delete&id=<%=liste.get(i).getIdCat()%>" class="btn btn-danger"> DELETE</a> </td>	
										<td>  <a class="btn btn-warning"  href="?action=update&id=<%=liste.get(i).getIdCat()%>" > UPDATE</a> </td>
										<td>  <a href="?action=detail&id=<%=liste.get(i).getIdCat()%>" class="btn btn-secondary"> DETAILS</a> </td>		
									</tr>						
							<% 		
								}
							%>
						</tbody>
					</table>
			</div>		
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>