DROP TABLE IF EXISTS dws_issue_count;

CREATE EXTERNAL TABLE dws_issue_count(
    repo_id STRING COMMENT '仓库ID',
    github_id STRING COMMENT '开发者ID',
    issue_id STRING COMMENT 'issueID',
    issue_title STRING COMMENT 'issue标题',
    issue_body STRING COMMENT 'issue内容',
    issue_create_at STRING COMMENT 'issue创建时间',
    issue_closed_at STRING COMMENT 'issue关闭时间',
    issue_assign_count BIGINT COMMENT 'issue协作者数量',
    issue_comment_count BIGINT COMMENT 'issue评论数量'
) COMMENT 'issue维度汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_issue_count'
TBLPROPERTIES("parquet.compression"="lzo");