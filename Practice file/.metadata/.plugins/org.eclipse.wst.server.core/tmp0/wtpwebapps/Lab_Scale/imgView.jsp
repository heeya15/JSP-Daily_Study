<%@ page contentType="images/jpg"%>
<%@ page import="java.util.*,java.io.*"%>
<%
	//parameter을 받는 부분
	String type = request.getParameter("id");

	BufferedInputStream bis = null;
	BufferedOutputStream bos = null;

	String imagePath = "C:\\lab-scale\\image\\";

	imagePath = imagePath + "1.jpg";
	System.out.println(imagePath);
	//10주차.jpg

	File file = new File(imagePath);
	int size = (int) file.length();

	out.clear();
	bos = new BufferedOutputStream(response.getOutputStream());
	byte b[] = new byte[2048];
	int read = 0;
	if (size > 0 && file.isFile()) {
		bis = new BufferedInputStream(new FileInputStream(file));
		while ((read = bis.read(b)) != -1) {
			bos.write(b, 0, read);
		}
	}
	bos.close();
%>