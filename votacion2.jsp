<html>
	<head>
		<title>PlebiscitoUN</title>
        <%@ page pageEncoding= "UTF-8" %>

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

		             <script src = "holahola.js"> </script>
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>

					<section  class="box special features" >
					<div class="features-row">
					<section>
					<div id = "votacion" style = "display : inline">
						
							<h3><br>¿Está usted de acuerdo con el acuerdo que se realizó en la habana?</h3>

							<form >
							<!--  action="votacion.jsp" method="post"-->
								<input type="Button" class="special button" id ="elijosi" title="Sí" value="Si" onclick = "si();" style ="display: inline">
								<input type="Button" id ="elijono" title="No" value="No" onclick = "no();" style ="display : inline" >

							</form>
							</div>
					</section>
					
				    <section>
						<div id = "confirmacion" style = "display : none">
							<h3> <br>¿Está usted seguro de su elección?</h3>

							<form action="votacion.jsp" method="post" >
							<!--  action="votacion.jsp" method="post"-->
                            <input type ="text" id = "elijo" title = "elijo" name="elijo" value="" style = "display : none">
							<input type="button" id ="confirmono" title="No" value="No" onclick = "confirmarno();" style ="display : inline">
							<input type="Submit" id ="confirmosi" value = "Si" >
	
							</form>
							</div>
					</section>
					<section>
								<%@ page import = "java.sql.*"%>
								<%

                                String cedu = (String) session.getAttribute("TheCedu");

					            Class.forName("com.mysql.jdbc.Driver");
					            Connection conexion = 
					                    DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
					            Statement instruccion = conexion.createStatement();					          	          
					            ResultSet tabla = instruccion.executeQuery("SELECT puestovot.idpuesto, puestovot.NombrePuesto, \n" +
                                                        "puestovot.Ciudad, registro.dpto, registro.nomyapell, registro.cedula\n" +
                                                        "from puestovot, registro where numpuesto=idpuesto and cedula='" +cedu+"'");
					            
					            while(tabla.next()){
			 		           	out.println("<h3 >   Datos Votante</h3>");
				            	out.println("<h4 align='right'><b> #Puesto: </b>"+tabla.getString(1)+"");
				            	out.println("<h4 align='right'><b>Nombre Puesto: </b>"+tabla.getString(2)+"");
				            	out.println("<h4 align='right'><b>Ciudad: </b>"+tabla.getString(3)+"");
				            	out.println("<h4 align='right'><b>Departamento: </b>"+tabla.getString(4)+"");
				            	out.println("<br><h4 align='right'><b>Nombre Votante: </b>"+tabla.getString(5)+"");
				            	out.println("<h4 align='right'><b>Cédula Votante: </b>"+tabla.getString(6)+"");
      	    	
				            	};                           
								%>

					</section>

					</section>																	
				
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