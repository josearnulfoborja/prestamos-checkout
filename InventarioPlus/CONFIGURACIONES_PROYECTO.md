# 🔧 Configuraciones Específicas del Proyecto PrestaEquipos

## ⚠️ **IMPORTANTE: Requerimientos para que funcione en otros equipos**

Este documento lista todas las configuraciones específicas que he añadido al proyecto y que pueden causar problemas si no están configuradas correctamente en otros equipos.

---

## 🎯 **Configuraciones Críticas Añadidas**

### 1. **🔴 JAVA 17 (CRÍTICO)**
```xml
<!-- En pom.xml -->
<source>17</source>
<target>17</target>
```

**⚠️ PROBLEMA:** El proyecto está configurado para Java 17
**✅ SOLUCIÓN:** Todos deben tener JDK 17 instalado

### 2. **🔴 JAKARTA EE 10.0.0 (CRÍTICO)**
```xml
<!-- En pom.xml -->
<jakartaee>10.0.0</jakartaee>
```

**⚠️ PROBLEMA:** Usa Jakarta EE (no javax)
**✅ SOLUCIÓN:** Solo funciona con Tomcat 10+ o servidores compatibles con Jakarta EE

### 3. **🔴 TOMCAT 10+ OBLIGATORIO (CRÍTICO)**
**⚠️ PROBLEMA:** Jakarta EE requiere Tomcat 10 o superior
**❌ NO FUNCIONA:** Tomcat 9, 8, 7
**✅ FUNCIONA:** Tomcat 10.1.x, 11.x

---

## 📋 **Lista Completa de Dependencias Específicas**

### Maven Dependencies:
```xml
<!-- Jakarta EE API -->
<dependency>
    <groupId>jakarta.platform</groupId>
    <artifactId>jakarta.jakartaee-api</artifactId>
    <version>10.0.0</version>
    <scope>provided</scope>
</dependency>

<!-- JSTL Jakarta -->
<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
    <version>3.0.0</version>
</dependency>

<dependency>
    <groupId>org.glassfish.web</groupId>
    <artifactId>jakarta.servlet.jsp.jstl</artifactId>
    <version>3.0.1</version>
</dependency>

<!-- Jakarta Expression Language -->
<dependency>
    <groupId>org.glassfish</groupId>
    <artifactId>jakarta.el</artifactId>
    <version>4.0.2</version>
</dependency>

<!-- MySQL Connector -->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.0.33</version>
</dependency>
```

---

## 🛠️ **Configuraciones en web.xml**

### Filtro UTF-8 Personalizado:
```xml
<!-- Filtro de codificación UTF-8 -->
<filter>
    <filter-name>CharacterEncodingFilter</filter-name>
    <filter-class>org.apache.catalina.filters.SetCharacterEncodingFilter</filter-class>
    <init-param>
        <param-name>encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <init-param>
        <param-name>ignore</param-name>
        <param-value>false</param-value>
    </init-param>
</filter>

<!-- Configuración de JSP para UTF-8 -->
<jsp-config>
    <jsp-property-group>
        <url-pattern>*.jsp</url-pattern>
        <page-encoding>UTF-8</page-encoding>
    </jsp-property-group>
</jsp-config>
```

---

## 💻 **Archivos Java Específicos Creados**

### 1. **UTF8EncodingFilter.java**
```java
@WebFilter(filterName = "UTF8EncodingFilter", urlPatterns = {"/*"})
public class UTF8EncodingFilter implements Filter
```
**Función:** Maneja la codificación UTF-8 automáticamente

### 2. **JakartaRestConfiguration.java**
```java
@ApplicationPath("resources")
public class JakartaRestConfiguration extends Application
```
**Función:** Configuración para REST APIs (Jakarta)

---

## 🌐 **Librerías CDN Externas**

### En layout.jsp:
```html
<!-- Bootstrap 5.3.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome 6.4.0 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
```

**⚠️ PROBLEMA:** Requiere conexión a internet
**✅ SOLUCIÓN:** Trabajar con internet o descargar librerías localmente

---

## 🔧 **Configuración de IDE Recomendada**

### Para NetBeans:
```
- JDK: 17
- Servidor: Tomcat 10.1.x
- Encoding: UTF-8
- Maven: 3.8+
```

### Para IntelliJ IDEA:
```
- Project SDK: 17
- Language Level: 17
- Application Server: Tomcat 10.1.x
- File Encoding: UTF-8
```

### Para Eclipse:
```
- JRE: 17
- Server Runtime: Tomcat 10.1.x
- Workspace Encoding: UTF-8
- Project Facets: Java 17, Dynamic Web Module 4.0
```

---

## 📦 **Paso a Paso para Configurar en Otro Equipo**

### 1. **Instalar JDK 17**
```bash
# Verificar versión
java -version
javac -version
```
**Debe mostrar:** `openjdk version "17.x.x"`

### 2. **Descargar Tomcat 10.1.x**
- **URL:** https://tomcat.apache.org/download-10.cgi
- **Versión:** 10.1.46 o superior
- **⚠️ NO usar:** Tomcat 9.x o inferior

### 3. **Configurar Maven**
```bash
# Verificar Maven
mvn -version
```
**Debe mostrar:** `Apache Maven 3.8.x` o superior

### 4. **Verificar Variables de Entorno**
```bash
# Windows
echo %JAVA_HOME%
echo %MAVEN_HOME%

# Linux/Mac
echo $JAVA_HOME
echo $MAVEN_HOME
```

### 5. **Compilar el Proyecto**
```bash
cd prestamos-checkout/InventarioPlus
mvn clean compile
mvn clean package
```

### 6. **Desplegar en Tomcat**
```bash
# Copiar WAR generado
cp target/InventarioPlus-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

---

## ❌ **Errores Comunes y Soluciones**

### Error: "jakarta.servlet no existe"
**Causa:** Usando Tomcat 9 o inferior
**Solución:** Actualizar a Tomcat 10+

### Error: "java.lang.UnsupportedClassVersionError"
**Causa:** JDK incorrecto (usando Java 8, 11, etc.)
**Solución:** Instalar JDK 17

### Error: "JSTL tags no funcionan"
**Causa:** Falta JSTL o versión incorrecta
**Solución:** Verificar dependencias Maven

### Error: "Caracteres raros (ñ, tildes)"
**Causa:** Problemas de encoding
**Solución:** Verificar filtros UTF-8 en web.xml

### Error: "Bootstrap no carga"
**Causa:** Sin conexión a internet
**Solución:** Descargar Bootstrap localmente

---

## 📋 **Checklist de Verificación**

Para que el proyecto funcione en otro equipo, verificar:

- [ ] ✅ JDK 17 instalado y configurado
- [ ] ✅ Maven 3.8+ instalado
- [ ] ✅ Tomcat 10.1.x descargado
- [ ] ✅ Variables JAVA_HOME y MAVEN_HOME configuradas
- [ ] ✅ IDE configurado para Java 17
- [ ] ✅ Conexión a internet (para CDNs)
- [ ] ✅ Puerto 8080 disponible
- [ ] ✅ Permisos de escritura en directorio Tomcat

---

## 🚀 **Versión Simplificada (Para Compatibilidad)**

Si quieren una versión que funcione con Tomcat 9, puedo crear una versión alternativa con:

- **javax** en lugar de jakarta
- **Java 11** en lugar de 17
- **Dependencias compatibles** con Tomcat 9

**¿Quieren que cree esta versión de compatibilidad?**

---

## 📞 **Solución Rápida para el Equipo**

### Opción 1: **Actualizar Todo el Equipo**
```bash
# Instalar JDK 17
# Descargar Tomcat 10.1.x
# Configurar IDEs
```

### Opción 2: **Crear Versión Compatible**
Puedo modificar el proyecto para que funcione con:
- Java 11
- Tomcat 9
- javax en lugar de jakarta

### Opción 3: **Docker (Recomendado)**
Crear un contenedor Docker con todas las configuraciones listas.

---

**¿Cuál opción prefieren? ¿Actualizar todo o crear versión compatible?** 🤔