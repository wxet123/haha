package com.team2.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.team2.model.CreateTraining;

public class CreateTrainingDao {

	// .getConnection("jdbc:mysql://localhost:3306/employees?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
	// "root", "root");
	public static int insertTrainings(CreateTraining createTraining) throws ClassNotFoundException {
		String INSERT_Employees_SQL = "INSERT INTO createtraining"
				+ " (course_id, course_name, description,  date, startTime, endTime, instructor ) VALUES " + " (?, ?, ?, ? , ?, ?, ?);";
				
		int result = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employees?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "Neverwinter132!");

				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_Employees_SQL)) {

			
			
			preparedStatement.setString(1, createTraining.getCourse_id());
			preparedStatement.setString(2, createTraining.getCourse_name());
			preparedStatement.setString(3, createTraining.getDescription());
			preparedStatement.setString(4, createTraining.getDate());
			preparedStatement.setString(5, time(createTraining.getStartTime()));
			preparedStatement.setString(6, time(createTraining.getEndTime()));
			preparedStatement.setString(7, createTraining.getInstructor());

			result = preparedStatement.executeUpdate();
			

		} catch (SQLException e) {
			printSQLException(e);
		}
		return result;

	}

	
	public static boolean isAlreadyAdded(CreateTraining createTraining) throws ClassNotFoundException {
		
		
		
		
		String query = "Select * from createtraining where course_id =? OR course_name =?";
		
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employees?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "Neverwinter132!");

				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, createTraining.getCourse_id());
			preparedStatement.setString(2, createTraining.getCourse_name());	
			
				ResultSet rs = preparedStatement.executeQuery();
				
				while(rs.next()) {
					if(rs.getString("course_id").equals(createTraining.getCourse_id()) || rs.getString("course_name").equals(createTraining.getCourse_name()))
					{
						return true;
					}
				}
		
		
		} catch (SQLException e) {
			printSQLException(e);
		}
		return false;
		
	}
	private static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
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
			int m = Integer.parseInt(minutes);
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

}
