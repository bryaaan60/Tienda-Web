<%-- 
    Document   : Catalogo
    Created on : 21 ago. 2025, 12:20:18
    Author     : Slee Yaicate
--%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Catálogo</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    
    .sidebar { 
        width: 220px; 
        padding: 15px; 
        border-right: 1px 
        solid #ccc; 
    }
    .sidebar h3 { 
        margin-top: 20px; 
    }
    .contenido { 
        display: flex; 
        flex: 1; 
        margin-top: 20px; 
    }
    .productos { 
        flex: 1; 
        display: grid; 
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); 
        gap: 15px; padding: 10px; 
    }
    .producto { 
        border: 1px solid #ccc; 
        padding: 10px;
        border-radius: 8px; 
        text-align: center; 
        background: #fafafa; 
    }
    .producto img { 
        width: 100%; 
        height: 150px; 
        object-fit: cover; 
        border-radius: 6px; 
    }
    .paginacion { 
        text-align: center; 
        margin: 20px 0; 
    }
    .paginacion button { 
        margin: 0 5px; 
        padding: 5px 10px; 
        border: none; 
        background: #007bff;
        color: white; 
        border-radius: 4px; 
        cursor: pointer; 
    }
    .paginacion button.active { 
        background: #0056b3; 
        font-weight: bold; 
    }
    input[type="number"] { 
        width: 80px; 
        padding: 5px; 
        margin: 5px 0; 
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
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto fw-bold">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">INICIO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Catalogo.jsp">CATALOGO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="catalogo_1.jsp">OFERTAS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contacto.jsp">CONTACTO</a>
        </li>
      </ul>

        
 
      <ul class="navbar-nav d-flex align-items-center">
        <li class="nav-item me-3">
          <a href="buscar.jsp">
            <img src="img/search.png" alt="Buscar" style="width:22px; cursor:pointer;">
          </a>
        </li>
        <li class="nav-item me-3">
          <a href="usuario.jsp">
            <img src="img/login.png" alt="Usuario" style="width:22px; cursor:pointer;">
          </a>
        </li>
        <li class="nav-item">
          <a href="carrito.jsp">
            <img src="img/carrito.png" alt="Carrito" style="width:22px; cursor:pointer;">
          </a>
        </li>
      </ul>
    </div>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

  <header class="text-center my-4">
    <h2>Catálogo de Productos</h2>
    <p class="text-muted">Descubre nuestra selección de computadoras y accesorios</p>
  </header>

  <div class="contenido">
      
    <div class="sidebar">
      <h3>Categorías</h3>
      <label><input type="radio" name="categoria" value="" checked> Todas</label><br>
      <label><input type="radio" name="categoria" value="Ropa"> Ropa</label><br>
      <label><input type="radio" name="categoria" value="Tecnología"> Tecnología</label><br>
      <label><input type="radio" name="categoria" value="Accesorios"> Accesorios</label><br>

      <h3>Marcas</h3>
      <label><input type="radio" name="marca" value="" checked> Todas</label><br>
      <label><input type="radio" name="marca" value="Nike"> Nike</label><br>
      <label><input type="radio" name="marca" value="HP"> HP</label><br>
      <label><input type="radio" name="marca" value="Dell"> Dell</label><br>
      <label><input type="radio" name="marca" value="Asus"> Asus</label><br>

      <h3>Precio</h3>
      <label>Min: <input type="number" id="precioMin" placeholder="0"></label><br>
    <label>Max: <input type="number" id="precioMax" placeholder="3000"></label>
    </div>

    <div style="flex: 1;">
      <div id="contenedor" class="productos"></div>
      <div class="paginacion" id="paginacion"></div>
    </div>
  </div>
</body>

  <script>
    const productos = [
      { id: 1, nombre: "Camiseta Negra", precio: 25, categoria: "Ropa", marca: "Nike", imagen: "https://via.placeholder.com/200x150?text=Camiseta" },
      { id: 2, nombre: "Auriculares", precio: 80, categoria: "Tecnología", marca: "HP", imagen: "https://via.placeholder.com/200x150?text=Auriculares" },
      { id: 3, nombre: "Reloj Deportivo", precio: 60, categoria: "Accesorios", marca: "Nike", imagen: "https://via.placeholder.com/200x150?text=Reloj" },
      { id: 4, nombre: "Laptop Gamer", precio: 1500, categoria: "Tecnología", marca: "Asus", imagen: "https://via.placeholder.com/200x150?text=Laptop" },
      { id: 5, nombre: "Chaqueta", precio: 120, categoria: "Ropa", marca: "Nike", imagen: "https://via.placeholder.com/200x150?text=Chaqueta" },
      { id: 6, nombre: "Teclado Mecánico", precio: 70, categoria: "Tecnología", marca: "Dell", imagen: "https://via.placeholder.com/200x150?text=Teclado" },
      { id: 7, nombre: "Zapatillas", precio: 90, categoria: "Ropa", marca: "Nike", imagen: "https://via.placeholder.com/200x150?text=Zapatillas" },
      { id: 8, nombre: "Mochila", precio: 40, categoria: "Accesorios", marca: "HP", imagen: "https://via.placeholder.com/200x150?text=Mochila" },
      { id: 9, nombre: "Monitor 27''", precio: 200, categoria: "Tecnología", marca: "Dell", imagen: "https://via.placeholder.com/200x150?text=Monitor" }
    ];

    const productosPorPagina = 6;
    let paginaActual = 1;
    let categoriaSeleccionada = "";
    let marcaSeleccionada = "";
    let precioMin = 0;
    let precioMax = Infinity;

    const contenedor = document.getElementById("contenedor");
    const paginacion = document.getElementById("paginacion");

    function mostrarProductos() {
      contenedor.innerHTML = "";

      const filtrados = productos.filter(p => {
        const coincideCategoria = categoriaSeleccionada === "" || p.categoria === categoriaSeleccionada;
        const coincideMarca = marcaSeleccionada === "" || p.marca === marcaSeleccionada;
        const coincidePrecio = p.precio >= precioMin && p.precio <= precioMax;
        return coincideCategoria && coincideMarca && coincidePrecio;
      });

      const inicio = (paginaActual - 1) * productosPorPagina;
      const fin = inicio + productosPorPagina;
      const pagina = filtrados.slice(inicio, fin);

      if (pagina.length === 0) {
        contenedor.innerHTML = "<p>No se encontraron productos</p>";
        paginacion.innerHTML = "";
        return;
      }

      pagina.forEach(p => {
        const div = document.createElement("div");
        div.className = "producto";
        div.innerHTML = `
          <img src="${p.imagen}" alt="${p.nombre}">
          <h3>${p.nombre}</h3>
          <p><b>$${p.precio}</b></p>
          <p><i>${p.marca}</i></p>
          <button>Añadir al carrito</button>
        `;
        contenedor.appendChild(div);
      });

      generarPaginacion(filtrados.length);
    }

    function generarPaginacion(totalProductos) {
      paginacion.innerHTML = "";
      const totalPaginas = Math.ceil(totalProductos / productosPorPagina);

      for (let i = 1; i <= totalPaginas; i++) {
        const btn = document.createElement("button");
        btn.textContent = i;
        btn.className = (i === paginaActual) ? "active" : "";
        btn.addEventListener("click", () => {
          paginaActual = i;
          mostrarProductos();
        });
        paginacion.appendChild(btn);
      }
    }

    function aplicarFiltros() {
      precioMin = parseFloat(document.getElementById("precioMin").value) || 0;
      precioMax = parseFloat(document.getElementById("precioMax").value) || Infinity;
      paginaActual = 1;
      mostrarProductos();
    }

    document.querySelectorAll("input[name='categoria']").forEach(input => {
      input.addEventListener("change", (e) => {
        categoriaSeleccionada = e.target.value;
        paginaActual = 1;
        mostrarProductos();
      });
    });

    document.querySelectorAll("input[name='marca']").forEach(input => {
      input.addEventListener("change", (e) => {
        marcaSeleccionada = e.target.value;
        paginaActual = 1;
        mostrarProductos();
      });
    });
    
    document.getElementById("precioMin").addEventListener("input", e => {
      precioMin = e.target.value ? parseFloat(e.target.value) : 0;
      paginaActual = 1;
      mostrarProductos();
    });
    document.getElementById("precioMax").addEventListener("input", e => {
      precioMax = e.target.value ? parseFloat(e.target.value) : Infinity;
      paginaActual = 1;
      mostrarProductos();
    });

    mostrarProductos();
  </script>
</body>
</html>



