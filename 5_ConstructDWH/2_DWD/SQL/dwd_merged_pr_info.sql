DROP TABLE IF EXISTS dwd_merged_pr_info;

CREATE EXTERNAL TABLE dwd_merged_pr_info(
    pull_merged_commit_sha STRING COMMENT 'pr合并标识',
    pr_merged_id STRING COMMENT '合并pr的开发者ID',
    pr_merged_login STRING COMMENT '合并pr的开发者登录名',
    pr_merged_type STRING COMMENT '合并pr的开发者类型',
    pr_merged_at STRING COMMENT '合并pr的时间'
)COMMENT 'pr合并事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_merged_pr_info'
TBLPROPERTIES("parquet.compression"="lzo");