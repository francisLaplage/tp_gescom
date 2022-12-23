package fr.francis.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.francis.metier.modeles.Categorie;

public class CategorieDao implements InterfaceCRUD<Categorie> {
	private Connection conn;
	private Statement stm ;
	private ResultSet rs;
	private PreparedStatement ps;
	
	public CategorieDao() {
		this.conn = ConnexionBD.getObjetDeConnexion();
	}

	@Override
	public List<Categorie> findAll() throws Exception {
		//1-	Cr�ation de liste des Cat�gories
			List<Categorie> listeDesCategories = new ArrayList();
		//2-	Initialisation de l'objet statement pour la gestion de requ�tes simples
			this.stm = this.conn.createStatement();
		//3-	Ex�cution de la requ�te
			this.rs = stm.executeQuery("SELECT * FROM categorie");
		//4-	Parcourir l'objet rs pour r�cup�rer l'ensemble des enregistrement
			while(this.rs.next()) {
				 listeDesCategories.add(new Categorie(this.rs.getInt("id"), this.rs.getString("nom")));
			}
		return listeDesCategories;
	}

	@Override
	public Categorie findOneById(Categorie t) throws Exception {
		Categorie categorie = new Categorie();
		
		this.stm = this.conn.createStatement();
		this.rs = stm.executeQuery("SELECT * FROM categorie WHERE id="+ t.getIdCat());

		while(this.rs.next()) {
			 categorie.setIdCat(rs.getInt("id"));
			 categorie.setNomCat(rs.getString("nom"));
		}
		return categorie;
	}

	@Override
	public void insert(Categorie t) throws Exception {
		//1- Pr�paration de la requ�te
			this.ps = this.conn.prepareStatement("INSERT INTO categorie VALUES(default,?)");
		//2-	On injecte les param�tres dans la requ�te
			this.ps.setString(1, t.getNomCat());
		//3-	On ex�cute la requ�te
			this.ps.executeUpdate();	
	}

	@Override
	public void update(Categorie t) throws Exception {
	//1- Pr�paration de la requ�te
		this.ps = this.conn.prepareStatement("UPDATE categorie SET nom = ? WHERE id = ?");
	//2-	On injecte les param�tres dans la requ�te
		this.ps.setString(1, t.getNomCat());
		this.ps.setInt(2, t.getIdCat());
	//3-	On ex�cute la requ�te
		this.ps.executeUpdate();		
		
	}

	@Override
	public void delete(Categorie t) throws Exception {
	//1- Pr�paration de la requ�te
		this.ps = this.conn.prepareStatement("DELETE FROM categorie WHERE id = ?");
	//2-	On injecte les param�tres dans la requ�te
		this.ps.setInt(1, t.getIdCat());
	//3-	On ex�cute la requ�te
		this.ps.executeUpdate();	
		
	}

	@Override
	public List<Categorie> rechercheParMC(String mc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
