<%-- 
    Document   : frmParticipante
    Created on : 31 may. 2022, 21:18:07
    Author     : Gualbert
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Participantes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
    </head>
    <body>
         <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="participantes"/>
            </jsp:include>
        <br>
        <div class="container">
            <h1>Formulario de Participantes</h1>

           

            <p></p>

            <form action="ParticipanteControlador" method="POST">
                                    
                <input type="hidden" name="id" value="${participante.id}" />
               
                <div class="mb-3">
                    <label class="form-label" name="apellidos"  >Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" value="${participante.apellidos}">
                    <div class="form-text">Escriba los apellidos </div>
                </div>
                    
                <div class="mb-3">
                    <label class="form-label" name="nombres"  >Nombres</label>
                    <input type="text" class="form-control" name="nombres" value="${participante.nombres}">
                    <div class="form-text">Escriba los Nombres </div>
                </div>
                    
                    
                <div class="mb-3">
                    <label  class="form-label" name="id_seminario"  >Seminario:</label>
                    <select name="id_seminario" class="form-control"> 
                        <option value="">--Seleccione</option>

                        <c:forEach var="item" items="${lista_seminarios}">
                            <option value="${item.id}" 
                                    <c:if test="${participante.id_seminario==item.id}"> 
                                selected
                                </c:if> 
                                >  ${item.titulo}
                            </option>
                        </c:forEach>
                    </select>
                    <div  class="form-text">Selecione el titulo del seminario</div>
                </div>
                    
                <div class="form-check form-switch">
                    <label class="form-label" name="confirmado"  >Confirmado</label>
                    <c:if test="${participante.confirmado==1}" var="confirmar" scope="request">
                        <input type="checkbox" class="form-check-input" name="confirmado" checked="checked" value="1">
                    </c:if>
                        <c:if test="${participante.confirmado==0}" var="confirmar" scope="request">
                            <input type="checkbox" class="form-check-input" name="confirmado" value="0">
                    </c:if>
                    <div class="form-text"> </div>
                </div>

                

                
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
