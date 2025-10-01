/**
 * InventarioPlus - Validaciones Generales
 */

/**
 * Utilidades de validación para formularios
 */
const Validaciones = {
    
    /**
     * Validar que un campo no esté vacío
     */
    requerido: function(valor, nombreCampo = 'Campo') {
        if (!valor || valor.trim() === '') {
            return `${nombreCampo} es requerido.`;
        }
        return null;
    },
    
    /**
     * Validar formato de email
     */
    email: function(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!regex.test(email)) {
            return 'El formato del email no es válido.';
        }
        return null;
    },
    
    /**
     * Validar longitud mínima
     */
    longitudMinima: function(valor, minimo, nombreCampo = 'Campo') {
        if (valor.length < minimo) {
            return `${nombreCampo} debe tener al menos ${minimo} caracteres.`;
        }
        return null;
    },
    
    /**
     * Validar longitud máxima
     */
    longitudMaxima: function(valor, maximo, nombreCampo = 'Campo') {
        if (valor.length > maximo) {
            return `${nombreCampo} no puede tener más de ${maximo} caracteres.`;
        }
        return null;
    },
    
    /**
     * Validar que sea un número
     */
    numero: function(valor, nombreCampo = 'Campo') {
        if (isNaN(valor) || valor === '') {
            return `${nombreCampo} debe ser un número válido.`;
        }
        return null;
    },
    
    /**
     * Validar que sea un número positivo
     */
    numeroPositivo: function(valor, nombreCampo = 'Campo') {
        const numeroError = this.numero(valor, nombreCampo);
        if (numeroError) return numeroError;
        
        if (parseFloat(valor) <= 0) {
            return `${nombreCampo} debe ser un número positivo.`;
        }
        return null;
    },
    
    /**
     * Validar formato de teléfono
     */
    telefono: function(telefono) {
        const regex = /^[\+]?[1-9][\d]{0,15}$/;
        if (!regex.test(telefono.replace(/[\s\-\(\)]/g, ''))) {
            return 'El formato del teléfono no es válido.';
        }
        return null;
    },
    
    /**
     * Validar fecha
     */
    fecha: function(fecha, nombreCampo = 'Fecha') {
        if (!fecha || !Date.parse(fecha)) {
            return `${nombreCampo} no es una fecha válida.`;
        }
        return null;
    },
    
    /**
     * Validar que una fecha sea futura
     */
    fechaFutura: function(fecha, nombreCampo = 'Fecha') {
        const fechaError = this.fecha(fecha, nombreCampo);
        if (fechaError) return fechaError;
        
        const fechaInput = new Date(fecha);
        const hoy = new Date();
        hoy.setHours(0, 0, 0, 0);
        
        if (fechaInput <= hoy) {
            return `${nombreCampo} debe ser una fecha futura.`;
        }
        return null;
    },
    
    /**
     * Validar código de producto
     */
    codigoProducto: function(codigo) {
        const regex = /^[A-Z0-9]{3,10}$/;
        if (!regex.test(codigo)) {
            return 'El código debe tener entre 3-10 caracteres alfanuméricos en mayúsculas.';
        }
        return null;
    },
    
    /**
     * Validar precio
     */
    precio: function(precio) {
        const numeroError = this.numeroPositivo(precio, 'Precio');
        if (numeroError) return numeroError;
        
        if (parseFloat(precio) > 999999.99) {
            return 'El precio no puede ser mayor a $999,999.99';
        }
        return null;
    },
    
    /**
     * Validar stock
     */
    stock: function(stock) {
        const numeroError = this.numero(stock, 'Stock');
        if (numeroError) return numeroError;
        
        const stockNum = parseInt(stock);
        if (stockNum < 0) {
            return 'El stock no puede ser negativo.';
        }
        
        if (stockNum > 99999) {
            return 'El stock no puede ser mayor a 99,999 unidades.';
        }
        return null;
    }
};

/**
 * Utilidades para manejo de formularios
 */
const FormUtils = {
    
    /**
     * Validar formulario completo
     */
    validarFormulario: function(formulario, reglas) {
        const errores = {};
        let hayErrores = false;
        
        for (const campo in reglas) {
            const elemento = formulario.querySelector(`[name="${campo}"]`);
            if (!elemento) continue;
            
            const valor = elemento.value;
            const reglasDelCampo = reglas[campo];
            
            for (const regla of reglasDelCampo) {
                const error = regla.validador(valor, regla.mensaje || campo);
                if (error) {
                    errores[campo] = error;
                    hayErrores = true;
                    break;
                }
            }
        }
        
        this.mostrarErrores(formulario, errores);
        return !hayErrores;
    },
    
    /**
     * Mostrar errores en el formulario
     */
    mostrarErrores: function(formulario, errores) {
        // Limpiar errores anteriores
        formulario.querySelectorAll('.is-invalid').forEach(el => {
            el.classList.remove('is-invalid');
        });
        formulario.querySelectorAll('.invalid-feedback').forEach(el => {
            el.remove();
        });
        
        // Mostrar nuevos errores
        for (const campo in errores) {
            const elemento = formulario.querySelector(`[name="${campo}"]`);
            if (elemento) {
                elemento.classList.add('is-invalid');
                
                const errorDiv = document.createElement('div');
                errorDiv.className = 'invalid-feedback';
                errorDiv.textContent = errores[campo];
                
                elemento.parentNode.appendChild(errorDiv);
            }
        }
    },
    
    /**
     * Limpiar formulario
     */
    limpiarFormulario: function(formulario) {
        formulario.reset();
        formulario.querySelectorAll('.is-invalid').forEach(el => {
            el.classList.remove('is-invalid');
        });
        formulario.querySelectorAll('.invalid-feedback').forEach(el => {
            el.remove();
        });
    },
    
    /**
     * Serializar formulario a objeto
     */
    serializarFormulario: function(formulario) {
        const formData = new FormData(formulario);
        const objeto = {};
        
        for (let [clave, valor] of formData.entries()) {
            objeto[clave] = valor;
        }
        
        return objeto;
    },
    
    /**
     * Llenar formulario con datos
     */
    llenarFormulario: function(formulario, datos) {
        for (const campo in datos) {
            const elemento = formulario.querySelector(`[name="${campo}"]`);
            if (elemento) {
                elemento.value = datos[campo];
            }
        }
    }
};

/**
 * Utilidades para formateo de datos
 */
const FormatoUtils = {
    
    /**
     * Formatear precio
     */
    formatearPrecio: function(precio) {
        return new Intl.NumberFormat('es-CO', {
            style: 'currency',
            currency: 'COP'
        }).format(precio);
    },
    
    /**
     * Formatear número
     */
    formatearNumero: function(numero) {
        return new Intl.NumberFormat('es-CO').format(numero);
    },
    
    /**
     * Formatear fecha
     */
    formatearFecha: function(fecha) {
        return new Date(fecha).toLocaleDateString('es-CO');
    },
    
    /**
     * Formatear fecha y hora
     */
    formatearFechaHora: function(fecha) {
        return new Date(fecha).toLocaleString('es-CO');
    },
    
    /**
     * Capitalizar primera letra
     */
    capitalizar: function(texto) {
        return texto.charAt(0).toUpperCase() + texto.slice(1).toLowerCase();
    },
    
    /**
     * Limpiar texto para código
     */
    generarCodigo: function(texto) {
        return texto.toUpperCase()
                   .replace(/[^A-Z0-9]/g, '')
                   .substring(0, 10);
    }
};

// Hacer disponibles globalmente
window.Validaciones = Validaciones;
window.FormUtils = FormUtils;
window.FormatoUtils = FormatoUtils;