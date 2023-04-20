DROP TABLE IF EXISTS dws_github_count;

CREATE EXTERNAL TABLE dws_github_count(
    github_total_developers BIGINT COMMENT '总开发者数',
    github_total_orgs BIGINT COMMENT '总组织数',
    github_total_repos BIGINT COMMENT '总仓库数',
    github_new_repos_count BIGINT COMMENT '新增仓库数',
    github_new_orgs_count BIGINT COMMENT '新增组织数',
    github_new_developers_count BIGINT COMMENT '新增开发者数'
) COMMENT 'github全域主题汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_github_count'
TBLPROPERTIES("parquet.compression"="lzo");