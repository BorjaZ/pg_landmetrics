## Nombre
lm.landscape_patchrichnessdensity --  Devuelve el número de las diferentes categorías de polígonos presentes dentro del límite del paisaje dividido por el área total (m²) del paisaje, multiplicado por 10.000 y 100 (unidades: número por 100 hectáreas).

## Synopsis

```sql
float patchrichnessdensity(geometry geom);

count(distinct label);
```

```tex
\[PRD= \frac{m}{A}\left ( 10.000 \right )\left ( 100 \right )\]
```

## Descripción

Esta fórmula también se puede calcular en formato ráster.

Descripción más elaborada, con ejemplos de uso en la literatura científica. ¿En qué casos ha sido útil (significaba algo)?


## Ejemplos (autocontenidos)


```sql
WITH  patches (geom,categ) AS (VALUES
                               (ST_GeomFromText('POLYGON((0 0,0 1,1 1,1 0,0 0))',25830),'Urbano'))

SELECT lm.l_patchrichnessdensity(geom, categ) As l_patchrichnessdensity, categ FROM patches;
```

## Referencias

1. Mcgarigal, K. (2015). Fragstats.Help.4.2, (April), 1–182. [https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf](https://www.umass.edu/landeco/research/fragstats/documents/fragstats.help.4.2.pdf)
