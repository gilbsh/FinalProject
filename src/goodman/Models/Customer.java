package goodman.Models;

public class Customer extends Person {
	String id;
	String phone;
	Vehicle[] vehicles;
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Customer(String id, String firstName,String lastName,String email,String phone){
		super(firstName,lastName,email);
		this.id = new String(id);
		this.phone = new String(phone);
	}
	
	public Customer(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Vehicle[] getVehicles() {
		return vehicles;
	}

	public void setVehicles(Vehicle[] vehicles) {
		this.vehicles = vehicles;
	}
}
