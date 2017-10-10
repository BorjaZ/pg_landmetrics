/*
Number of Patches - devuelve el número de polígonos que corresponden a una categoría.
*/

--SAMPLE USAGE:
/*
SELECT c_numpatches(geom, category) As c_numpatches, category FROM sample_patches;
*/


CREATE OR REPLACE FUNCTION c_numpatches(geom geometry, category text)
RETURNS metric AS 
$$

SELECT ('Number of patches'::text, SUM(St_NumGeometries(geom)),'')::metric GROUP BY category;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION c_numpatches(geom geometry, category text) IS 'Calcula el número de polígonos de la misma categoría.';
