DROP TABLE IF EXISTS dwd_issue_comment_info;

CREATE EXTERNAL TABLE dwd_issue_comment_info(
    id STRING COMMENT '评论ID',
    repo_id STRING COMMENT '评论所属仓库ID',
    issue_id STRING COMMENT '评论所属issueID',
    create_at STRING COMMENT '评论创建时间',
    updated_at STRING COMMENT '评论更新时间',
    author_association STRING COMMENT '评论者和开发者的关系',
    author_id STRING COMMENT '评论者的githubID',
    author_login STRING COMMENT '评论者的github登录名',
    author_type STRING COMMENT '评论者的类型'
)COMMENT 'issue讨论事实表'
PARTITIONED BY(dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_issue_comment_info'
TBLPROPERTIES("parquet.compression"="lzo");