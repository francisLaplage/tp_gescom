<%@page import="fr.francis.metier.modeles.Categorie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Détail d'une catégorie</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		
		<div class="container">
			<nav>
				<%@ include file="Menu.jsp" %>
			</nav>
			<h1 class="h1 text-center mt-3 mb-3">Détails D'UNE  CATEGORIE</h1>

			
			<div calss="row">
				<div class="col-4"></div>
				<div class="col-4">				
					 <%
					 	// Récupération de l'objet catégorie dans la requête
					 	Categorie cat = (Categorie) request.getAttribute("uneCat");			
		
					 %>
			
				 	<div class="card border-info mb-3" style="max-width: 30rem;">
					  <div class="card-header">ID : <%= cat.getIdCat() %> </div>
					  <div class="card-body">
					    <h4 class="card-title"> NOM CAT : <%= cat.getNomCat() %> </h4>
					    	<p class="card-text"></p>
					    </div>
					</div>
				</div>
				
				<div class="col-4"></div>
			</div>
			
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>