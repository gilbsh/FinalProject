package goodman;

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
		this.url= "jdbc:mysql://sql3.freemysqlhosting.net:3306";
		this.userName="sql369467";
		this.dataBaseName="sql369467";
		this.password="eY5%hG8*";
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
			System.out.print("coudn't execute query - "+ex.getMessage());
			return null;
		}
	}

}
