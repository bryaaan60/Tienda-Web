<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inicio</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  
  <style>
body { 
  font-family: Arial, sans-serif;
  margin: 0px;
  display: flex;
  flex-direction: column;
  padding: 0;
}

/* NAVBAR */

.navbar {
  margin-top: 20px;
}
.navbar-nav .nav-link {
 margin: 0 18px;
  font-size: 14px;
  font-weight: 600;
  text-transform: uppercase;
  color: #000;
}
.navbar-nav .nav-link.active {
  color: #007bff;
}
.navbar-nav .nav-link:hover {
  color: #007bff;
}
.iconos-nav img {
  width: 22px;
  height: 22px;
  margin-left: 18px;
  cursor: pointer;
}
 .badge {
    font-size: 0.65rem;
    padding: 0.35em 0.45em;
  }



/* CATEGORÍAS */
.categorias {
  display: flex;
  justify-content: center;
  gap: 40px;
  margin: 40px 0;
  flex-wrap: wrap;
}
.categoria {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
.categoria img {
  width: 80px;
  height: 80px;
  margin-bottom: 8px;
  object-fit: contain;
}

/* PRODUCTOS DESTACADOS */
.productos-destacados {
  display: flex;
  justify-content: center;
  gap: 30px;
  flex-wrap: wrap;
  margin: 40px 0;
}
.productos-dest {
  width: 220px;
  padding: 15px;
  background-color: #f8f9fa;
  display: flex;
  flex-direction: column;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  transition: transform 0.3s;
}
.productos-dest:hover {
  transform: translateY(-5px);
}
.productos-dest img {
  object-fit: contain;
  width: 100%;
  height: 160px;
  margin-bottom: 10px;
}
.productos-dest h3 {
  font-size: 16px;
  margin-bottom: 10px;
}
.boton-carrito {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 6px;
  padding: 8px;
  cursor: pointer;
  transition: background 0.3s;
}
.boton-carrito:hover {
  background-color: #0056b3;
}

/* FOOTER */
footer {
  background: #212529;
  color: #fff;
  padding: 40px 20px;
  margin-top: 50px;
}
footer h2, footer h3, footer h4 {
  color: #fff;
}
footer a {
  color: #ccc;
  text-decoration: none;
}
footer a:hover {
  color: #fff;
}
.footer-img img {
  width: 40px;
  height: 40px;
  margin-bottom: 8px;
}

/* HERO */
.hero {
  background-image: url("img/fondo_g.png"); 
   background-repeat: no-repeat;
   background-size: cover;
  color: #fff;
  padding: 120px 40px;
  text-align: left;
        
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.hero p {
  font-size: 18px;
  margin: 20px 0;
}
.hero h2 {
  font-size: 40px;
  font-weight: 700;
}


.btn-explorar {
  background-color: #007bff;
  color: white;
  border-radius: 6px;
  padding: 10px 20px;
  text-decoration: none;
  font-weight: 600;
  transition: 0.3s;
}
.btn-explorar:hover {
  background-color: #0056b3;
  color: white;
}

/* CAROUSEL */
.hero .carousel-inner img {
  width: 100%;
  height: 400px;          
  object-fit: contain;    
     
  padding: 10px;          
}

.carousel-item img {
  width: 100%;
  height: 400px; /* ajusta según tu diseño */
  object-fit: cover;
}


/* Fondo y bordes */
.login-modal {
  border-radius: 15px;
  overflow: hidden;
}

/* Panel izquierdo */
.login-left {
  background: linear-gradient(135deg, #0d6efd, #6610f2);
  color: white;
  text-align: center;
  padding: 30px;
}

/* Panel derecho */
.login-right {
  background-color: #ffffff;
}

.login-right h4 {
  color: #333;
}

/* Botón principal */
.btn-login {
  background-color: #0d6efd;
  color: white;
  border: none;
  transition: 0.3s;
}

.btn-login:hover {
  background-color: #084298;
}

/* Inputs */
.login-right .form-control {
  border-radius: 8px;
  padding: 10px;
  font-size: 14px;
}

/* Redes sociales */
.login-right .btn-outline-dark {
  border-radius: 50%;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}



  </style>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
  <div class="container-fluid">

      <h1>LOGO</h1>

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
        <a class="d-inline-block" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">
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

    
 <section class="hero">
  <div class="overlay"></div>
  <div class="container">
    <div class="row align-items-center">
      <div class="col-md-6">
        <h2 class="fw-bold">Tu estilo, tu elección</h2>
        <p class="lead">Ropa urbana de calidad al mejor precio. Explora nuestras ofertas exclusivas.</p>
        <a href="Catalogo.jsp" class="btn-explorar">Explorar ahora</a>
      </div>

      <div class="col-md-6">
        <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-pause="false">
          <div class="carousel-inner text-center">
            <div class="carousel-item active" data-bs-interval="3000">
              <img src="img/polo.png" class="d-block w-100" alt="Polo">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
              <img src="img/laptop-.png" class="d-block w-100" alt="Laptop">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
              <img src="img/polo.png" class="d-block w-100" alt="Polo 2">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
              <img src="img/laptop-.png" class="d-block w-100" alt="Accesorios">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

   

  <section>
    <h2 class="text-center">Categorías</h2>
    <div class="categorias">
      <div class="categoria"><img src="img/iconolaptop.png" alt="Laptops"><span>Laptops</span></div>
      <div class="categoria"><img src="img/desktop.png" alt="Desktop"><span>Computadoras</span></div>
      <div class="categoria"><img src="img/audifono.png" alt="Accesorios"><span>Accesorios</span></div>
      <div class="categoria"><img src="img/monitor.png" alt="Monitor"><span>Monitores</span></div>
    </div>
  </section>

  
  <section>
    <h2 class="text-center">Productos Destacados</h2>
    <div class="productos-destacados">
      <div class="productos-dest">
        <img src="img/producto_1.png" alt="producto">
        <h3>HP - Victus 16.1" Gaming Laptop <br>$899.99</h3>
        <button class="boton-carrito">Añadir Carrito</button>
      </div>
      <div class="productos-dest">
        <img src="img/producto_1.png" alt="producto">
        <h3>HP - Victus 16.1" Gaming Laptop <br>$899.99</h3>
        <button class="boton-carrito">Añadir Carrito</button>
      </div>
      <div class="productos-dest">
        <img src="img/producto_1.png" alt="producto">
        <h3>HP - Victus 16.1" Gaming Laptop <br>$899.99</h3>
        <button class="boton-carrito">Añadir Carrito</button>
      </div>
      <div class="productos-dest">
        <img src="img/producto_1.png" alt="producto">
        <h3>HP - Victus 16.1" Gaming Laptop <br>$899.99</h3>
        <button class="boton-carrito">Añadir Carrito</button>
      </div>
    </div>
  </section>


 <footer class="footer bg-dark text-light pt-5">
  <div class="container">

    
   <div class="row mb-5">
  <div class="col-md-12">
    <h4 class="fw-bold mb-3">Contacto</h4>
    <p>¿Tienes alguna pregunta? <br> Ponte en contacto con nosotros</p>
    <form class="row g-3 col-md-6 ms-auto">
      <div class="col-12">
        <input type="text" name="nombre" placeholder="Nombre" class="form-control" required>
      </div>
      <div class="col-12">
        <input type="email" name="correo" placeholder="Correo Electrónico" class="form-control" required>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-primary">Enviar</button>
      </div>
    </form>
  </div>
</div>

    <hr class="border-secondary">

 
    <div class="row">
      
  
      <div class="col-md-6 mb-4">
        <div class="footer-img mb-3 d-flex align-items-center">
          <img src="img/producto_1.png" alt="logo" style="width:50px; height:auto;" class="me-2">
          <div>
            <h5 class="fw-bold">"Nombre"</h5>
            <p class="small">"descripcion"</p>
          </div>
        </div>
        <h6 class="fw-bold">Enlaces Rápidos</h6>
        <ul class="list-unstyled">
          <li><a href="index.jsp" class="text-decoration-none text-light">Inicio</a></li>
          <li><a href="Catalogo.jsp" class="text-decoration-none text-light">Catálogo</a></li>
          <li><a href="Clientes.jsp" class="text-decoration-none text-light">Ofertas</a></li>
          <li><a href="soporte.jsp" class="text-decoration-none text-light">Soporte Técnico</a></li>
          <li><a href="nosotros.jsp" class="text-decoration-none text-light">Sobre Nosotros</a></li>
        </ul>
      </div>


      <div class="col-md-6 mb-4">
  <h6 class="fw-bold mb-3">Mantente Informado</h6>
  <p>Suscríbete para recibir ofertas y novedades</p>
  <form class="row g-3">
    <div class="col-12">
      <input type="email" class="form-control" placeholder="Email" required>
    </div>
    <div class="col-12">
      <button type="submit" class="btn btn-primary">Suscribirse</button>
    </div>
  </form>
</div>

    <hr class="border-secondary">

   
  </div>
</footer>
    
    
    
    

<div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content login-modal">
      <div class="row g-0">

      
        <div class="col-md-5 login-left d-flex flex-column justify-content-center align-items-center">
          <img src="img/producto_1.png" alt="Logo tienda" class="mb-3" style="max-width:100px;">
          <h3 class="fw-bold mb-2">"NOMBRE"</h3>
          <p class="text-center px-3">
            ¡Conéctate a nuestra tienda y disfruta de la mejor experiencia en tecnología y moda urbana!
          </p>
        </div>

        
        <div class="col-md-7 login-right p-4">
          <div class="d-flex justify-content-end">
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>

          <h4 class="fw-bold mb-3 text-center">Inicia Sesión</h4>
          <form action="login.jsp" method="post">
            <input type="email" name="correo" class="form-control mb-3" placeholder="Correo electrónico" required>
            <input type="password" name="contrasena" class="form-control mb-2" placeholder="Contraseña" required>
            <a href="#" class="small d-block mb-3 text-end text-primary">¿Olvidaste tu contraseña?</a>
            <button type="submit" class="btn btn-login w-100 mb-3 fw-bold">Ingresar</button>
          </form>


        
          <div class="d-flex justify-content-around mb-3">
            <button class="btn btn-outline-dark"><i class="bi bi-facebook"></i></button>
            <button class="btn btn-outline-dark"><i class="bi bi-google"></i></button>
            <button class="btn btn-outline-dark"><i class="bi bi-apple"></i></button>
            <button class="btn btn-outline-dark"><i class="bi bi-microsoft"></i></button>
          </div>

          <p class="text-center">¿Aún no eres miembro? 
            <a href="#" class="text-primary fw-bold" data-bs-toggle="modal" data-bs-target="#registerModal" data-bs-dismiss="modal">
              Regístrate Ahora
            </a>
          </p>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- ? MODAL REGISTRO -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content rounded-4 overflow-hidden">

      <div class="row g-0">
        <!-- IZQUIERDA -->
        <div class="col-md-5 login-left d-flex flex-column justify-content-center align-items-center">
          <h3 class="fw-bold mb-3">Únete a "  "</h3>
          <p class="text-center">Regístrate gratis y empieza a disfrutar de todos nuestros beneficios.</p>
          <img src="img/producto_1.png" alt="Registro" class="img-fluid mt-3" style="max-height:180px;">
        </div>

        <!-- DERECHA -->
        <div class="col-md-7 p-4">
          <div class="d-flex justify-content-end">
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <h4 class="fw-bold mb-3">Crear Cuenta</h4>
          <form action="register.jsp" method="post">
            <input type="text" name="nombre" class="form-control mb-3" placeholder="Nombre completo" required>
            <input type="email" name="correo" class="form-control mb-3" placeholder="Correo electrónico" required>
            <input type="password" name="contrasena" class="form-control mb-3" placeholder="Contraseña" required>
            <button type="submit" class="btn btn-login w-100 mb-3 fw-bold">Registrarme</button>
          </form>


          <p class="text-center mt-3">¿Ya tienes cuenta?
            <a href="#" class="text-primary fw-bold" data-bs-toggle="modal" data-bs-target="#loginModal" data-bs-dismiss="modal">
              Inicia Sesión
            </a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
    

</body>
</html>
