<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Gestion des Produits</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav class="mt-3">
				<%@ include file="Menu.jsp" %>
			</nav>	
			<h2 class="h2 mt-3">LISTE DES PRODUITS</h2>	
			<a href="?action=insert" class="btn btn-success mt-2 mb-2">ADD PRODUITS</a>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>ID: </th>
								<th>NOM: </th>
								<th>DESIGNATION:</th>
								<th>PRIX:</th>
								<th>STOCK</th>
								<th>IMAGE</th>
								<th>CATEGORIE</th>
								<th colspan="3">ACTIONS</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${listeProd}">
									<tr>									
										<td> ${p.id}  </td>
										<td>  ${p.nom}</td>
										<td> ${p.designation}  </td>
										<td>  ${p.prix}</td>
										<td> ${p.stock}  </td>
										<td> <img src="${p.image_url}" style="width:100px;">   </td>
										<td>  ${p.categorie_id.nomCat}</td>								
										<td> <a href="?action=delete&id=${p.id}" class="btn btn-danger"> DELETE</a> </td>	
										<td>  <a class="btn btn-warning"  href="?action=update&id=${p.id}" > UPDATE</a> </td>
										<td>  <a href="?action=detail&id=${p.id}" class="btn btn-secondary"> DETAILS</a> </td>								
									</tr>	
							</c:forEach>					
						</tbody>
					</table>
			</div>		
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>