-- ==============================================================================
-- Proyecto RetailPro: Módulo 5 - Consultas con JOINs (Refactorizado)
-- Archivo: m5_consultas_joins.sql
-- ==============================================================================

USE Ventas_Tech_DB;

-- ==============================================================================
-- Consulta 1 — Vista base del proyecto (INNER JOIN)
-- ==============================================================================
SELECT 
    v.fecha_venta AS fecha,
    c.nombre AS nombre_cliente,
    c.segmento,
    t.region,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta,
    v.canal
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
INNER JOIN territorios t ON v.id_territorio = t.id_territorio;
-- ==============================================================================
-- Consulta 2 — Clientes sin ventas (LEFT JOIN)
-- ==============================================================================
SELECT 
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- ==============================================================================
-- Consulta 3 — Productos sin ventas (LEFT JOIN)
-- ==============================================================================
SELECT 
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;
-- ==========================================================
-- Consulta 4 - Consolidado por período de tiempo (UNION ALL)
-- Con control de nulos para presentación ejecutiva
-- ==========================================================
SELECT 
    'Primer Trimestre (Q1)' AS periodo_analisis,
    ISNULL(SUM(cantidad * precio_unitario), 0) AS facturacion_total
FROM ventas
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-03-31'

UNION ALL

SELECT 
    'Segundo Trimestre (Q2)' AS periodo_analisis,
    ISNULL(SUM(cantidad * precio_unitario), 0) AS facturacion_total
FROM ventas
WHERE fecha_venta BETWEEN '2024-04-01' AND '2024-06-30';