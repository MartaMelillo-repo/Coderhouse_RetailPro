-- ==============================================================================
-- Proyecto RetailPro: Módulo 5 - Consultas con JOINs
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

-- ==============================================================================
-- Consulta 4 — Consolidado por canal (UNION ALL)
-- ==============================================================================
SELECT 
    canal,
    SUM(total_venta) AS total_por_canal
FROM (
    SELECT 
        id_venta, 
        (cantidad * precio_unitario) AS total_venta, 
        'Online' AS canal
    FROM ventas 
    WHERE canal = 'Online'
    
    UNION ALL
    
    SELECT 
        id_venta, 
        (cantidad * precio_unitario) AS total_venta, 
        'Presencial' AS canal
    FROM ventas 
    WHERE canal = 'Presencial'
) AS consolidado_canales
GROUP BY canal;