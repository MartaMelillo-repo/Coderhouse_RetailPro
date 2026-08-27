-- ==============================================================================
-- Proyecto RetailPro: Módulo 4 - Consultas de Negocio
-- Archivo: m4_consultas_negocio.sql
-- ==============================================================================

-- Consulta 1 — Resumen ejecutivo mensual
SELECT 
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta);

-- Consulta 2 — Ranking de productos (Top 5)
SELECT 
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
LIMIT 5;

-- Consulta 3 — Clientes recurrentes
SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- Consulta 4 — Meses por encima/por debajo del promedio
WITH VentasMensuales AS (
    SELECT 
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)
),
PromedioGeneral AS (
    SELECT AVG(total_facturado) AS prom_general 
    FROM VentasMensuales
)
SELECT 
    v.mes,
    v.total_facturado,
    CASE 
        WHEN v.total_facturado > p.prom_general THEN 'Por encima'
        WHEN v.total_facturado < p.prom_general THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS estado_vs_promedio
FROM VentasMensuales v
CROSS JOIN PromedioGeneral p;

-- ==============================================================================
-- BLOQUE DE CIERRE: Hallazgos encontrados en los datos
-- ==============================================================================
-- 1. Concentración de facturación extrema: El producto con id_producto = 1 concentra más del 55% de la facturación total del trimestre ($3,600 sobre un total general de $6,444).
-- 2. Tasa de retención perfecta (en la muestra): El 100% de los clientes (los 5 id_cliente distintos) son recurrentes, ya que todos registran exactamente 2 pedidos en la tabla de ventas.
-- 3. Estacionalidad atípica: La totalidad de las ventas registradas hasta el momento ocurrieron exclusivamente durante el mes de marzo (mes 3) de 2024, lo que provoca que el análisis de meses por encima/debajo del promedio devuelva a marzo como "Igual al promedio" por ser el único mes evaluado.
