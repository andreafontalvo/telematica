<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Telemática</title>
</head>
<body>
<%@ page import = "java.sql.*"%>

<%

    String cliente=request.getParameter("Nombre");
    String cedula=request.getParameter("Cedula");
    String direccion=request.getParameter("Direccion");
    String ciudad=request.getParameter("Ciudad");
    String sexo=request.getParameter("Sexo");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/andrea_telematica","root","1234");
    Statement st= con.createStatement(); 
    ResultSet rs; 
    int i = st.executeUpdate("insert into clientes values ('"+cliente+"','"+cedula+"','"+direccion+"', '"+ciudad+"','"+sexo+"')"); 

    out.println("Cliente registrado en la base de datos"); 
%>

<br>
<br>
<a href="index.jsp">Inicio</a>
<br>
</body>
</html>