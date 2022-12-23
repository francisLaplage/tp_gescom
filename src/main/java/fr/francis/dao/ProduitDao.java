package fr.francis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.Produit;

public class ProduitDao implements InterfaceCRUD<Produit>{
	private Connection conn;
	private Statement stm ;
	private ResultSet rs;
	private PreparedStatement ps;
	
	

	public ProduitDao() {
		this.conn = ConnexionBD.getObjetDeConnexion();
	}

	@Override
	public List<Produit> findAll() throws Exception {
	//1-	Création de liste des Catégories
		List<Produit> listeDeProduits = new ArrayList();
	//2-	Initialisation de l'objet statement pour la gestion de requêtes simples
		this.stm = this.conn.createStatement();
	//3-	Exécution de la requête
		this.rs = stm.executeQuery("SELECT * FROM produit"
				                 + "	INNER JOIN categorie "
				                  + "    	ON produit.categorie_id = categorie.id");
	//4-	Parcourir l'objet rs pour récupérer l'ensemble des enregistrement
		while(this.rs.next()) {
			 listeDeProduits.add(new Produit(this.rs.getInt(1),this.rs.getString(2),this.rs.getString(3),
					 this.rs.getDouble(4),this.rs.getInt(5),this.rs.getString(6),
					 new Categorie(this.rs.getInt(7),this.rs.getString(9))));
		}
	return listeDeProduits;
	}

	@Override
	public Produit findOneById(Produit t) throws Exception {
		//1-	Création de liste des Catégories
			Produit prod = null;
	//2-	Initialisation de l'objet statement pour la gestion de requêtes simples
		this.stm = this.conn.createStatement();
	//3-	Exécution de la requête
		this.rs = stm.executeQuery("SELECT * FROM produit"
				                 + "	INNER JOIN categorie "
				                  + "    	ON produit.categorie_id = categorie.id"
				                  + "					WHERE produit.id=" + t.getId());
	//4-	Parcourir l'objet rs pour récupérer l'ensemble des enregistrement
		while(this.rs.next()) {
			prod = new Produit(this.rs.getInt(1),this.rs.getString(2),this.rs.getString(3),
					 this.rs.getDouble(4),this.rs.getInt(5),this.rs.getString(6),
					 new Categorie(this.rs.getInt(7),this.rs.getString(9)));
		}
		return prod;
	}

	@Override
	public void insert(Produit t) throws Exception {
	//1- Préparation de la requête
		this.ps = this.conn.prepareStatement("INSERT INTO produit VALUES(default,?,?,?,?,?,?)");
	//2-	On injecte les paramètres dans la requête
		this.ps.setString(1, t.getDesignation());
		this.ps.setString(2, t.getNom());
		this.ps.setDouble(3, t.getPrix());
		this.ps.setInt(4, t.getStock());
		this.ps.setString(5, t.getImage_url());
		this.ps.setInt(6, t.getCategorie_id().getIdCat());
	//3-	On exécute la requête
		this.ps.executeUpdate();	
	}

	@Override
	public void update(Produit t) throws Exception {
		//1- Préparation de la requête
		this.ps = this.conn.prepareStatement("UPDATE produit SET designation=?,"
				+ "nom=?,prix=?,stock=?,image_url=? ,categorie_id=? WHERE id = ? ");
	//2-	On injecte les paramètres dans la requête
		this.ps.setString(1, t.getDesignation());
		this.ps.setString(2, t.getNom());
		this.ps.setDouble(3, t.getPrix());
		this.ps.setInt(4, t.getStock());
		this.ps.setString(5, t.getImage_url());
		this.ps.setInt(6, t.getCategorie_id().getIdCat());
		this.ps.setInt(7, t.getId());
	//3-	On exécute la requête
		this.ps.executeUpdate();	
		
	}

	@Override
	public void delete(Produit t) throws Exception {
		//1- Préparation de la requête
		this.ps = this.conn.prepareStatement("DELETE FROM produit WHERE id = ?");
	//2-	On injecte les paramètres dans la requête
		this.ps.setInt(1, t.getId());
	//3-	On exécute la requête
		this.ps.executeUpdate();
		
	}

	@Override
	public List<Produit> rechercheParMC(String mc) throws Exception {
		//1-	Création de liste des Catégories
		List<Produit> listeDeProduits = new ArrayList();
	//2-	Initialisation de l'objet statement pour la gestion de requêtes simples
		this.stm = this.conn.createStatement();
	//3-	Exécution de la requête
		this.ps = this.conn.prepareStatement("SELECT * FROM produit"
				                 + "	INNER JOIN categorie "
				                  + "    	ON produit.categorie_id = categorie.id"
				                  + "           WHERE produit.nom like ? OR produit.designation like ? ");
		this.ps.setString(1,mc);
		this.ps.setString(2,mc);
	//3-	On exécute la requête
		this.rs = this.ps.executeQuery();
	//4-	Parcourir l'objet rs pour récupérer l'ensemble des enregistrement
		while(this.rs.next()) {
			 listeDeProduits.add(new Produit(this.rs.getInt(1),this.rs.getString(2),this.rs.getString(3),
					 this.rs.getDouble(4),this.rs.getInt(5),this.rs.getString(6),
					 new Categorie(this.rs.getInt(7),this.rs.getString(9))));
		}
	return listeDeProduits;
	}
	
	

}
