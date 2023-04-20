DROP TABLE IF EXISTS  dws_pull_request_count;

CREATE EXTERNAL TABLE dws_pull_request_count(
    repo_id STRING COMMENT '仓库ID',
    github_id STRING COMMENT '开发者ID',
    pr_open_time STRING COMMENT 'pr开启时间',
    pr_closed_time STRING COMMENT 'pr关闭时间',
    pr_push_count BIGINT COMMENT 'pr推送次数',
    pr_new_codeline_count BIGINT COMMENT '新增代码行数',
    pr_delete_codeline_count BIGINT COMMENT '删除代码行数',
    pr_new_file_count BIGINT COMMENT '新增文件个数'
) COMMENT 'pr主题汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_pull_request_count'
TBLPROPERTIES("parquet.compression"="lzo");