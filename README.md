Contexto

# RetailPro — Proyecto de Data Analytics

RetailPro es un proyecto académico desarrollado durante el curso de Data Analytics.

El objetivo es analizar información comercial relacionada con ventas de productos tecnológicos y transformar los datos en información útil para la toma de decisiones.

## Herramientas utilizadas

- SQL Server
- SQL
- Power BI
- Power Query
- DAX
- GitHub

## Base de datos

La base utilizada en el proyecto se denomina:

Ventas_Tech_DB

Contiene información relacionada con:

- ventas;
- clientes;
- productos;
- categorías;
- territorios.

## Archivos SQL principales

### ventas_tech_db.sql

Contiene la creación inicial de la base de datos, tablas y registros utilizados en el proyecto.

### m4_consultas_negocio.sql

Contiene consultas orientadas al análisis de negocio, entre ellas:

- facturación;
- ranking de productos;
- clientes recurrentes;
- comparación de ventas.

### m5_consultas_joins.sql

Contiene consultas que integran diferentes tablas mediante:

- INNER JOIN;
- LEFT JOIN;
- UNION ALL.

## Ejecución de los scripts

Para reproducir el proyecto:

1. Abrir SQL Server Management Studio.
2. Ejecutar `ventas_tech_db.sql`.
3. Verificar que la base `Ventas_Tech_DB` haya sido creada correctamente.
4. Ejecutar `m4_consultas_negocio.sql`.
5. Ejecutar `m5_consultas_joins.sql`.
6. Verificar los resultados obtenidos.
7. Utilizar los datos preparados como fuente para el análisis posterior en Power BI.

## Power BI

El proyecto continúa en Power BI mediante procesos de:

- extracción de datos;
- transformación con Power Query;
- modelado;
- creación de medidas DAX;
- construcción de visualizaciones;
- generación de insights.

## Objetivo analítico

El proyecto busca transformar datos transaccionales en información útil para analizar el comportamiento de ventas, productos y clientes y facilitar la toma de decisiones comerciales.
