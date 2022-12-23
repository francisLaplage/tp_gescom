package fr.francis.dao;


import java.sql.Date;

import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.Panier;
import fr.francis.metier.modeles.PanierProduit;
import fr.francis.metier.modeles.Produit;
import fr.francis.metier.modeles.User;
import fr.francis.services.PanierService;

public class TestConnexion {

	public static void main(String[] args) {
		
		try {			
			//UserDao userDao = new UserDao();
			//ProduitDao prodDao = new ProduitDao();
			//System.out.println(userDao.authentification(new User("bart@yahoo.fr","Test1234","")));
			//PanierDao panier = new PanierDao();
			//PanierProduitDao panierProdDao = new PanierProduitDao();
			
			//1	Création du panier
				//panier.insert(new Panier(0,2,"23/12/2022"));
			//2	Ajout de produit
				
				//panierProdDao.ajoutProdAuPanier(new PanierProduit(16,
						//new Produit(3), 3));
			//3-	Suppression ou décrémentation de la quantité d'un prod dans le panier
				//panierProdDao.supprimerProdDuPanier(new PanierProduit(16,
						//new Produit(3), 3));
			//4-	Afficher le panier
				//System.out.println(panierProdDao.afficherPanier(15));
			//5-	Calcul du prix total du panier 15 == 756 €
				//System.out.println("PT du panier 15 = " + panierProdDao.calculPrixTotalDuPanier(15)  +" €");
			
			//PanierService panierService = new PanierService();
			
			
			//System.out.println("P :" + panierService.creerPanier(new Panier(0,6,"23/12/2022 12:13:00")));
	
			
		}catch (Exception e) {
			System.out.println("Erreur : " + e.getMessage());
		}

	}
}
