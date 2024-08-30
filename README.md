# ☀️⛈️Informações diárias sobre temperatura, velocidade do vento e chuvas das estações de La Guardia e JFK⛈️☀️

Nesse cenário, proposto pelo curso **Analisar os dados para responder às perguntas** da trilha **Certificado Profissional Google Data Analytics** fui o analista de dados de uma estação de notícias local. Recebi a tarefa de responder a perguntas para meteorologistas sobre o clima. Trabalhei com dados públicos da Administração Nacional Oceânica e Atmosférica (NOAA, na sigla em inglês), que possui dados de todo o EUA. Os meteorologistas com quem "estava trabalhando" pediram informações diárias sobre temperatura, velocidade do vento e chuvas das estações de La Guardia e JFK referentes a 2023, em ordem decrescente de data e ordem crescente de ID da estação.

Os dados não estavam limpos então utilizei a função *IF* para substituir valores 9999.9, que, segundo a descrição do conjunto de dados, referem-se ao valor padrão quando os dados de temperatura estão faltando, com *NULL* 
## Utilizando o código contido no arquivo a cima, Retornou a seguinte tabela:

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
> OBS: Troxe somente as 10 primeiras linhas, a tabela completa estará em arquivo.
