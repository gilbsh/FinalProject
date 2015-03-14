package goodman.Models;

public class User extends Person {
	String email;
	private String password;
	
	public User(String email,String firstName,String lastName, String password){
		
		super(firstName,lastName,email);
		this.password = new String(password);
	}
	
	public User(){
		super();
		this.password = new String();		
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
