# Proyecto Happy Art - Tienda Online

**Equipo**  
David Rivera  
Rafael Terrevoli  
Sebastián Lorca  

### 1- Diseño de la interfaz gráfica

[Link a todas las vistas](vistas_interfaz/webhappy.pdf)
![Vista home sitio](/vistas_interfaz/webhappy(2)_page-0001.jpg)

### 2- Definición de la navegación entre las vistas
![Vista Mapa del sitio](/website_map/navigation-map.jpg)
### 3- Listado de dependencias a utilizar en el proyecto

>[!NOTE]
>**Dependencias de Frontend**  
-Axios  
-Material UI  
-mui icons-material  
-React  
-React-dom  
-React router dom  
-SASS  
-Typescript

>[!NOTE]
**Dependencias del Backend**  
-Express JS  
-Cors  
-PG  
-pg-format  
-jsonwebtoken  
-bcrypt

### 4- Diseño las tablas de la base de datos y sus relaciones
![Vista BD 1](/diseño_bd/image-1.png)
![Vista BD 2](/diseño_bd/image-2.png)

### 5- Diseñar el contrato de datos de la API REST

#### Base URL
```
https://api.happyart.com/v1
```

#### Autenticación
- Algunos endpoints requieren autenticación mediante JWT Token
- El token debe ser incluido en el header: `Authorization: Bearer <token>`

#### Endpoints

##### 1. Autenticación y Usuarios

##### Registro de Usuario
```http
POST /auth/register
Content-Type: application/json

Request:
{
    "firtName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "address": "string"
}

Response: 201 Created
{
    "email": "string",
    "message": "Usuario registrado exitosamente",
    "token": "string"
}

Response: 400 Bad Request
{
    "message": "Error al registrar el usuario, falta algunos datos"
}
```

##### Inicio de Sesión
```http
POST /auth/login
Content-Type: application/json

Request:
{
    "email": "string",
    "password": "string"
}

Response: 200 OK
{
    "token": "string",
    "email": "string"
}

Response: 400 Bad Request
{
    "message": "Error al iniciar sesión, email o password incorrectos"
}
```

##### 2. Perfil de Usuario

##### Obtener Perfil
```http
GET /auth/myprofile
Authorization: Bearer <token>

Response: 200 OK
{
    "usuario": {
        "rut": "string",
        "name": "string",
        "lastName": "string",
        "email": "string",
        "password": "string",
        "phone": "string",
        "address": "string"
    }
}

Response: 400 Bad Request
{
    "message": "Error obteniendo el perfil"
}
```

##### 3. Productos

###### Crear Producto
```http
POST /products
Authorization: Bearer <token>
Content-Type: application/json

Request:
{
    "name": "string",
    "description": "string",
    "category": "string",
    "productType": "string",
    "price": "number",
    "stock": "integer",
    "theme": "string",
    "imagenes": "file[]"
}

Response: 201 Created
{
    "productoId": "integer",
    "message": "Producto creado exitosamente"
}

Response: 400 Bad Request
{
    "message": "Error al crear el producto"
}
```

##### Obtener Productos (Galería)
```http
GET /products

Query Parameters:
- page (integer)
- limit (integer)
- category (string, opcional)
- order (string, opcional: "name", "price", "stock")
- orderBy (string, opcional: "asc", "desc")

Response: 200 OK
{
    "products": [{
        "productoId": "integer",
        "name": "string",
        "price": "number",
        "stock": "integer"
        "category": "string",
        "theme": "string",
        "productType": "string",
        "img": "string"
        
    }],
    "total": "integer",
    "current_page": "integer",
    "total_pages": "integer"
}

Response: 400 Bad Request
{
    "message": "Error obteniendo los productos"
}

Response: 404 Not Found 
{
    "message": "Productos no encontrado"
}
```

#### Obtener Detalle del Producto
```http
GET /products/{productId}

Response: 200 OK
{
   "productoId": "integer",
    "name": "string",
    "price": "number",
    "stock": "integer"
    "category": "string",
    "theme": "string",
    "productType": "string",
    "img": "string"
}

Response: 400 Bad Request
{
    "message": "Error obteniendo el detalle del producto"
}

Response: 404 Not Found 
{
    "message": "Producto no encontrado"
}
```
