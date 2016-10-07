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
                                        <li><a href="registroprs.html">Cédula</a></li>
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
                        <li><a href="votar.html" class="button special">VOTAR</a></li>
                        <li><a href="#" class="button">Estadísticas</a></li>
                    </ul>
                </section>r

            <!-- Main -->
                <section id="main" class="container">

                    <section class="box special features">
                         <div class="features-row">
                            <section>
                            <h4><b>A continuación se encuentran los resultados estadísticos de la votación</b></h4>
                               
                                <%@ page import = "java.sql.*"%>
                                <%
                                int numsi=0;
                                int numno=0;
                                int numvot=0;

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/plebiscitoun","root","1234");
                                Statement st = con.createStatement(); 
                                ResultSet rs; 
                            
                                Statement instruccion= con.createStatement();
                                
                                ResultSet numero = instruccion.executeQuery("select * from votar");
                                
                                while(numero.next()){
                                numsi=numero.getInt("Si");
                                numno=numero.getInt("No");
                                }
           
                                numvot=numsi+numno;

                                int tortasi = (numsi*360)/numvot;
                                int tortano = (numno*360)/numvot;

                                if(numno<numsi){
                                 out.println("<h5> El voto ganador es el <b>Sí</b> con "+numsi+" votos VS los "+numno+" votos del <b>No</b></h5><br>");
                                }
                                if (numno>numsi){
                                 out.println("<h5> El voto ganador es el <b>No</b> con "+numno+" votos VS los "+numsi+" votos del <b>Sí</b></h5><br>");
                                }
                                if (numno==numsi){
                                 out.println("<h5> El resultado es un empate con "+numsi+" votos de cada opción</h5><br>");
                                }
                                                                            
                            %>
                            <canvas id="mycanvas" width="256" height="256">
                                <script>
                                    $(document).ready(function(){
                                        var ctx = $("#mycanvas").get(0).getContext("2d");
                                        //pie chart data
                                        //sum of values = 360
                                        var data = [
                                            {
                                                value: <%= tortano%>,
                                                color: "darkred",
                                                highlight: "lightskyblue",
                                                label: "No"
                                            },
                                            {
                                                value: <%= tortasi%>,
                                                color: "darkgreen",
                                                highlight: "yellowgreen",
                                                label: "Sí"
                                            }
                                        ];
                                        //draw
                                        var piechart = new Chart(ctx).Pie(data);
                                    });
                                </script>
                            </canvas>     
                    </section>
                    <section>                        
                            <form action="votacionmesa.jsp" method="post">  
                                <div class="row uniform 50%">
                                    <div class="6u 12u(mobilep)">
                                         <input type="number" name="mesa" placeholder=" #Puesto" max="10" min="1" class="button alt fit small" required="" />
                                    </div>              
                                            
                                    <div class="6u 12u(mobilep)">
                                        <input type="submit" name="vervotosmesa" value="Ver votación por mesa" class="button special fit small"/>
                                    </div>
                                    </div>
                            </form>
                            

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