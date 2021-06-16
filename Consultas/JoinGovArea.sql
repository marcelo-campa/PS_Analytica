select ano, sigla_uf , areatotal ,sigla_partido from 

(SELECT ano , estado_abrev, SUM(area) as areatotal FROM `basedosdados.br_mapbiomas_estatisticas.cobertura_estado_bioma_classe`
where 
(nivel_1 like '%floresta%' or nivel_1 like '%formacao%')
and tipo_dado = 'cobertura' and bioma = 'amazonia'
group by ano, estado_abrev
order by estado_abrev, ano
) t1

inner join 

(SELECT ano as anos, sigla_uf , sigla_partido
FROM `basedosdados.br_tse_eleicoes.resultados_candidato_municipio`
where (sigla_uf = 'AC' or
sigla_uf = 'MA' or sigla_uf = 'PA' or sigla_uf = 'RO' or
sigla_uf = 'TO' or sigla_uf = 'RR' or sigla_uf = 'AM' or
sigla_uf = 'AP' OR sigla_uf = 'MT' 
)
and tipo_eleicao = 'eleicao ordinaria'and resultado= 'eleito' and cargo = 'governador'
group by ano, sigla_uf, sigla_partido
order by sigla_uf, ano) t2

on t1.estado_abrev = t2.sigla_uf
and t1.ano = t2.anos
order by sigla_uf, ano
