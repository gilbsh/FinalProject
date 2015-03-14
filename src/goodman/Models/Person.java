package goodman.Models;

public class Person {
	String firstName;
	String lastName;
	String email;
	
	public Person(){
		this.firstName = new String();
		this.lastName = new String();
	}
	
	public Person(String firstName, String lastName, String email){
		this.firstName = new String(firstName);
		this.lastName = new String(lastName);
		this.email = new String(email);
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Override
	public String toString() {
		return firstName + " " + lastName;
	}

}
