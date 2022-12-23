<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<title>Détail d'un produit</title>
	</head>
	<body>
		<div class="container">	
			<nav class="mt-3">
				<%@ include file="Menu.jsp" %>
			</nav>	
			<h2 class="h2 mt-3"> Détails du produit N° ${unProd.id} </h2>
							
		<div style="max-width:500px; width:100%;margin:auto;">
				 <div class="col-md-12">
					<div class="card mb-3">
					  <h4 class="card-header">${unProd.nom}</h4>
					  <div class="card-body">
					    <h5 class="card-title">Categorie : ${unProd.categorie_id.nomCat}</h5>
					  </div>
						 	 <a href="?action=detail&id=${unProd.id}"> 
						 	 	<img class="card-img-top"  src="${unProd.image_url}">
						    </a>
						  <div class="card-body">
						    <p class="card-text">prix : ${unProd.prix} &#x20AC;</p>
						  </div>
						  	<div class="card-body">
						    <p class="card-text">Designation : ${unProd.designation } </p>
						  </div>
					
						  <div class="card-body text-center">
						    <a href="UserServlet?action=panierIinc&id=${unProd.id}" class="btn btn-primary">Ajout au Panier</a>
						    <a href="#" class="btn btn-success">Afficher</a>
				 		</div>
					</div>				
				</div>	
		</div>
		<!-- 		<div class="col-md-4"></div> -->
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>