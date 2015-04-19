package test;
import java.sql.PreparedStatement;

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
	public void editRowTest(){
		DataLayer dl = new DataLayer();
		dl.connect();
		PreparedStatement expected = dl.getEditRowStatement("Devices", "InitialEngineHours", "1111", "34567", "DeviceId");
		Assert.assertTrue(expected.toString().indexOf("UPDATE Devices SET InitialEngineHours='34567' WHERE DeviceId='1111'")!=-1);
	}
}
