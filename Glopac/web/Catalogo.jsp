<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,java.util.*,java.net.URLEncoder" %>
<%@ include file="conexion.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    // --- Parámetros ---
    int pageSize = 12;
    int pageNumber = 1;
    try {
        String pageParam = request.getParameter("page");
        if (pageParam != null) pageNumber = Integer.parseInt(pageParam);
    } catch (Exception ignore) { pageNumber = 1; }

    String categoria = request.getParameter("categoria");
    String marca     = request.getParameter("marca");
    String precioMin = request.getParameter("precioMin");
    String precioMax = request.getParameter("precioMax");

    // --- DB ---
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    int totalRecords = 0;
    int totalPages   = 1;

    try {
        conn = DriverManager.getConnection(url, usuario, dbpassword);

        // 1) COUNT seguro con los mismos filtros
        StringBuilder countSql = new StringBuilder("SELECT COUNT(*) FROM productos WHERE 1=1");
        List<Object> countParams = new ArrayList<>();

        if (categoria != null && !categoria.isEmpty()) { countSql.append(" AND categoria = ?"); countParams.add(categoria); }
        if (marca     != null && !marca.isEmpty())     { countSql.append(" AND marca = ?");     countParams.add(marca); }
        if (precioMin != null && !precioMin.isEmpty()) { countSql.append(" AND precio >= ?");   countParams.add(Double.parseDouble(precioMin)); }
        if (precioMax != null && !precioMax.isEmpty()) { countSql.append(" AND precio <= ?");   countParams.add(Double.parseDouble(precioMax)); }

        PreparedStatement cps = conn.prepareStatement(countSql.toString());
        for (int i=0;i<countParams.size();i++) cps.setObject(i+1, countParams.get(i));
        ResultSet crs = cps.executeQuery();
        if (crs.next()) totalRecords = crs.getInt(1);
        crs.close(); cps.close();

        totalPages = (int)Math.ceil((double)totalRecords / pageSize);
        if (totalPages < 1) totalPages = 1;
        if (pageNumber < 1) pageNumber = 1;
        if (pageNumber > totalPages) pageNumber = totalPages;

        int offset = (pageNumber - 1) * pageSize;

        // 2) SELECT con los mismos filtros + LIMIT/OFFSET
        StringBuilder sql = new StringBuilder("SELECT id, nombre, precio, categoria, marca, imagen FROM productos WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (categoria != null && !categoria.isEmpty()) { sql.append(" AND categoria = ?"); params.add(categoria); }
        if (marca     != null && !marca.isEmpty())     { sql.append(" AND marca = ?");     params.add(marca); }
        if (precioMin != null && !precioMin.isEmpty()) { sql.append(" AND precio >= ?");   params.add(Double.parseDouble(precioMin)); }
        if (precioMax != null && !precioMax.isEmpty()) { sql.append(" AND precio <= ?");   params.add(Double.parseDouble(precioMax)); }

        sql.append(" ORDER BY id LIMIT ? OFFSET ?");
        params.add(pageSize);
        params.add(offset);

        ps = conn.prepareStatement(sql.toString());
        for (int i=0;i<params.size();i++) ps.setObject(i+1, params.get(i));
        rs = ps.executeQuery();

        // Para armar URLs (auto-descubre el nombre real del archivo)
        String self = request.getRequestURI();
        String encCat  = (categoria!=null)? URLEncoder.encode(categoria,"UTF-8") : "";
        String encMarca= (marca!=null)    ? URLEncoder.encode(marca,"UTF-8")     : "";
        String encPMin = (precioMin!=null)? URLEncoder.encode(precioMin,"UTF-8") : "";
        String encPMax = (precioMax!=null)? URLEncoder.encode(precioMax,"UTF-8") : "";
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Catálogo de Productos</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
      
      
     body { 
        font-family: Arial, sans-serif;
        margin: 20px;
        display: flex;
        flex-direction: column;
    }
    .contenido{
        display:flex;
        gap:20px;
        margin:20px 0
    }
    .sidebar{
        width:260px;
        padding:16px;
        background:#f8f9fa;
        border-radius:10px;
        border:1px solid #eee
    }
    .productos{
         display: grid;
         grid-template-columns: repeat(4, 1fr); /* siempre 4 columnas */
         gap: 20px;
    }
    .producto{
        border:1px solid #e5e7eb;
        border-radius:10px;
        padding:12px;text-align:center;
        background:#fff
    }
    .producto img{
       width: 100%;           
       height: auto;         
       object-fit: contain;   
       border-radius: 8px;
    }
    .navbar-nav .nav-link {
    margin-right: 20px;
    font-size: 14px;
    text-transform: uppercase;
    color: #000;
  }
  .navbar-nav .nav-link.active {
    color: #007bff; 
    font-weight: bold;
  }
  .navbar-nav .nav-link:hover {
    color: #007bff;
  }
  </style>
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
  <div class="container-fluid">



    <!-- Botón hamburguesa -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Collapse: enlaces (centrados) + íconos móviles dentro del collapse -->
    <div class="collapse navbar-collapse justify-content-center" id="navbarNav">

      <!-- Enlaces centrados -->
      <ul class="navbar-nav fw-bold">
        <li class="nav-item"><a class="nav-link" href="index.jsp">INICIO</a></li>
        <li class="nav-item"><a class="nav-link" href="Catalogo.jsp">CATÁLOGO</a></li>
        <li class="nav-item"><a class="nav-link" href="Clientes.jsp">OFERTAS</a></li>
        <li class="nav-item"><a class="nav-link" href="contacto.jsp">CONTACTO</a></li>
      </ul>

      <!-- Íconos: SOLO en móvil aparecen dentro del collapse (debajo de los links) -->
      <div class="d-lg-none w-100 mt-3">
        <ul class="navbar-nav d-flex justify-content-center gap-3">
          <li class="nav-item">
            <a class="nav-link p-0 text-center" href="busqueda.jsp">
              <img src="img/buscar.png" alt="Buscar" style="width:22px;">
            </a>
          </li>

          <li class="nav-item">
            <a class="nav-link p-0 text-center" href="usuario.jsp">
              <img src="img/login.png" alt="Usuario" style="width:22px;">
            </a>
          </li>

          <li class="nav-item position-relative">
            <a class="nav-link p-0 text-center" href="carrito.jsp">
              <img src="img/carrito.png" alt="Carrito" style="width:22px;">
              <span class="badge bg-danger rounded-pill position-absolute top-0 start-100 translate-middle">2</span>
            </a>
          </li>
        </ul>
      </div>

    </div>

    <!-- Íconos en la derecha: visibles en pantallas grandes -->
    <div class="d-none d-lg-flex align-items-center ms-auto gap-3">

      
      <!-- Dropdown Usuario -->
      <div class="dropdown">
        <a class="d-inline-block" href="#" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
          <img src="img/login.png" alt="Usuario" style="width:22px;">
        </a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
          <li><a class="dropdown-item" href="usuario.jsp">Ingresar / Mi cuenta</a></li>
          <li><a class="dropdown-item" href="registro.jsp">Registro</a></li>
        </ul>
      </div>

      <!-- Carrito con badge -->
      <a href="carrito.jsp" class="position-relative d-inline-block">
        <img src="img/carrito.png" alt="Carrito" style="width:22px;">
        <span class="badge bg-danger rounded-pill position-absolute top-0 start-100 translate-middle">2</span>
      </a>

    </div>
  </div>
</nav>
    
  <header class="text-center my-4">
    <h2>Catálogo de Productos</h2>
    <p class="text-muted">Descubre nuestra selección</p>
  </header>

  <div class="contenido">
    <!-- Filtros -->
    <div class="sidebar">
      <form id="filterForm" method="get" action="<%= self %>">
        <h5 class="mb-2">Categorías</h5>
        <div class="mb-3">
          <div><label><input type="radio" name="categoria" value="" <%= (categoria==null||categoria.isEmpty())?"checked":"" %>> Todas</label></div>
          <div><label><input type="radio" name="categoria" value="Ropa" <%= "Ropa".equals(categoria)?"checked":"" %>> Ropa</label></div>
          <div><label><input type="radio" name="categoria" value="Tecnología" <%= "Tecnología".equals(categoria)?"checked":"" %>> Tecnología</label></div>
          <div><label><input type="radio" name="categoria" value="Accesorios" <%= "Accesorios".equals(categoria)?"checked":"" %>> Accesorios</label></div>
        </div>

        <h5 class="mb-2">Marcas</h5>
        <div class="mb-3">
          <div><label><input type="radio" name="marca" value="" <%= (marca==null||marca.isEmpty())?"checked":"" %>> Todas</label></div>
          <div><label><input type="radio" name="marca" value="Nike" <%= "Nike".equals(marca)?"checked":"" %>> Nike</label></div>
          <div><label><input type="radio" name="marca" value="HP"   <%= "HP".equals(marca)?"checked":"" %>> HP</label></div>
          <div><label><input type="radio" name="marca" value="Dell" <%= "Dell".equals(marca)?"checked":"" %>> Dell</label></div>
          <div><label><input type="radio" name="marca" value="Asus" <%= "Asus".equals(marca)?"checked":"" %>> Asus</label></div>
        </div>

        <h5 class="mb-2">Precio</h5>
        <div class="row g-2">
          <div class="col-6">
            <input id="precioMin" name="precioMin" type="number" class="form-control" placeholder="Mín" value="<%= precioMin!=null?precioMin:"" %>">
          </div>
          <div class="col-6">
            <input id="precioMax" name="precioMax" type="number" class="form-control" placeholder="Máx" value="<%= precioMax!=null?precioMax:"" %>">
          </div>
        </div>

        <!-- Mantener página a 1 al filtrar -->
        <input type="hidden" name="page" value="1">
       
      </form>
    </div>

    <!-- Productos -->
    <div style="flex:1;">
      <div class="productos">
        <%
          boolean hay = false;
          while (rs.next()) {
            hay = true;
        %>
          <div class="producto">
            <img src="<%= rs.getString("imagen") %>" alt="<%= rs.getString("nombre") %>">
            <h6 class="mt-2 mb-1"><%= rs.getString("nombre") %></h6>
            <div class="text-muted small"><%= rs.getString("marca") %> · <%= rs.getString("categoria") %></div>
            <div class="fw-bold mt-1">$<%= rs.getBigDecimal("precio") %></div>
            <button class="btn btn-sm btn-success mt-2">Añadir al carrito</button>
          </div>
        <% } %>
      </div>
      <% if (!hay) { %>
        <p class="mt-3">No se encontraron productos con esos filtros.</p>
      <% } %>

      <!-- Paginación -->
      <div class="paginacion mt-3">
        <ul class="pagination justify-content-center">
          <li class="page-item <%= pageNumber == 1 ? "disabled" : "" %>">
            <a class="page-link"
               href="<%= self %>?page=<%= pageNumber-1 %>&categoria=<%= encCat %>&marca=<%= encMarca %>&precioMin=<%= encPMin %>&precioMax=<%= encPMax %>">
               Anterior
            </a>
          </li>
          <li class="page-item disabled">
            <span class="page-link">Página <%= pageNumber %> de <%= totalPages %></span>
          </li>
          <li class="page-item <%= pageNumber == totalPages ? "disabled" : "" %>">
            <a class="page-link"
               href="<%= self %>?page=<%= pageNumber+1 %>&categoria=<%= encCat %>&marca=<%= encMarca %>&precioMin=<%= encPMin %>&precioMax=<%= encPMax %>">
               Siguiente
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Auto-submit al cambiar filtros -->
  <script>
    document.querySelectorAll("input[name='categoria'], input[name='marca']").forEach(el=>{
      el.addEventListener('change', ()=> document.getElementById('filterForm').submit());
    });
    
  ["precioMin","precioMax"].forEach(id=>{
    const el = document.getElementById(id);
    el.addEventListener("input", ()=> document.getElementById("filterForm").submit());
  });

  </script>

  <footer class="footer bg-dark text-light pt-5">
  <div class="container">
    <div class="row">
      
      <!-- Logo y descripción -->
      <div class="col-md-3 mb-4">
        <img src="img/logo.png" alt="Logo" style="width:120px;" class="mb-3">
        <h5 class="fw-bold">FRX Tech</h5>
        <p>Aquí encontrarás la mejor selección de tecnología, ropa urbana y accesorios.</p>
        <a href="nosotros.jsp" class="text-light text-decoration-underline">Conoce más sobre nosotros...</a>
      </div>

      <!-- Contacto -->
      <div class="col-md-3 mb-4">
        <h6 class="fw-bold">Contáctanos:</h6>
        <p><i class="bi bi-telephone"></i> +51 987 654 321</p>
        <p><i class="bi bi-envelope"></i> contacto@gmail.com</p>
        <p><i class="bi bi-geo-alt"></i> Lima, Perú</p>

        <h6 class="fw-bold mt-3">Síguenos:</h6>
        <a href="#" class="text-light me-2"><i class="bi bi-facebook"></i></a>
        <a href="#" class="text-light me-2"><i class="bi bi-instagram"></i></a>
        <a href="#" class="text-light me-2"><i class="bi bi-youtube"></i></a>
      </div>

  
      <div class="col-md-3 mb-4">
        <h6 class="fw-bold">Información legal</h6>
        <ul class="list-unstyled">
          <li><a href="#" class="text-light text-decoration-none">Términos y condiciones</a></li>
          <li><a href="#" class="text-light text-decoration-none">Políticas de envío</a></li>
          <li><a href="#" class="text-light text-decoration-none">Tratamiento de datos</a></li>
          <li><a href="#" class="text-light text-decoration-none">Privacidad</a></li>
        </ul>
      </div>

    
      <div class="col-md-3 mb-4">
        <h6 class="fw-bold">Escríbenos:</h6>
        <form>
          <div class="mb-2">
            <input type="text" class="form-control" placeholder="Tu nombre *" required>
          </div>
          <div class="mb-2">
            <input type="email" class="form-control" placeholder="Correo electrónico *" required>
          </div>
          <div class="mb-2">
            <input type="tel" class="form-control" placeholder="Teléfono celular *" required>
          </div>
          <div class="mb-2">
            <textarea class="form-control" rows="2" placeholder="Mensaje *" required></textarea>
          </div>
          <div class="form-check mb-2">
            <input class="form-check-input" type="checkbox" required>
            <label class="form-check-label">
              Acepto <a href="#" class="text-light text-decoration-underline">términos y condiciones</a>
            </label>
          </div>
          <button type="submit" class="btn btn-dark w-100">Enviar</button>
        </form>
      </div>
    </div>
  </div>
</footer>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

</body>

</html>
<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(Exception ignore){}
        if (ps != null) try { ps.close(); } catch(Exception ignore){}
        if (conn != null) try { conn.close(); } catch(Exception ignore){}
    }
%>
