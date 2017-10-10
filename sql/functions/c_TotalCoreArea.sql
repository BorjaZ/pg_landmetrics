/*
Total Core Area - devuelve la suma de los núcleos de las áreas (m²) de cada polígono correspondiente al tipo de polígono, dividido por 10.000 (unidades: Hectáreas).
*/

--SAMPLE USAGE:
/*
SELECT c_totalcorearea(geom, category) As c_totalcorearea, category FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION c_totalcorearea(geom geometry, category text)
RETURNS metric AS 
$$

SELECT ('Total Core Area'::text, SUM(St_Area(St_Buffer(geom, -100)))/10000,'Hectáreas.'::text)::metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION c_totalcorearea(geom geometry, category text) IS 'Suma las áreas de los núcleos de cada polígono de la misma categoría dividido por 10.000 para devolver un valor en Hectáreas.';

