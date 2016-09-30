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
                                    <li><a href="#">Puesto de Votación</a></li>
                                    <li><a href="#">Cédula</a></li>
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
                        <li><a href="#" class="button special">VOTAR</a></li>
                        <li><a href="#" class="button">Estadísticas</a></li>
                    </ul>
                </section>r

            <!-- Main -->
                <section id="main" class="container">

                    <section class="box special features">
                            <%@ page import = "java.sql.*"%>
                            <%                      
                                String nompuesto = request.getParameter("nombrepuesto");
                                String direpuesto = request.getParameter("dirpuesto");
                                String ciupuesto = request.getParameter("ciudadpuesto");

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
                                Statement st = con.createStatement(); 
                                ResultSet rs; 
                                int i = st.executeUpdate("INSERT INTO `plebiscitoun`.`puestovot` \n" +
                                                                "(`idpuesto`,\n" +
                                                                "`NombrePuesto`,\n" +
                                                                "`Direccion`,\n" +
                                                                "`Ciudad`)\n" +
                                                                "VALUES \n" +
                                                                "(null, \n" +
                                                                "'"+nompuesto+"',\n" +
                                                                "'"+direpuesto+"',\n" +
                                                                "'"+ciupuesto+"');");
                                out.println("Su puesto de votacion se ha registrado exitosamente");
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