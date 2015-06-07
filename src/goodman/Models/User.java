package goodman.Models;

public class User extends Person {
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

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
