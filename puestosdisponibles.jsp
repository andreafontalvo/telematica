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
							<section>
							<div class="table-wrapper">
							<h2 align="right">Puestos de Votación en su ciudad</h2>
							<!-- <table>
								<tr>
									<th><center><b>#Puesto</center></th>
									<th><center><b>Puesto</center></th>
									<th><center><b>Dirección</center></th>
									<th><center><b>Ciudad</b></center></th>
								</tr> -->
	                            <%@ page import = "java.sql.*"%>
								<%

                                String ciu = request.getParameter("ciudadpuesto");

					            Class.forName("com.mysql.jdbc.Driver");
					            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
					            Statement instruccion = conexion.createStatement();					          	          
					            ResultSet hola = instruccion.executeQuery("SELECT idpuesto, NombrePuesto, Direccion, Ciudad FROM puestovot  WHERE Ciudad='"+ciu+"'");
					            while(hola.next()){
					            out.println("<br><h4>");
					            out.println("<b>#Puesto:</b>");
					            out.println(hola.getString(1));
					            out.println("<b>| Nombre Puesto:</b>");
					            out.println(hola.getString(2));
      					        out.println("<b>| Dirección:</b>");
					            out.println(hola.getString(3));
      					        out.println("<b>| Ciudad:</b>");
					            out.println(hola.getString(4));

				            	// out.println("<tr>");
				            	// out.println("<td><center>"+hola.getString(1)+"</center></td>");
				            	// out.println("<td><center>"+hola.getString(2)+"</center></td>");
				            	// out.println("<td><center>"+hola.getString(3)+"</center></td>");
				            	// out.println("<td><center>"+hola.getString(4)+"</center></td>");
				            	// out.println("</tr>");      	    	
				            	};
                           
								%>
			<!-- 				</table> -->
							</div>

							</section>
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