package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@WebServlet("/OnlineAPI")
public class OnlineAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	online AppObj = new online();
	
    public OnlineAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int PatientID =Integer.parseInt(request.getParameter("apppid"));
		int DoctorId = Integer.parseInt(request.getParameter("appdid"));
		int HospitalID =Integer.parseInt(request.getParameter("apphid"));		
		
		
		System.out.println(PatientID);
		System.out.println(DoctorId);
		System.out.println(HospitalID);
		
		String output = AppObj.addAppointment(
				request.getParameter("appDate"),
				request.getParameter("appTime"),
				PatientID,
				DoctorId,
				HospitalID);
		
		System.out.println("output "+output);
		response.getWriter().write(output);
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request); 
		
		String appid = paras.get("hidAppIDSave").toString();
		String date = paras.get("appDate").toString();
		String time = paras.get("appTime").toString();
		
		System.out.println(appid);
		System.out.println(date);
		System.out.println(time);
		
		
		String output = AppObj.UpdateAppointment(
				
				date,
				time,
				appid); 
		
		System.out.println(output);
		
		response.getWriter().write(output);
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		
		String id = paras.get("AppID").toString();
		System.out.println(id);
		
		String output = AppObj.DeleteAppointment(id); 
				
		response.getWriter().write(output);
		System.out.println("delete output"+output);
	}
	
	private static Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		
		try
		{
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ?
					scanner.useDelimiter("\\A").next() : "";
					scanner.close();
					String[] params = queryString.split("&");
					for (String param : params)
					{ 
						String[] p = param.split("=");
						map.put(p[0], p[1]);
					}
		}
		catch (Exception e)
		{
		}
		
		return map;
	}


}
