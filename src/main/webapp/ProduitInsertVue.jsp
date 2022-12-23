<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Ajout d'un Produit</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav>
				<%@ include file="Menu.jsp" %>
			</nav>
			<h2 class="h2  mt-3 mb-3">AJOUT D'UN NOUVEAU PRODUIT</h2>
			
		    <form  method="POST" action="ProduitServlet?action=insert" class="form-inline justify-content-center">
		            <fieldset>		
		              <div class="form-group">
		                <label for="nomProd" class="col-form-label">NOM: </label>
		                <div class="col-sm-10">
		                  <input type="text"  required class="form-control" id="nomProd" name="nomProd" >
		                </div>
		              </div>
		              
		             <div class="form-group">
		                <label for="designation" class="col-form-label">DESIGNATION:</label>
		                <div class="col-sm-10">
		                  <input type="text"  required class="form-control" id="designation" name="designation" >
		                </div>
		              </div>
		             <div class="form-group">
		                <label for="prix" class="col-form-label">PRIX:</label>
		                <div class="col-sm-10">
		                  <input type="number"  required class="form-control" id="prix" name="prix" > &euro;
		                </div>
		              </div>
		             <div class="form-group">
		                <label for="stock" class="col-form-label">STOCK</label>
		                <div class="col-sm-10">
		                  <input type="number"  required class="form-control" id="stock" name="stock" > 
		                </div>
		              </div>
		               <div class="form-group">
		                <label for="image" class="col-form-label">IMAGE:</label>
		                <div class="col-sm-10">
		                  <input type="text"  required class="form-control" id="image" name="image" > 
		                </div>
		              </div>
		              
					   <div class="form-group">
					      <label for="categorie" class="form-label mt-4">CATEGORIE:</label>
					      <select class="form-select" id="categorie" name="categorie">
					        <c:forEach var="cat" items="${listeCat}">			        
					        	<option value="${cat.idCat}"> ${cat.nomCat} </option>
							</c:forEach>
					      </select>
					    </div>		              
		              <button type="submit" class="btn btn-primary mt-3">Add PRODUIT</button>
		         </fieldset>
		    </form>
			
		</div>
		<%@ include file="FootConfig.jsp" %>
	</body>
</html>