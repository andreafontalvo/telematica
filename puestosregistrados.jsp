<html>
	<head>
		<title>PlebiscitoUN</title>
		<%@page contentType="text/html"%> 
        <%@page pageEncoding="UTF-8"%> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="landing">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
					<h1><a href="index.html">Plebiscito</a>UN</h1>
					<nav id="nav">
						<ul>
							<li><a href="index.html" class="button">Inicio</a></li>
							<li>
								<a href="#" class="icon fa-angle-down" class="button">Registrar</a>
								<ul>
										<li><a href="registropuesto.html">Puesto de Votación</a></li>
										<li><a href="admincedula.html">Cédula</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
					<h2>PlebiscitoUN</h2>
					<p>Registra tu puesto de votación, cédula y ¡VOTA!</p>
					<ul class="actions">
				
						<li><a href= "votar.html" class="button special">VOTAR</a></li>
					
						<li><a href="estadisticas.jsp" class="button">Estadísticas</a></li>
					</ul>
				</section>

			<!-- Main -->
				<section id="main" class="container">	
					<section class="box special features">
					<div class="features-row">
						<section>					
							<h2 align="right"> Puestos de Votación</h2>
							<p align="justify">Los puestos de votación registrados en el sistema son los mostrados en la siguiente tabla; si se desea modificar o eliminar algun puesto de votación, digite el numero de puesto a eliminar del sistema.</p>
						</section>

						<section>
							<form action="eliminarfila.jsp" method="post">	
							<center><br><br><br>
									<div class="6u 12u(mobilep)">
							       		 <input type="number" name="eliminar" placeholder=" #Puesto" class="button alt fit small" />
							        </div>				
							        <br>		
									<div class="6u 12u(mobilep)">
										<input type="submit" name="Eliminarfil" value="Eliminar Puesto" class="button special fit small"/>
									</div>
									</center>
							</form>
						</section>
						</div>
				</section>

				<section class="box special features">
							<table>
								<tr>
									<th><center><b>#Puesto</center></th>
									<th><center><b>Puesto</center></th>
									<th><center><b>Dirección</center></th>
									<th><center><b>Ciudad</b></center></th>
									<th><center><b>Acción</b></center></th>
								</tr>
	                            <%@ page import = "java.sql.*"%>
								<%
					            Class.forName("com.mysql.jdbc.Driver");
					            Connection conexion = 
					                    DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
					            Statement instruccion = conexion.createStatement();					          	          
					            ResultSet tabla = instruccion.executeQuery("select * from puestovot");
					            
					            while(tabla.next()){
				            	out.println("<tr>");
				            	out.println("<td><center>"+tabla.getString(1)+"</center></td>");
				            	out.println("<td><center>"+tabla.getString(2)+"</center></td>");
				            	out.println("<td><center>"+tabla.getString(3)+"</center></td>");
				            	out.println("<td><center>"+tabla.getString(4)+"</center></td>");
				            	out.println("</tr>");      	    	
				            	};
                           
								%>
							</table>
							</div>
				</section>

			<!-- Footer -->
				<footer id="footer">
					<ul class="copyright">
						<li>Telemática. Desarrollado por Andrea Fontalvo y Catherine Diaz</li>
						<li>Universidad del Norte. 2016</li>
					</ul>
				</footer>
		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollgress.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>