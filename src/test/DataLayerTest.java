package test;
import junit.framework.Assert;
import goodman.Models.DataLayer;
import goodman.Models.User;
import goodman.Models.Vehicle;

import org.junit.Test;


public class DataLayerTest {
	
	
	@Test
	public void getUserTest(){
		DataLayer dl = new DataLayer();
		dl.connect();
		User actual = dl.getUser("gilbsh@gmail.com");
		dl.close();
		User expected = new User();
		expected.setEmail("gilbsh@gmail.com");
		expected.setFirstName("Gil");
		expected.setLastName("Ben Shalom");
		expected.setPassword("1234");
		Assert.assertEquals(expected, actual);
	}
	
	@Test
	public void getVehiclesTest(){
		DataLayer dl = new DataLayer();
		dl.connect();
		Vehicle[] vehicle = dl.getVehicles();
		Assert.assertTrue(vehicle.length>0);
	}
}
