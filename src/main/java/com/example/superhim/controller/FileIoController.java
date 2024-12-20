//package com.example.superhim.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.time.LocalDateTime;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.context.ApplicationContext;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.example.superhim.GetApplicationContext;
//import com.example.superhim.dao.DimageDao;
//import com.example.superhim.dao.ProductDao;
//import com.example.superhim.fileio.ProductIO;
//import com.example.superhim.fileio.ThreeDimageIO;
//import com.example.superhim.pojo.DimagePojo;
//import com.example.superhim.pojo.ProductPojo;
//@Controller
//@MultipartConfig
//public class FileIoController {
//	
//	@PostMapping("3dimage")
//	public static void addproduct(HttpServletRequest request,HttpServletResponse response,@RequestParam("3dimage")MultipartFile D,@RequestParam("productimage")MultipartFile f) throws IOException, ServletException
//	{
//		//getting the detail from the form and store it.
//		String producttital = request.getParameter("producttital");
//		String productdescription = request.getParameter("productdescription");
//		String crossprice = request.getParameter("crossprice");
//		String mainprice = request.getParameter("mainprice");
//		String availability = request.getParameter("availability");
//		String department = request.getParameter("department");
//		String category = request.getParameter("category").trim();
////		System.out.println("**"+category+"**");
//		
//		
//		//getting the file name
////Part part = request.getPart("productimage");
//
//		//getting the local date time and adding to file to make unique name 
//		String datetimeString = LocalDateTime.now().toString();
////		String newfileString = part.getSubmittedFileName();
//		String ThdImage = D.getOriginalFilename();
//		String threedimage = datetimeString+ThdImage; 
//		
//		String newfileString = f.getOriginalFilename();
//		String newfileString2 = datetimeString+newfileString;
//		
//		//split the name by (:) because in window it is recognized as Change directory command
//		String[] split = newfileString2.split(":");
//		newfileString = split[0]+split[1]+split[2];
//		
//		String[] DimgSpt = threedimage.split(":");
//		ThdImage = DimgSpt[0]+DimgSpt[1]+DimgSpt[2];
//		
//		ApplicationContext	Ac= GetApplicationContext.getApplicationContext();
//						ProductDao bean = Ac.getBean(ProductDao.class);
//		 ProductPojo savePojo = bean.save(new ProductPojo(producttital, productdescription, crossprice, mainprice,
//								availability, department, category, newfileString, datetimeString, ThdImage) );
////		DimageDao bean = Ac.getBean(DimageDao.class); 
////		DimagePojo savePojo = bean.save(new DimagePojo(producttital, productdescription, 
////				crossprice, mainprice, availability, department, category, newfileString, ThdImage, datetimeString));
//	
//		//creating the session 
//		HttpSession session = request.getSession();
//		if (savePojo != null) {
//			
//			String realpath = request.getServletContext().getRealPath("myown/imagefile")+File.separator+newfileString;
//			String reString = new ProductIO().writeProduct(realpath, newfileString, f);
//			
//			String realPathString = request.getServletContext().getRealPath("myown/3dimage")+File.separator+ThdImage;
//			String deString  = new ThreeDimageIO().write3dProduct(realPathString, ThdImage, D);
//			
//			if (deString.equals("saved") && reString.equals("saved")) {
//				response.sendRedirect("1addproduct.jsp");
//				session.setAttribute("msg", "product added successfully");	
//			}
//			else {
//				response.sendRedirect("1addproduct.jsp");
//				session.setAttribute("msg", "product added unsuccessfully");		
//			}
//		}
//	}
//}
