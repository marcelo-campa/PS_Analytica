SELECT ano as anos, sigla_uf , sigla_partido
FROM `basedosdados.br_tse_eleicoes.resultados_candidato_municipio`
where (sigla_uf = 'AC' or
sigla_uf = 'MA' or sigla_uf = 'PA' or sigla_uf = 'RO' or
sigla_uf = 'TO' or sigla_uf = 'RR' or sigla_uf = 'AM' or
sigla_uf = 'AP' OR sigla_uf = 'MT' 
)
and tipo_eleicao = 'eleicao ordinaria'and resultado= 'eleito' and cargo = 'governador'
group by ano, sigla_uf, sigla_partido
order by sigla_uf, ano