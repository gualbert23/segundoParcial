<%-- 
    Document   : participantes
    Created on : 31 may. 2022, 20:54:43
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
            <h1>Participantes</h1>

            

            <p></p>

            <a href="ParticipanteControlador?action=add" class="btn btn-success btn-sm"><i class="fa-solid fa-square-plus"></i>Nuevo</a>
            <p></p>
            <table class="table table-dark table-striped">
                <tr>
                    <th>Id</th>
                    <th>Apellidos</th>
                    <th>Nombres</th>
                    <th>Seminario</th>
                    <th>Confirmado</th>
                    
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${participantes}">

                    <tr>
                        <td>${item.id}</td>
                        <td>${item.apellidos}</td>
                        <td>${item.nombres}</td>
                        <td>${item.seminario}</td>
                        
                        <td>
                            <c:if test="${item.confirmado == 1}" var="confirmado" scope="request">
                                <input class="form-check-input" type="checkbox" name="confirmado" value="1" checked="checked" />
                            </c:if> 
                            <c:if test="${item.confirmado == 0}" var="confirmado" scope="request">
                                <input class="form-check-input" type="checkbox" name="confirmado" value="0"   />
                            </c:if>     
                                                                                        
                        </td>
                        
                        <td><a href="ParticipanteControlador?action=edit&id=${item.id}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                        <td><a href="ParticipanteControlador?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar???'))"  ><i class="fa-solid fa-trash-can"></i></a></td>
                    </tr>
                </c:forEach>
            
                            
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
