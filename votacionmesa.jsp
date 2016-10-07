<html>
    <head>
        <title>PlebiscitoUN</title>
        <%@ page pageEncoding= "UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <script src="chartjs/jquery-2.1.4.min.js"></script>
        <script src="chartjs/Chart.js"></script>
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
<h3>Los siguientes corresponden a las votaciones realizadas en las mesas registradas seleccionadas.</h3>
                    </section>

                    <section>                
                    <h3>Datos votación puesto seleccionado</h3>
                    <%@ page import = "java.sql.*"%>
                    <%
                    String puesto = request.getParameter("mesa");
                    int numsi=0;
                    int numno=0;
                    int numvot=0;
                                        
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
                    Statement instruccion= con.createStatement();
                    ResultSet dato = instruccion.executeQuery("SELECT count(idmesa) FROM votarmesa WHERE voto='si' and idmesa='"+puesto+"'");   

                                    while (dato.next()){
                                    out.println("<h4>En el puesto #");
                                    out.println(""+puesto+"");
                                    out.println(" el <b>SI</b> lleva");
                                    out.println(dato.getString(1));
                                    out.println(" votos");

                                    }  

                    ResultSet dato2 = instruccion.executeQuery("SELECT count(idmesa) FROM votarmesa WHERE voto='no' and idmesa='"+puesto+"'");   

                            while (dato2.next()){

                            out.println(" y el <b>NO</b> lleva");
                            out.println(dato2.getString(1));
                            out.println(" votos</h4>");
                            }
                                
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