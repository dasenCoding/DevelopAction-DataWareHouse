DROP TABLE IF EXISTS dws_org_count;

CREATE EXTERNAL TABLE dws_org_count(
    org_total_members BIGINT COMMENT '组织总人数',
    org_new_members_count BIGINT COMMENT '组织新增人数',
    org_total_repo BIGINT COMMENT '组织拥有的仓库数',
    org_new_repo_count  BIGINT COMMENT '组织新增仓库数'
) COMMENT '组织主题汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_org_count'
TBLPROPERTIES("parquet.compression"="lzo");