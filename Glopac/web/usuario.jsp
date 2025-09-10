     <!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Sistema de Gestión de Inventarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            width: 100%;
            height: 100vh;
            background-color: black;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url("img/fondo.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
      
        .card {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card{
            backdrop-filter:blur(5px);
            -webkit-backdrop-filter:blur(5px); 
        }
        h3 {
            font-weight: 600;
            color: #495057; 
        }
        .form-label {
            color: black;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-primary {
            background-color: #4e73df;
            border: none;
        }
        .btn-primary:hover {
            background-color: #2e59d9;
        }
        .text-center {
            color: black;
            margin-bottom: 20px;
        }
        #loginForm {
            padding: 10px;
        }
        
    </style>
</head>
<body>
    
    <div class="card shadow p-4" style="max-width: 400px; width: 100%;">
        <h3 class="text-center mb-4">Sistema de Gestión de Inventarios</h3>
        
        <form action="login.jsp" method="post" id="loginForm">
            <div class="mb-3">
                <label for="username" class="form-label">Nombre de usuario</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Iniciar Sesión</button>
        </form>
    </div>
</body>
</html>  