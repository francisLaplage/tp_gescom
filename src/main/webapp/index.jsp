
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Accueil</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav class="mt-3">
				<%@ include file="Menu.jsp" %>
			</nav>
			<h2 class="h2 mt-3">Tous Les Produits</h2>		
			<!-- Card  -->
			<div class="row">		
			<c:forEach var="p" items="${listeProd}">			
					 <div class="col-md-3">
						<div class="card mb-3">
						  <h4 class="card-header">${p.nom}</h4>
						  <div class="card-body">
						    <h5 class="card-title">Categorie : ${p.categorie_id.nomCat}</h5>
						  </div>
							 	 <a href="?action=detail&id=${p.id}"> 
							 	 	<img class="card-img-top"  src="${p.image_url}">
							    </a>
							  <div class="card-body">
							    <p class="card-text">prix : ${p.prix} &#x20AC;</p>
							  </div>
							  	<div class="card-body">
							    <p class="card-text">Designation : ${p.designation } </p>
							  </div>					
							  <div class="card-body text-center">
							    <a href="UserServlet?action=panierIinc&id=${p.id}" class="btn btn-primary">Ajout au Panier</a>
							    <a href="#" class="btn btn-success">Afficher</a>
					 		</div>
						</div>					
					</div>					
				</c:forEach>		
			</div>	
			<!--  -->				
		</div>
			<%@ include file="FootConfig.jsp" %>
	</body>
</html>