package fr.francis.metier.modeles;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int idUser;
	private String nomUser;

	private String login;
	private String password;
	private String role;
	
	public User() {
		super();
	}
	public User(int idUser) {
		super();
		this.idUser = idUser;
	}

	
	public User(String nomUser, String login, String password, String role) {
		super();
		this.nomUser = nomUser;
		this.login = login;
		this.password = password;
		this.role = role;
	}


	public User(String login, String password, String role) {
		super();
		this.login = login;
		this.password = password;
		this.role = role;
	}


	public User(String login, String password) {
		this.login = login;
		this.password = password;
	}


	public User(int idUser, String nomUser, String login, String password, String role) {
		this.idUser = idUser;
		this.nomUser = nomUser;
		this.login = login;
		this.password = password;
		this.role = role;
	}
	

	public User(int idUser, String nomUser, String login, String role) {
		super();
		this.idUser = idUser;
		this.nomUser = nomUser;
		this.login = login;
		this.role = role;
	}


	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getNomUser() {
		return nomUser;
	}

	public void setNomUser(String nomUser) {
		this.nomUser = nomUser;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "User [idUser=" + idUser + ", nomUser=" + nomUser + ", login=" + login + ", password=" + password
				+ ", role=" + role + "]";
	}
}
