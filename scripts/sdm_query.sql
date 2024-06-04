with ${level} as level,
source as (
select level_4,level_3,level_2,level_1,month_name,`month`,`year`,
CASE 
	when df_flag = 'low' then 1
	when df_flag = 'medium' then 2
	when df_flag = 'high' then 3
	when df_flag = 'elite' then 4
	else 0
END as df_value,
CASE 
	when ctfc_flag = 'low' then 1
	when ctfc_flag = 'medium' then 2
	when ctfc_flag = 'high' then 3
	when ctfc_flag = 'elite' then 4
	else 0
END as ctfc_value,
CASE 
	when cfr_flag = 'low' then 1
	when cfr_flag = 'medium' then 2
	when cfr_flag = 'high' then 3
	when cfr_flag = 'elite' then 4
	else 0
END as cfr_value,
CASE 
	when mttr_flag = 'low' then 1
	when mttr_flag = 'medium' then 2
	when mttr_flag = 'high' then 3
	when mttr_flag = 'elite' then 4
	else 0
END
	mttr_value,
CASE 
	when ltfc_flag = 'low' then 1
	when ltfc_flag = 'medium' then 2
	when ltfc_flag = 'high' then 3
	when ltfc_flag = 'elite' then 4
	else 0
END ltfc_value

FROM consumption_layer.sdm where level_4 = level )
	

,final_aggr as
(
	select
	 level_4,level_3,level_2,level_1,
	(SUM(df_value) + SUM(ctfc_value) + SUM(cfr_value) + SUM(mttr_value) + SUM(ltfc_value)) as der_sum,
    countDistinct(case when df_value > 0 then 1 else null end) as df_value_cnt,
     countDistinct(case when ctfc_value > 0 then 1 else null end) as ctfc_value_cnt,
     countDistinct(case when cfr_value > 0 then 1 else null end) as cfr_value_cnt,
     countDistinct(case when mttr_value > 0 then 1 else null end) as mttr_value_cnt,
     countDistinct(case when ltfc_value > 0 then 1 else null end) as ltfc_value_cnt,
     month_name,`month`,`year`
from source
GROUP BY level_4,level_3,level_2,level_1, month_name,`month`,`year`
)
select level_4,level_3, month_name as monthyear, `month`,`year`,
sum(der_sum)/sum(ifNull(df_value_cnt,0)+ifNull(ctfc_value_cnt,0)+ifNull(cfr_value_cnt,0)+ifNull(mttr_value_cnt,0)+ifNull(ltfc_value_cnt,0)) as sdm_value,
(case
when sdm_value between 0.5 and 1.5 then 'low'
when sdm_value between 1.5 and 2.5 then 'medium'
when sdm_value between 2.5 and 3.5 then 'high'
when sdm_value between 3.5 and 4 then 'elite'
end) as sdm_flag
from final_aggr
group by 
    GROUPING SETS(
        (level_4,monthyear,`month`,`year`),(level_3,monthyear,`month`,`year`)) order by `year` asc, `month` asc
        
        
        