package fr.francis.metier.modeles;

import java.io.Serializable;
import java.sql.Date;


public class Panier implements Serializable{
	private int idPanier;
	private int idUser;
	private String  date;
	public Panier() {
		super();
	}
	public Panier(int idPanier, int idUser, String date) {
		super();
		this.idPanier = idPanier;
		this.idUser = idUser;
		this.date = date;
	}
	public int getIdPanier() {
		return idPanier;
	}
	public void setIdPanier(int idPanier) {
		this.idPanier = idPanier;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Panier [idPanier=" + idPanier + ", idUser=" + idUser + ", date=" + date + "]";
	}
}
