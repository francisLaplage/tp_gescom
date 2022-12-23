
<div >
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="ProduitServlet">Gescom</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarColor01">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="ProduitServlet">Home
	            <span class="visually-hidden">(current)</span>
	          </a>
	        </li>
	        <c:if test="${ !empty sessionScope.userConnect &&  sessionScope.userConnect.role =='admin'}">
		        <li class="nav-item">
		          <a class="nav-link" href="CategorieServletControleur">Gestion des Catégories</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="ProduitServlet?action=liste">Gestion des produits</a>
		        </li>
		       <li class="nav-item">
		          <a class="nav-link" href="ProduitServlet?action=gesUsers">Gestion des Utilisateurs</a>
		        </li>
		     </c:if>    
	        <li class="nav-item">
	          <a class="nav-link" href="#"> About</a>
	        </li>
	      </ul>
	      <ul class="navbar-nav ml-auto">	      		
		    	<c:if test="${  empty sessionScope.userConnect }">
			      	 <li class="nav-item">
			          	<a class="nav-link" href="ConnexionServlet">connexion</a>
			        </li>
		        </c:if>  
		        <c:if test="${  !empty sessionScope.userConnect }">
<!-- 			        <li class="nav-item">
			          	<a class="nav-link" href="ConnexionServlet?action=deconnexion">déconnexion</a>
			        </li> -->
					  <div class="dropdown">
						  <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    ${sessionScope.userConnect.login}
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" href="UserServlet?action=profil">Profil</a></li>
						    <li><a class="dropdown-item" href="UserServlet?action=panier">Panier</a></li>
						    <li><a class="dropdown-item" href="ConnexionServlet?action=deconnexion">Déconnexion</a></li>
						 </ul>
					</div>					        
	         </c:if>  	      
	      </ul>      
	    </div>
	  </div>
	</nav>
</div>