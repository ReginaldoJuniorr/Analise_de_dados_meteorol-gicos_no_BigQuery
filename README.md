# ☀️Análise de Dados Meteorológicos: Estações La Guardia e JFK (2023)

## Cenário proposto 

Neste projeto, fui o analista de dados de uma estação de notícias local. Recebi a tarefa de responder a perguntas para meteorologistas sobre o clima. Trabalhei com dados públicos da Administração Nacional Oceânica e Atmosférica (NOAA, na sigla em inglês), que possui dados de todo o EUA. Os meteorologistas com quem "estava trabalhando" pediram **informações diárias sobre temperatura, velocidade do vento e chuvas das estações de La Guardia e JFK referentes a 2023, em ordem decrescente de data e ordem crescente de ID da estação**.
> **Nota**: Este projeto foi criado como parte do curso "Google Data Analytics Professional Certificate".

## Utilizando a consulta:

``` 
SELECT 

stn,

date,

-- Aqui usei a função IF para substituir valores 9999.9(referem-se ao valor padrão quando dados de temperatura estão faltando) para NULL. 

IF(temp = 9999.9, NULL, temp) AS temperature,

-- Aqui usei a função IF para substituir valores 999.9(referem-se ao valor padrão quando dados de velocidade do vento estão faltando) para NULL. 

IF(wdsp="999.9", NULL, CAST(wdsp AS Float64)) ASwind_speed,

-- Aqui usei a função IF para substituir valores 99.99(referem-se ao valor padrão quando dados de chuva estão faltando) para NULL. 

IF(prcp = 99.99, 0, prcp) AS precipitation 

FROM `bigquery-public-data.noaa_gsod.gsod2023` 

WHERE stn="725030" -- La Guardia

OR stn="744860" -- JFK 

ORDER BY date DESC, stn ASC 
```

 ## Obtive a seguinte tabela:
---
>Nota:
> - stn 725030 = La Guardia
> - stn 744860 = JFK

| stn |date|temperature|ASwind_speed|precipitation|
|----:|---:|----------:|-----------:|------------:|
|725030|2023-12-31|41.8|11.3|0.0|
|744860|2023-12-31|41.1|11.6|0.0|
|725030|2023-12-30|44.9|10.9|0.01|
|744860|2023-12-30|43.9|12.2|0.02|
|725030|2023-12-29|49.6|6.7|0.09|
|744860|2023-12-29|48.7|6.3|0.06|
|725030|2023-12-28|49.1|12.7|1.31|
|744860|2023-12-28|50.3|10.9|1.7|
|725030|2023-12-27|44.1|6.0|0.0|
|744860|2023-12-27|43.2|4.0|0.0|
---
> OBS: Trouxe somente as 10 primeiras linhas, a tabela completa estará disponivel para [download aqui](https://github.com/ReginaldoJuniorr/Analise_de_dados_meteorol-gicos_no_BigQuery/blob/main/resultado_da_consulta.xlsx).

##  Apresentando os dados, os meteorologistas me pediram um **gráfico de colunas com linha**, contendo a média anual sendo as colunas a velocidade média do vento e a média de temperatura, e a linha a precipitação. Utilazando o PowerBI fiz o gráfico a baixo como foi pedido:

![Captura de tela 2025-01-25 205709](https://github.com/user-attachments/assets/4864303b-86c5-48ff-b7e1-54af9fc9815b)

## Os meteorologistas também fizeram algumas perguntas enquanto se preparavam para as notícias da noite: eles gostariam de saber a *temperatura média de junho de 2023* e a *velocidade média do vento de dezembro de 2023*.

**Temperatura Média - Junho de 2023: Utilizei a função AVG combinada com BETWEEN para calcular a temperatura média nas estações de JFK e La Guardia entre 1º e 30 de junho de 2023.**
  
  ```
  SELECT
  AVG(temperature) AS avg_temp
  FROM
  `cloudyreginaldo.weather_data.tempo`
  WHERE
  date BETWEEN '2023-06-01' AND '2023-06-30'
  ```
**Resultado**
  
|Linha  |avg_temp|
|:-----:|:------:|
|1      |68.74   |

---
>OBS: O código escrito para a consulta também está neste [arquivo](https://github.com/ReginaldoJuniorr/Analise_de_dados_meteorol-gicos_no_BigQuery/blob/main/codigo_da_consulta_avg_temp)

**Velocidade Média do Vento - Dezembro de 2023: Da mesma forma, calculei a velocidade média do vento para o mês de dezembro de 2023.**
```
SELECT
AVG(ASwind_speed) AS avg_max_wind,
FROM
`cloudyreginaldo.weather_data.tempo`
WHERE
date BETWEEN '2023-12-01' AND '2023-12-31'
```

|Linha  |avg_max_wind|
|:-----:|:------:|
|1      |9.07   |

---
>OBS: O código escrito para a consulta também está neste [arquivo](https://github.com/ReginaldoJuniorr/Analise_de_dados_meteorol-gicos_no_BigQuery/blob/main/codigo_da_consulta_avg_max_wind)
