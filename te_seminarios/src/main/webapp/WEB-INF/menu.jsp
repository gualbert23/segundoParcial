
<%
    String opcion = request.getParameter("opcion");
%>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Seminarios</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link <%=(opcion.equals("seminarios")?"active":"")%>" aria-current="page" href="SeminarioControlador">Seminarios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <%=(opcion.equals("participantes")?"active":"")%>" href="ParticipanteControlador">Participantes</a>
          </li>
          
        </ul>
        
      </div>
    </div>
  </nav>
</header>


<nav class="nav nav-pills flex-column flex-sm-row">
    <a class="flex-sm-fill text-sm-center nav-link <%=(opcion.equals("productos")?"active":"")%>" aria-current="page" href="ProductoControlador">Productos</a>
    <a class="flex-sm-fill text-sm-center nav-link <%=(opcion.equals("clientes")?"active":"")%>" href="ClienteControlador">Clientes</a>
    <a class="flex-sm-fill text-sm-center nav-link <%=(opcion.equals("ventas")?"active":"")%>" href="VentaControlador">Ventas</a>

</nav>