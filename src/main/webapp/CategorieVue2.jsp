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
							<c:forEach var="cat" items="${listeCat}">
									<tr>									
										<td> ${cat.idCat}  </td>
										<td>  ${cat.nomCat}</td>								
										<td> <a href="?action=delete&id=${cat.idCat }" class="btn btn-danger"> DELETE</a> </td>	
										<td>  <a class="btn btn-warning"  href="?action=update&id=${cat.idCat }" > UPDATE</a> </td>
										<td>  <a href="?action=detail&id=${cat.idCat }" class="btn btn-secondary"> DETAILS</a> </td>								
									</tr>	
							</c:forEach>					
						</tbody>
					</table>
			</div>		
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>