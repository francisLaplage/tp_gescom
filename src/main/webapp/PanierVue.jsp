<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Panier User</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
	<div class="container">
		<nav class="mt-3">
			<%@ include file="Menu.jsp" %>
		</nav>
		<div class="card border-primary mt-5 " >
		  <div class="card-header">Vôtre Panier :  <span>${ptt} &euro;</span> </div>
		  <div class="card-body">
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">Nom</th>
				      <th scope="col">Quantite</th>
				      <th scope="col">Prix</th>
				      <th scope="col">PT</th>
				      <th scope="col">Image</th>			      
				    </tr>
				  </thead>
				  <tbody>
				  <!-- ${ sessionScope.userConnect.nomUser}  -->
				  <c:forEach var="p" items="${contenuePanier}" >
				    <tr class="table-active" >
				      <td>${p.prod.nom} </td>
				      <td>${p.quantite} </td>
				      <td>${p.prod.prix} </td>
				       <td>${p.prod.prix * p.quantite} </td>
				      <td><img src="${p.prod.image_url}" style="width:100px;"></td>
				       <td> <a href="UserServlet?action=panierIinc&id=${p.prod.id}" class="btn btn-success">+</a></td>
				       <td> <a href="UserServlet?action=panierDesc&id=${p.prod.id}" class="btn btn-danger">-</a></td>
				    </tr>
				   </c:forEach>
				  </tbody>
				</table> 
		  </div>
		</div>
	</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>