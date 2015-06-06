package General;

import goodman.Models.Location;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

public class GeneralResource {
	
	public static String convertObjectToJson(Object object) throws JsonProcessingException{
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(Include.NON_NULL);	
		ObjectWriter ow = objectMapper.writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(object);
		return json;		
	}
	
	public static String[] getDaysBackArray(Date date,int number){
		String[] dateArray = new String[number+1];
		dateArray[0]="x";
		Date tempDate=date;
		for(int i=1;i<number+1;i++){
			Calendar cal = Calendar.getInstance();
			cal.setTime(tempDate);
			cal.add(Calendar.DATE, -i+1);
			dateArray[number-i+1] = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		}
		return dateArray;
	}
	
	public static String[] getNumbersArray(int number,String firstCell){
		String[] hours = new String[number+1];
		hours[0]=firstCell;
		for(int i=1;i<number+1;i++){
			hours[i]=String.valueOf(i);
		}
		return hours;
	}
	
	public static int getDateLocation(Date date,String[] dates){
		for(int i=1;i<=dates.length;i++){
			if(java.sql.Date.valueOf(dates[i]).equals(date))
				return i;
		}
		return -1;
	}
	
	public static Location getLocation(String latlng){
		Location location = new Location();
		Pattern p = Pattern.compile("\\d+\\.\\d+");
		Matcher m = p.matcher(latlng);
		m.find();
		location.setLat(m.group());
		m.find();
		location.setLon(m.group());
		return location;
	}
}
