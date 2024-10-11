SELECT

AVG(ASwind_speed) AS avg_max_wind,

FROM

`cloudyreginaldo.weather_data.tempo`

WHERE

date BETWEEN '2023-12-01' AND '2023-12-31'
