<%-- 
    Document   : frmSeminarios
    Created on : 31 may. 2022, 20:00:21
    Author     : Gualbert
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Seminarios</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    </head>
    <body>
       
        <div class="container">
            <jsp:include page="WEB-INF/menu.jsp">
                    <jsp:param name="opcion" value="seminarios"/>
                </jsp:include>
            <br>
            <h1>Formulario de Seminarios</h1>
                
             
            <p></p>

            <form action="SeminarioControlador" method="POST">
                <input type="hidden" name="id" value="${seminario.id}" />
                    <div class="mb-3">
                        <label for="titulo" class="form-label" name="titulo"  >Titulo:</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" value="${seminario.titulo}">
                        <div id="titulo" class="form-text">Escriba el titulo del seminario</div>
                    </div>
                    <div class="mb-3">
                        <label  class="form-label" name="fecha"  >Fecha:</label>
                        <input type="text" class="form-control" id="correo" name="fecha" value="${seminario.fecha}">
                        <div id="fecha" class="form-text">Escriba la fecha de inicio</div>
                    </div>
                    <div class="mb-3">
                        <label for="cupo" class="form-label" name="cupo"  >Cupos:</label>
                        <input type="number" class="form-control" id="cupo" name="cupo" value="${seminario.cupo}">
                        <div id="cupo" class="form-text">Escriba el numero de cupos</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </form>
            

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
