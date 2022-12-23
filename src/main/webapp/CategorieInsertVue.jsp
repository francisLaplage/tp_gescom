<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Ajout d'une catégorie</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
		<div class="container">
			<nav>
				<%@ include file="Menu.jsp" %>
			</nav>
			<h1 class="h1 text-center mt-3 mb-3">AJOUT D'UNE NOUVELLE CATEGORIE</h1>
			
			
		    <form  method="POST" action="CategorieServletControleur?action=insert" class="form-inline justify-content-center">
		            <fieldset>
		              <legend>Update</legend>
		
		              <div class="form-group row">
		                <label for="txtNomCat" class="col-form-label">NOM CATEGORIE</label>
		                <div class="col-sm-10">
		                  <input type="text"  required class="form-control" id="txtNomCat" name="txtNomCat" >
		                </div>
		              </div>
		              <button type="submit" class="btn btn-primary mt-3">Add CATEGORIE</button>
		         </fieldset>
		    </form>
			
		</div>
	
	</body>
</html>