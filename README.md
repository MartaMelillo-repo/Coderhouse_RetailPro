Contexto

# RetailPro — Proyecto de Data Analytics

## Objetivo

Proyecto académico desarrollado durante el curso de Data Analytics.
Analiza ventas de productos tecnológicos e integra consultas SQL,
preparación de datos y trabajo en Power BI.

## Herramientas

- SQL Server y SQL Server Management Studio (SSMS).
- Power BI Desktop.
- Power Query.
- DAX.
- GitHub.
- ChatGPT como apoyo para revisión y documentación.

## Archivos del repositorio

- `ventas_tech_db.sql`: creación de la base, cuatro tablas y datos de ejemplo.
- `m4_consultas_negocio.sql`: resumen mensual, Top 5 de productos,
  clientes con varias operaciones y comparación con el promedio mensual.
- `m5_consultas_joins.sql`: consultas con INNER JOIN, LEFT JOIN
  y consolidación de períodos mediante UNION ALL.
- `Pipeline_ETL_Melillo_Marta.pbix`: archivo de la etapa de preparación de datos.
- `Melillo_Marta_Checkpoint2.pbix`: archivo de modelado y validación en Power BI.

## Base de datos

El script inicial crea la base `Ventas_Tech_DB` y las tablas:

- `categorias`
- `clientes`
- `productos`
- `ventas`

La primera consulta de M5 utiliza además `territorios`,
`clientes.segmento`, `ventas.id_territorio` y `ventas.canal`.
Estos elementos no están definidos en el script inicial incluido.

## Ejecución y compatibilidad

1. Abrir SSMS y conectarse a SQL Server.
2. Ejecutar `ventas_tech_db.sql` en un entorno nuevo donde no existan
   la base ni sus tablas. El script no está preparado para repetirse
   sin gestionar previamente los objetos existentes.
3. Verificar la creación y carga de `Ventas_Tech_DB`.
4. Seleccionar esa base antes de trabajar con las consultas.
5. Antes de ejecutar M4 en SQL Server, adaptar `EXTRACT` y `LIMIT`
   al dialecto correspondiente, por ejemplo `MONTH()` y `TOP (5)`.
   Para comparar períodos de distintos años, agrupar también por año.
6. Antes de ejecutar la primera consulta de M5, disponer de la tabla
   y los campos adicionales que utiliza. Los archivos incluidos
   no contienen el script de ampliación correspondiente.
7. Contrastar los resultados con los registros originales.

Estas observaciones documentan las condiciones de reproducción
de los scripts aprobados, que se conservan como archivos del proyecto.

## Alcance de los datos

La carga inicial contiene 10 operaciones de marzo de 2024,
con un importe total de 6.444 y cinco clientes distintos.

Esta muestra no permite identificar estacionalidad ni medir
retención entre períodos. La consulta de clientes recurrentes
cuenta filas de ventas por cliente.

Los importes se calculan como cantidad por precio unitario.
El script no identifica la moneda.

## Power BI

El proyecto continúa mediante los dos archivos PBIX incluidos.
El archivo Checkpoint contiene una página de validación que referencia
Total Ventas, Ventas YTD, Ventas LY y crecimiento anual.

La actualización, las relaciones y los cálculos deben verificarse
en Power BI Desktop. Los resultados de M4 corresponden a la carga SQL
inicial y no deben asumirse como resultados de los PBIX sin contrastarlos.

## Uso de IA

La IA se utiliza como apoyo para revisar consultas, proponer hallazgos
y preparar documentación. Sus respuestas se contrastan con los
archivos y datos originales antes de aceptarse.

## Repositorio

https://github.com/MartaMelillo-repo/Coderhouse_RetailPro
