SELECT 

stn,

date,

-- Aqui usei a função IF para substituir valores 9999.9(referem-se ao valor padrão quando dados de temperatura estão faltando) para NULL no lugar. 

IF(temp = 9999.9, NULL, temp) AS temperature,

-- Aqui usei a função IF para substituir valores 999.9(referem-se ao valor padrão quando dados de velocidade do vento estão faltando) para NULL no lugar. 

IF(wdsp="999.9", NULL, CAST(wdsp AS Float64)) ASwind_speed,

-- Aqui usei a função IF para substituir valores 99.99(referem-se ao valor padrão quando dados de chuva estão faltando) para NULL no lugar. 

IF(prcp = 99.99, 0, prcp) AS precipitation 

FROM `bigquery-public-data.noaa_gsod.gsod2023` 

WHERE stn="725030" -- La Guardia

OR stn="744860" -- JFK 

ORDER BY date DESC, stn ASC
