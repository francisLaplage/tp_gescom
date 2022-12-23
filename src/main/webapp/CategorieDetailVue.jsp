
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
			
				 	<div class="card border-info mb-3" style="max-width: 30rem;">
					  <div class="card-header">ID : ${uneCat.idCat }</div>
					  <div class="card-body">
					    <h4 class="card-title"> NOM CAT : ${uneCat.nomCat} </h4>
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