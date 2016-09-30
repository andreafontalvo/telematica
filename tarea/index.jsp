<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Telemática</title>
</head>

<body>

<%@ page import = "java.sql.*"%>
<h2>Genero que mas hizo compras</h2>
<%
 try {
            Class.forName("com.mysql.jdbc.Driver");
            //Crear el objeto de conexion a la base de datos
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/andrea_telematica","root","1234");
            //Crear objeto Statement para realizar queries a la base de datos
            Statement instruccion = conexion.createStatement();

            ResultSet tabla = instruccion.executeQuery("SELECT sexo, sum(Cantidad) as total\n"
                    + "FROM andrea_telematica.compras, andrea_telematica.productos, andrea_telematica.clientes\n "
                    + "WHERE idProducto=Articulo and Cliente=Cedula group by sexo order by total desc limit 1");
                    
            //out.println("Sexo:"+tabla.getString(1)+"Articulos"+tabla.getString(2));
            while(tabla.next())
            //out.println(tabla.getString(1)+"\t"+tabla.getString(2));
            /*out.println("Sexo:"+"\t"+tabla.getString(1)+"\t"+"<br>"+"Articulos:"+"\t"+tabla.getString(2));*/

           	out.println("El género que mas productos compro es " + tabla.getString(1)+ " con un total de " +tabla.getString(2) + " productos");
            conexion.close();
    }

    catch(ClassNotFoundException e){ out.println(e); }
    catch(SQLException e){ out.println(e); }
    catch(Exception e){ out.println(e); }
%>
<br>
<br>
<a href="registro.html">Registrar cliente en base de datos</a>
<br>
</body>
</html>