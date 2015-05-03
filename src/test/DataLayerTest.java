package test;

import java.sql.PreparedStatement;

import junit.framework.Assert;
import goodman.Models.DataLayer;
import goodman.Models.QueryGenerator;
import goodman.Models.RuleAlert;
import goodman.Models.RuleCondition;
import goodman.Models.User;
import goodman.Models.Vehicle;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class DataLayerTest {
	static DataLayer dl;
	
	@BeforeClass
	public static void initDB(){
		dl = new DataLayer();
		dl.connect();
	}
	
	@AfterClass
	public static void closeDB(){
		dl.close();
	}

	@Test
	public void getUserTest() {
		User actual = dl.getUser("gilbsh@gmail.com");
		User expected = new User();
		expected.setEmail("gilbsh@gmail.com");
		expected.setFirstName("Gil");
		expected.setLastName("Ben Shalom");
		expected.setPassword("1234");
		Assert.assertEquals(expected, actual);
	}

	@Test
	public void getVehiclesTest() {
		Vehicle[] vehicle = dl.getVehicles();
		Assert.assertTrue(vehicle.length > 0);
	}

	@Test
	public void editRowTest() {
		PreparedStatement expected = dl.getEditRowStatement("Devices",
				"InitialEngineHours", "1111", "34567", "DeviceId");
		Assert.assertTrue(expected
				.toString()
				.indexOf(
						"UPDATE Devices SET InitialEngineHours='34567' WHERE DeviceId='1111'") != -1);
	}

	
	@Test
	public void getElementByIdTest() {
		PreparedStatement excepted = dl.getElementById("Devices", "DeviceId",
				"1111");
		Assert.assertTrue(excepted.toString().indexOf(
				"SELECT * FROM Devices WHERE DeviceId='1111'") != -1);
	}
	
	
	@Test
	public void getRuleConditionsWithAlertsTest(){
		RuleCondition[] ruleConditions = dl.getRuleConditionsWithAlerts();
		Assert.assertTrue(ruleConditions.length>0);
	}
}
