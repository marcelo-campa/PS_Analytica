SELECT ano,sigla_uf, sum(area_plantada) as area_total_plantada FROM `basedosdados.br_ibge_pam.municipio_lavouras_permanentes`
where ano >= 1994 and ano <=2018
group by  sigla_uf, ano
order by sigla_uf, ano