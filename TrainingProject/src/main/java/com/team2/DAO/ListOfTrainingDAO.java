package com.team2.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.team2.model.*;



public class ListOfTrainingDAO {
	

public static Connection getConnection(){  
    Connection con=null;  
    try{  
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/employees?useTimezone=true&serverTimezone=UTC","root","Neverwinter132!");
    }catch(Exception e){System.out.println(e);}
    return con;
}



public static List<ListOfTrainings> getAllRecords() throws ParseException{  
	
	
	

	List<ListOfTrainings> listAll=new ArrayList<ListOfTrainings>();  
	ListOfTrainings u=new ListOfTrainings();
      
    try{  
        Connection con=getConnection();  
        PreparedStatement ps=con.prepareStatement("select * from createtraining");  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
        	
        	Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("date"));  
        	
        	u.setDateNumber(date1.getDate());
        	u.setDayName(dayName(date1.getDay()).toUpperCase());
        	
            u.setCourse_id(rs.getString("course_id"));
            u.setCourse_name(rs.getString("course_name")); 
            u.setDescription(rs.getString("description"));
            u.setDate(rs.getString("date"));
            u.setStartTime((rs.getString("startTime")));
            u.setEndTime((rs.getString("endTime")));
            u.setInstructor(rs.getString("instructor"));
            
            
            
            listAll.add(u);  
            

        }  
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }  
    return listAll;  
} 


public static String time(String strTime) {
	
	String hours = "" ;
	String minutes = "";
	String am_pm = "";
	String output = "";
		for(int i = 0; i < strTime.length() ; i++) {
			
			if(i <= 1) {
				hours += strTime.charAt(i);
			}

			
			if(i >= 3) {
				minutes += strTime.charAt(i);
			}
			
			
		}

		int h = Integer.parseInt(hours);
		if( h >= 13) {
			 hours = "" + (h-12);
			 am_pm = "PM";
		}else {
			if(	h== 0) {
				hours = "12";
				am_pm = "AM";
			}
		}
		output = hours + ":"+ minutes +" " +am_pm;
		return (output);
}
    

public static String dayName(int dateInput) {
	
	String day = "";
	
	
	if(dateInput == 1) {day = "Monday";}

	if(dateInput == 2) {day = "Tuesday";}

	if(dateInput == 3) {day = "Wednesday";}
	if(dateInput == 4) {day = "Thursday";}

	if(dateInput == 5) {day = "Friday";}
	if(dateInput == 6) {day = "Saturday";}
	if(dateInput == 7) {day = "Sunday";}
	return day;
}
public static String month(int dateInput) {
	
	String month = "";
	
	
	if(dateInput == 0) {month = "JAN";}

	if(dateInput == 1) {month = "FEB";}

	if(dateInput == 2) {month = "MAR";}
	if(dateInput == 3) {month = "APR";}

	if(dateInput == 4) {month = "MAY";}
	if(dateInput == 5) {month = "JUN";}
	if(dateInput == 6) {month = "JUL";}
	if(dateInput == 7) {month = "AUG";}
	if(dateInput == 8) {month = "SEP";}
	if(dateInput == 9) {month = "OCT";}
	if(dateInput == 10) {month = "NOV";}
	if(dateInput == 11) {month = "DEC";}
	return month;
}

}
