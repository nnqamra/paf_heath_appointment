package com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;


public class online {
	
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testapmnt", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String addAppointment(String date, String time, int pid, int did, int hid) {

		String output = "";
		
		try{
			Connection con  = connect();
			if (con == null) {
				
				return "Error while connecting to the database for inserting.";
			}

			String addAppQuery = " insert into appointment (`apmnt_id`,`date`,`time`,`patient_id`,`doctor_id`,`hospital_id`)"
					+ "values(NULL, ?, ?, ?, ?, ?)";

			PreparedStatement pstmnt = con.prepareStatement(addAppQuery);

			pstmnt.setInt(1, 0);
			pstmnt.setString(1, date);
			pstmnt.setString(2, time);
			//pstmnt.setString(4, desc);
			pstmnt.setInt(3, pid);
			pstmnt.setInt(4, did);
			pstmnt.setInt(5, hid);

			pstmnt.execute();
			
			System.out.println(pid);
			System.out.println(did);
			System.out.println(hid);
			con.close();
			
			String newAppointment = ReadAppointment();
			output = "{\"status\":\"success\", \"data\": \"" + newAppointment + "\"}";
			//return "Appointment added successfully";

		} catch (SQLException e) {
			output = "{\"status\":\"error\", \"data\":" + " \"Error while inserting the Appointment.\"}";
			//return "Error occured during adding an Appointment\n" + e.getMessage();
		}

		return output; 
	}

	public String ReadAppointment() {
		
		String output = "";

		try{
			Connection con  = connect();
			if (con == null) {

				return "Error while connecting to the database for reading.";
			}

			//LocalDate prvPaymentDate = null;
			String readQuery = "select * from appointment";

			PreparedStatement pstmt = con.prepareStatement(readQuery);

			output = "<table border=\"1\"><tr><th>Appointment ID</th>" + "<th>Appointment Date</th> "
					+ "<th>Appointment Time</th>" + "<th>Patient ID</th>"
					+ "<th>Doctor ID</th>" + "<th>Hospital ID</th>" + "<th>Update</th><th>Remove</th></tr>";

			ResultSet rs = pstmt.executeQuery(readQuery);

			while (rs.next()) {
				//int AppID = rs.getInt("apmnt_id");
				String AppID = Integer.toString(rs.getInt("apmnt_id"));
				//Date date = rs.getDate("date");
				String date = rs.getString("date");
				String time = rs.getString("time");
				//String desc = rs.getString("apmnt_desc");
				//int pid = rs.getInt("patient_id");
				String pid = Integer.toString(rs.getInt("patient_id"));
				//int did = rs.getInt("doctor_id");
				String did = Integer.toString(rs.getInt("doctor_id"));
				//int hid = rs.getInt("hospital_id");
				String hid = Integer.toString(rs.getInt("hospital_id"));

				
				output += "<tr><td><input id='hidAppIDUpdate'" + "name='hidAppIDUpdate'" + "type='hidden' value='"
						+ AppID + "'>" + AppID + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + time + "</td>";
				//output += "<td>" + desc + "</td>";
				output += "<td>" + pid + "</td>";
				output += "<td>" + did + "</td>";
				output += "<td>" + hid + "</td>";

				output += "<td><input name='btnUpdate'" + "type='button' value='Update'"
						+ "class='btnUpdate btn btn-secondary'></td>" + "<td><input name='btnRemove'"
						+ "type='button' value='Remove'" + "class='btnRemove btn btn-danger'" + "data-Appid='" + AppID
						+ "'>" + "</td></tr>";

			}

			output += "</table>";
			return output;
		} 
		catch (SQLException e) {
			e.printStackTrace();
			
			output = "{\"status\":\"error\", \"data\":" + " \"Error occured during retrieving data\"}";
			//return "Error occured during retrieving data";
		}
		return output; 
	}

	public String UpdateAppointment(String date, String time, String AppID) {
		
		String output = "";

		try {
			Connection con  = connect();
			if (con == null) {
				
				return "Error while connecting to the database for updating.";
			}

			String updateAppQuery = "UPDATE appointment SET date=?,time=? WHERE apmnt_id=?";
			PreparedStatement pstmnt = con.prepareStatement(updateAppQuery);
			pstmnt.setString(1, date);
			pstmnt.setString(2, time);
			//pstmnt.setString(3, desc);
			//pstmnt.setInt(3, AppID);
			pstmnt.setInt(3, Integer.parseInt(AppID)); 

			System.out.println(pstmnt.toString());
			pstmnt.execute();
			con.close();
			
			String newAppointment = ReadAppointment();
			output = "{\"status\":\"success\", \"data\": \"" + newAppointment + "\"}";
			return "Appointment Updated successfully";

		} catch (SQLException e) {
			output = "{\"status\":\"error\", \"data\":" + " \"Error while updating the Appointment.\"}";
			return "Error occured during Updating an Appointment\n" + e.getMessage();
		}
		//return output; 

	}

	public String DeleteAppointment(String AppID) {
		
		String output = "";

		try{
			Connection con  = connect();
			if (con == null) {
				
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String Deletequery = "delete from appointment where apmnt_id=?";

			PreparedStatement pstmnt = con.prepareStatement(Deletequery);
			//pstmnt.setInt(1, AppID);
			pstmnt.setInt(1,Integer.parseInt(AppID)); 
			
			pstmnt.execute();
			con.close();
			
			String newAppointment = ReadAppointment();
			output = "{\"status\":\"success\", \"data\": \"" + newAppointment + "\"}";
			//return "Appointment Deleted successfully";

		} catch (SQLException e) {

			output = "{\"status\":\"error\", \"data\":" + " \"Error while deleting the Appointment.\"}";
			//return "Error occurrd during Deleting\n" + e.getMessage();
		}
		return output; 
	}

}
