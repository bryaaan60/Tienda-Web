CREATE DATABASE bd_prendas_tienda;

use bd_prendas_tienda;

CREATE TABLE prendas ( 
id_prenda INT AUTO_INCREMENT PRIMARY KEY, 
Nombre_producto VARCHAR(100) NOT NULL, 
Descripcion TEXT, 
Categoria VARCHAR(50), 
Material VARCHAR(50), 
Color VARCHAR(30), 
Precio DECIMAL(10,2) NOT NULL, 
Stock INT NOT NULL, 
Talla VARCHAR(10),
Genero ENUM('Hombre', 'Mujer', 'Unisex'), 
Imagen VARCHAR(200)
);




CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  precio DECIMAL(10,2),
  categoria VARCHAR(50),
  marca VARCHAR(50),
  imagen VARCHAR(255)
);
INSERT INTO productos (nombre, precio, categoria, marca, imagen) VALUES
('Camiseta Negra', 25.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Camiseta+Negra'),
('Auriculares Inalámbricos', 80.00, 'Tecnología', 'HP', 'https://via.placeholder.com/200x150?text=Auriculares'),
('Reloj Deportivo', 60.00, 'Accesorios', 'Nike', 'https://via.placeholder.com/200x150?text=Reloj+Deportivo'),
('Laptop Gamer', 1500.00, 'Tecnología', 'Asus', 'https://via.placeholder.com/200x150?text=Laptop+Gamer'),
('Chaqueta Invierno', 120.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Chaqueta'),
('Teclado Mecánico', 70.00, 'Tecnología', 'Dell', 'https://via.placeholder.com/200x150?text=Teclado'),
('Zapatillas Running', 90.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Zapatillas'),
('Mochila Deportiva', 40.00, 'Accesorios', 'HP', 'https://via.placeholder.com/200x150?text=Mochila'),
('Monitor 27 pulgadas', 200.00, 'Tecnología', 'Dell', 'https://via.placeholder.com/200x150?text=Monitor+27'),
('Mouse Gamer', 45.00, 'Tecnología', 'Asus', 'https://via.placeholder.com/200x150?text=Mouse+Gamer'),
('Sudadera Gris', 55.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Sudadera'),
('Cámara Web HD', 95.00, 'Tecnología', 'HP', 'https://via.placeholder.com/200x150?text=Camara+Web'),
('Smartwatch', 180.00, 'Accesorios', 'Dell', 'https://via.placeholder.com/200x150?text=Smartwatch'),
('Polo Deportivo', 30.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Polo+Deportivo'),
('Impresora Multifunción', 250.00, 'Tecnología', 'HP', 'https://via.placeholder.com/200x150?text=Impresora'),
('Cargador Portátil', 35.00, 'Accesorios', 'Asus', 'https://via.placeholder.com/200x150?text=Cargador'),
('Pantalón Jeans', 65.00, 'Ropa', 'Nike', 'https://via.placeholder.com/200x150?text=Jeans'),
('Router WiFi 6', 130.00, 'Tecnología', 'Dell', 'https://via.placeholder.com/200x150?text=Router+WiFi6'),
('Bolso Deportivo', 50.00, 'Accesorios', 'Nike', 'https://via.placeholder.com/200x150?text=Bolso'),
('Laptop Ultrabook', 1100.00, 'Tecnología', 'HP', 'https://via.placeholder.com/200x150?text=Ultrabook');



CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
);
select * from usuarios

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE pedido_detalles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
    );
    
    
    
    CREATE TABLE productos (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nombre VARCHAR(255) NOT NULL,
      precio VARCHAR(255)NOT NULL,
      
      
    )