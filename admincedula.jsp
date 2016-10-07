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

                    <section class="box special features">
                            <%@ page import = "java.sql.*"%>
                            <%
                                String clav = request.getParameter("clave");
                                String a = "";
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
                                Statement st = con.createStatement(); 
                                ResultSet rs; 

                                //para que los que ya votaron no puedan volver a votar
                                Statement instruccion= con.createStatement();
                                ResultSet tabla = instruccion.executeQuery("select * from admin");
                                // si eso secumple significa que lapersona ya voto y debe solo mostrarseel mensaje que la persona ya voto
                                    while (tabla.next()) {
                                    a=tabla.getString(1);
                                    }                                
                            
                                 if(a.equals(clav)) {
                                            response.sendRedirect("registroprs.html"); 
                                     }   
                                     else {                                                                   
                                            response.sendRedirect("admincedula.html"); 


                                    }
                                 
                                // si eso  NO secumple significa que lapersona no se  ha registrado y no puede votar todavia
                            con.close();
                            // cerrar if

                            // si no tiene ninguno de esos problemas un if  grabe esa cedula en la tabla de los que votaron y redirija a la pagina donde va a votar

                            %>
                     </section>
                </section>

            <!-- CTA -->
                <!-- <section id="cta">

                    <h2>Sign up for beta access</h2>
                    <p>Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc.</p>

                    <form>
                        <div class="row uniform 50%">
                            <div class="8u 12u(mobilep)">
                                <input type="email" name="email" id="email" placeholder="Email Address" />
                            </div>
                            <div class="4u 12u(mobilep)">
                                <input type="submit" value="Sign Up" class="fit" />
                            </div>
                        </div>
                    </form>

                </section>-->

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
