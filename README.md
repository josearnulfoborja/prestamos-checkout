# InventarioPlus – Sistema de Préstamos y Gestión de Equipos

**InventarioPlus** es una solución integral para gestionar el préstamo, devolución y seguimiento de equipos en entornos académicos, técnicos o corporativos. Diseñado para facilitar la organización, trazabilidad y equidad en el uso de recursos.

## 🚀 Funcionalidades principales
- Registro y categorización de equipos
- Solicitud y aprobación de préstamos
- Control de fechas de entrega y devolución
- Historial por usuario y por equipo
- Alertas automáticas de vencimiento
- Panel de administración y reportes

## 🛠️ Tecnologías utilizadas
- **Backend**: Jakarta EE 8 (JAX-RS)
- **Framework**: Java EE / Jakarta EE
- **Build Tool**: Maven
- **Java Version**: Java 8
- **Application Server**: Compatible con servidores Jakarta EE (GlassFish, Payara, WildFly, etc.)
- **Base de datos**: JPA/Hibernate compatible (PostgreSQL, MySQL, etc.)

## 📁 Estructura del proyecto
```
InventarioPlus/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/mycompany/inventarioplus/
│   │   │       ├── JakartaRestConfiguration.java
│   │   │       └── resources/
│   │   │           └── JakartaEE8Resource.java
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   │       └── persistence.xml
│   │   └── webapp/
│   │       ├── index.html
│   │       ├── META-INF/
│   │       │   └── context.xml
│   │       └── WEB-INF/
│   │           ├── beans.xml
│   │           └── web.xml
├── pom.xml
└── README.md
```

## 📦 Instalación

### Prerrequisitos
- Java 8 o superior
- Maven 3.6+
- Servidor de aplicaciones Jakarta EE 8 compatible (GlassFish, Payara, WildFly, etc.)
- Base de datos (PostgreSQL, MySQL, etc.)

### Pasos de instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/josearnulfoborja/prestamos-checkout.git
   cd prestamos-checkout/InventarioPlus
   ```

2. **Compilar el proyecto**
   ```bash
   mvn clean compile
   ```

3. **Ejecutar tests (si están disponibles)**
   ```bash
   mvn test
   ```

4. **Generar el archivo WAR**
   ```bash
   mvn clean package
   ```

5. **Despliegue**
   - Copiar el archivo `target/InventarioPlus-1.0-SNAPSHOT.war` al directorio de despliegue de tu servidor de aplicaciones
   - O usar la consola de administración de tu servidor para desplegar la aplicación

## ⚙️ Configuración

### Base de datos
Edita el archivo `src/main/resources/META-INF/persistence.xml` para configurar tu base de datos:

```xml
<!-- Ejemplo de configuración para PostgreSQL -->
<property name="javax.persistence.jdbc.url" value="jdbc:postgresql://localhost:5432/inventarioplus"/>
<property name="javax.persistence.jdbc.user" value="tu_usuario"/>
<property name="javax.persistence.jdbc.password" value="tu_password"/>
```

### Servidor de aplicaciones
Configura el contexto de la aplicación en `src/main/webapp/META-INF/context.xml` según tu servidor de aplicaciones.

## 🔧 Desarrollo

### Ejecutar en modo desarrollo
```bash
# Con Maven y un servidor embebido (si está configurado)
mvn clean compile exec:java

# O despliega en tu servidor de desarrollo local
mvn clean package
# Luego despliega el WAR generado
```

### API REST
La aplicación expone servicios REST configurados en:
- **Configuración**: `JakartaRestConfiguration.java`
- **Recursos**: `resources/JakartaEE8Resource.java`

Endpoint base: `http://localhost:8080/InventarioPlus/api/`

## 🤝 Contribución
1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia
Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Contacto
- **Desarrollador**: Jose Arnulfo Borja
- **Repositorio**: https://github.com/josearnulfoborja/prestamos-checkout
- **Proyecto**: InventarioPlus

## 📝 Notas adicionales
- Asegúrate de tener configurado correctamente tu servidor de aplicaciones Jakarta EE
- Revisa la configuración de la base de datos antes del primer despliegue
- Para producción, considera configurar un pool de conexiones en tu servidor de aplicaciones