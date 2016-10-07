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
                                String name = request.getParameter("nombre");
                                String cedu = request.getParameter("ced");
                                String ciudad = request.getParameter("city");
                                String dpto = request.getParameter("derp");
                                String num = request.getParameter("numpuesto");
                                String data="";
                                String datac="";
                                int[] idpue= new int[10] ;

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
                                Statement st = con.createStatement(); 
                                ResultSet rs; 

                                ResultSet datos = st.executeQuery("select Ciudad from puestovot where idpuesto= '"+num+"' ");
                                while(datos.next()){data=datos.getString("Ciudad");}

                                ResultSet cc = st.executeQuery("select cedula from registro where cedula = '"+cedu+"' ");
                                while(cc.next()){datac=cc.getString("cedula");}
                                /*int ceduint = Integer.parseInt(cedu);*/
                                //hacer que cedu se vuelva int para  la comparacion de  datac con cedu


                                if(data.equals(ciudad)){
                                if(datac.equals(cedu)){
                                       out.println("<h4>La cedula que ingresó ya fué registrada</h4>");
                             /*}*/}
                                else{

                                int i = st.executeUpdate("INSERT INTO `plebiscitoun`.`registro` \n" +
                                                                "(`numreg`,\n" +
                                                                "`nomyapell`,\n" +
                                                                "`cedula`,\n" +
                                                                "`ciudad`,\n" +
                                                                "`dpto`,\n" +
                                                                "`numpuesto`)\n" +
                                                                "VALUES \n" +
                                                                "(null, \n" +
                                                                "'"+name+"',\n" +
                                                                "'"+cedu+"',\n" +
                                                                "'"+ciudad+"',\n" +
                                                                "'"+dpto+"',\n" +
                                                                "'"+num+"');");
                                                                
                                out.println("<h4>Usted se ha registrado exitosamente</h4>");
                                }
                                }
                                else {
                                       out.println("<h4>La ciudad del número de puesto que desea registrar no coincide con la que usted seleccionó </h4>");

                                }
                             /*else {*/
                                
                            /*}*/    
                         

                                // si eso  NO secumple significa que lapersona no se  ha registrado y no puede votar todavia
                            con.close();
                            %>
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
