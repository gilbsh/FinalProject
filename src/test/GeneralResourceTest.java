package test;

import goodman.Models.Location;

import java.sql.Date;

import org.junit.Test;

import junit.framework.Assert;
import General.GeneralResource;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

public class GeneralResourceTest {
	
	@Test
	public void convertObjectToJsonTest() throws JsonProcessingException{
		
		String testString = GeneralResource.convertObjectToJson("Test String");
		Assert.assertTrue(testString!=null);
	}
	
	@Test
	public void getDaysBackArrayTest(){
		String[] dates= GeneralResource.getDaysBackArray(Date.valueOf("2015-3-12"), 15);
		Assert.assertTrue(dates.length>0);
	}
	
	@Test
	public void getLocationTest(){
		String latlng="Lat, Lng(32.075718,34.78244)";
		Location location = GeneralResource.getLocation(latlng);
		Assert.assertEquals(location.getLat(), "32.075718");
	}
}
