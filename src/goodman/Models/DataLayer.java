package goodman.Models;

import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataLayer {
	String url;
	String userName;
	String password;
	String dataBaseName;
	String connectionString;
	Connection con;
	
	public DataLayer(String url,String userName, String password,String dataBaseName){
		this.url=url.toString();
		this.userName=userName.toString();
		this.password = password.toString();
		this.dataBaseName = dataBaseName.toString();
		this.connectionString = new String(url+"/"+dataBaseName);
		
	}
	public DataLayer(){
		this.url= "jdbc:mysql://finalprojectdb.ctsvfo0gnwiz.us-west-2.rds.amazonaws.com:3306";
		this.userName="shahar";
		this.dataBaseName="finalprojectdb";
		this.password="finalprojectdb";
		this.connectionString = new String(url+"/"+dataBaseName);
	}
	
	public boolean connect(){
		try
        {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionString,userName,password);	
			return true;
        }
        catch(Exception ex){
        	System.out.print("connect - " + ex.getMessage());
        	return false;
        }
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public User getUser(String email){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM Users where Email='"+email+"'";
			ResultSet rs = stmt.executeQuery(query);
			User user = null;
			if(rs.next()){
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String password = rs.getString("Password");
				user = new User(email,firstName,lastName,password);
				}
			return user;
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
	
	public Customer[] getCustomers(){
		try{
			Statement stmt = con.createStatement();
			String query = "SELECT FirstName,LastName,CustomerId,PhoneNumber,Email FROM Customers";
			ResultSet rs = stmt.executeQuery(query);
			List<Customer> customers = new ArrayList<Customer>();
			while(rs.next()){
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String id = rs.getString("CustomerId");
				String phone = rs.getString("PhoneNumber");
				String email = rs.getString("Email");
				Customer customer = new Customer(id,firstName,lastName,email,phone);
				customers.add(customer);				
				}			
			return (Customer[])customers.toArray(new Customer[customers.size()]);
		}
		catch(Exception ex){
			System.out.print(ex.getMessage());
			return null;
		}
	}
}
