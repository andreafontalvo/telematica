
		function no(){
	        var x = document.querySelector("#votacion");
	        x.setAttribute("style","display:none");
	        var y = document.querySelector("#confirmacion");
	        y.setAttribute("style","display:inline");
	        var z = document.querySelector("#elijo");
	        z.setAttribute("value","No");
	        //var y = document.querySelector("#elijo1");
	        //y.setAttribute("style","display:none");
		}
		function si(){
	        var x = document.querySelector("#votacion");
	        x.setAttribute("style","display:none");
	        var y = document.querySelector("#confirmacion");
	        y.setAttribute("style","display:inline");
	        var z = document.querySelector("#elijo");
	        z.setAttribute("value","Si");
	        //var y = document.querySelector("#elijo1");
	        //y.setAttribute("style","display:none");
		}		

		function confirmarno(){
	        var x = document.querySelector("#votacion");
	        x.setAttribute("style","display:inline");
	        var y = document.querySelector("#confirmacion");
	        y.setAttribute("style","display:none");
	        //var y = document.querySelector("#elijo1");
	        //y.setAttribute("style","display:none");
		}