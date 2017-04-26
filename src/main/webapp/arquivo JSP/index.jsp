<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calcular IMC</title>
  <body>
    <h2>Informe seus dados</h2>
        <form method="GET" action="imc.do">
            Altura:<input type="text" name="altura"/><br>
            Peso:<input type="text" name="peso"/><br>
                <input type="submit"/>
      	  </form>
	<h3>Voce esta: </h3>
<%String condicao = (String) request.getAttribute("condicao");
        out.print(condicao);
%>

<%
String altura = request.getParameter("altura");
        String peso = request.getParameter("peso");
        imc = Float.parseFloat(peso) / (Float.parseFloat(altura) * Float.parseFloat(altura));
        if(imc < 18)
        {
            condicao = "Abaixo do peso";
        }
        else
            if(imc > 18 & imc < 25)
            {
                condicao = "Peso normal";
            }
            else
                if(imc > 25 & imc < 30)
                {
                    condicao = "Acima do peso";
                }
                else
                    if(imc > 30)
                    {
                        condicao = "obesso";
                    }
        request.setAttribute("condicao", condicao);
        RequestDispatcher rd = request.getRequestDispatcher("resultadoimc.jsp");
        rd.forward(request, response);
    }
} %>
    </div>
  </body>
</html>