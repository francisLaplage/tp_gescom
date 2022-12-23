package fr.francis.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import fr.francis.metier.modeles.Categorie;
import fr.francis.metier.modeles.Produit;
import fr.francis.metier.modeles.User;

public class UserDao implements InterfaceCRUD<User> {
	
	private Connection conn ;
	private Statement stm;
	private ResultSet rs;
	private PreparedStatement ps;
	
	public UserDao() {
		this.conn = ConnexionBD.getObjetDeConnexion();
	}

	public User authentification(User user) throws Exception{	
		User userFind = null;	
		this.stm = this.conn.createStatement();
	
		this.ps = this.conn.prepareStatement("SELECT * FROM user WHERE login = ? AND password = ?");
		this.ps.setString(1, user.getLogin());
		this.ps.setString(2, user.getPassword());	
		this.rs = this.ps.executeQuery();	
		
		while(this.rs.next()) {
			 userFind = new User(this.rs.getInt("idUser"),this.rs.getString("nomUser"),this.rs.getString("login"),this.rs.getString("password"),this.rs.getString("role"));
		}
	return userFind;
	}

	@Override
	public List<User> findAll() throws Exception {		
		List<User> listeDesUsers = new ArrayList();
		this.stm = this.conn.createStatement();
		this.rs = stm.executeQuery("SELECT * FROM user");
		while(this.rs.next()) {
			 listeDesUsers.add(new User(
							 this.rs.getInt("idUser"),
							 this.rs.getString("nomUser"),
							 this.rs.getString("login"),
							this.rs.getString("role")
					 		));
		}
		return listeDesUsers;
	}

	@Override
	public User findOneById(User t) throws Exception {
		User user=null;
		this.stm = this.conn.createStatement();
		this.rs = stm.executeQuery("SELECT * FROM user WHERE idUser=" + t.getIdUser());
		while(this.rs.next()) {
			 user = new User(this.rs.getInt("idUser"), this.rs.getString("nomUser"),this.rs.getString("login"),this.rs.getString("role"));
		}
		return user;
	}
	@Override
	public void insert(User t) throws Exception {
		this.ps = this.conn.prepareStatement("INSERT INTO user VALUES(default,?,?,?,?)");
		this.ps.setString(1, t.getNomUser());
		this.ps.setString(2, t.getLogin());
		this.ps.setString(3, t.getPassword());
		this.ps.setString(4, t.getRole());
		this.ps.executeUpdate();		
	}

	@Override
	public void update(User t) throws Exception {
		this.ps = this.conn.prepareStatement("UPDATE user SET  nomUser =?, login =?, password=?,role=? WHERE idUser = ?");
		this.ps.setString(1, t.getNomUser());
		this.ps.setString(2, t.getLogin());
		this.ps.setString(3, t.getPassword());
		this.ps.setString(4, t.getRole());
		this.ps.setInt(5, t.getIdUser());
		this.ps.executeUpdate();	
		
	}
	public void reInitPassord(User t) throws Exception {
		this.ps = this.conn.prepareStatement("UPDATE user SET password=? WHERE login = ?");
		this.ps.setString(1, t.getPassword());
		this.ps.setString(2, t.getLogin());
		this.ps.executeUpdate();	
		
	}
	@Override
	public void delete(User t) throws Exception {
		this.ps = this.conn.prepareStatement("DELETE FROM user WHERE idUser = ?");
		this.ps.setInt(1, t.getIdUser());
		this.ps.executeUpdate();	
		
	}
	@Override
	public List<User> rechercheParMC(String mc) throws Exception {
		List<User> listeDesUsers = new ArrayList();
		this.ps = this.conn.prepareStatement("SELECT * FROM produit WHERE nomUser LIKE ?");
		this.ps.setString(1,mc);
		this.rs = this.ps.executeQuery();	
		while(this.rs.next()) {
			 listeDesUsers.add(new User(
							 this.rs.getInt("idUser"),
							 this.rs.getString("nomUser"),
							 this.rs.getString("login"),
							this.rs.getString("role")
					 		));
		}
		return listeDesUsers;
	}
}
