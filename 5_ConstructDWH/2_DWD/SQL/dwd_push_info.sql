DROP TABLE IF EXISTS dwd_push_info;

CREATE EXTERNAL TABLE dwd_push_info(
    github_id STRING COMMENT '推送者githubID',
    github_login STRING COMMENT '推送这github登录名',
    repo_id STRING COMMENT '推送所属仓库',
    create_at STRING COMMENT '推送提交时间',
    push_id STRING COMMENT '推送ID',
    push_size STRING COMMENT '推送的提交次数',
    push_distinct_size STRING COMMENT '推送中不同类型的提交次数',
    push_ref STRING COMMENT '推送所属分支',
    push_head STRING COMMENT '推送的头部信息',
    push_commits_name STRING COMMENT '推送中提交的作者name',
    push_commits_email STRING COMMENT '推送中提交的作者email',
    push_commits_message STRING COMMENT '推送中提交的信息'
)COMMENT 'push事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_push_info'
TBLPROPERTIES("parquet.compression"="lzo");