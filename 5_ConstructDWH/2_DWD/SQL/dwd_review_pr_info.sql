DROP TABLE IF EXISTS dwd_review_pr_info;

CREATE EXTERNAL TABLE dwd_review_pr_info(
    repo_id STRING COMMENT 'pr所属仓库',
    pull_review_id STRING COMMENT 'pr审查ID',
    pr_comment_id STRING COMMENT 'pr审查评论ID',
    pr_comment_path STRING COMMENT 'pr审查的文件路径',
    pr_comment_position STRING COMMENT 'pr审查评论的位置',
    pr_comment_author_id STRING COMMENT 'pr审查者githubID',
    pr_comment_author_login STRING COMMENT 'pr审查者github登录名',
    pr_comment_author_type STRING COMMENT 'pr审查者类型',
    pr_comment_author_association STRING COMMENT 'pr审查者和pr提出者的协作关系',
    pr_comment_create_at STRING COMMENT 'pr评论创建时间',
    pr_comment_update_at STRING COMMENT 'pr更新时间'
)COMMENT 'pr审查事实表'
PARTITIONED BY(dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_review_pr_info'
TBLPROPERTIES("parquet.compression"="lzo");