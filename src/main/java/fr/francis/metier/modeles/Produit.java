package fr.francis.metier.modeles;

import java.io.Serializable;

public class Produit implements Serializable{
	private int id;
	private String nom;
	private String designation;
	private double prix;
	private int stock;
	private String image_url;
	private Categorie categorie_id;
	
	public Produit() {
		this.categorie_id = new Categorie();
	}
	
	public Produit(int id) {
		this.id = id;
		this.categorie_id = new Categorie();
	}

	public Produit(int id,String designation, String nom, double prix, int stock, String image_url, Categorie categorie_id) {
		super();
		this.id = id;
		this.nom = nom;
		this.designation = designation;
		this.prix = prix;
		this.stock = stock;
		this.image_url = image_url;
		this.categorie_id = categorie_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	
	public Categorie getCategorie_id() {
		return categorie_id;
	}
	public void setCategorie_id(Categorie categorie_id) {
		this.categorie_id = categorie_id;
	}
	
	
	@Override
	public String toString() {
		return "Produit [id=" + id + ", nom=" + nom + ", designation=" + designation + ", prix=" + prix + ", stock="
				+ stock + ", image_url=" + image_url + ", categorie_id=" + categorie_id + "]";
	}

	
	
	
}
