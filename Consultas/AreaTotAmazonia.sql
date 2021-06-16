SELECT ano , estado_abrev, SUM(area) as areatotal FROM `basedosdados.br_mapbiomas_estatisticas.cobertura_estado_bioma_classe`
where 
(nivel_1 like '%floresta%' or nivel_1 like '%formacao%')
and tipo_dado = 'cobertura' and bioma = 'amazonia'
group by ano, estado_abrev
order by estado_abrev, ano