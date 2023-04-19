DROP TABLE IF EXISTS dwd_issue_info;

CREATE EXTERNAL TABLE dwd_issue_info(
    id STRING COMMENT 'issue唯一标识',
    number STRING COMMENT 'issue在仓库中号码',
    author_id STRING COMMENT 'issue的创建者ID',
    repo_id STRING COMMENT 'issue所属仓库ID',
    title STRING COMMENT 'issue的标题',
    labels_name ARRAY<STRING> COMMENT 'issue的标签',
    labels_color ARRAY<STRING> COMMENT 'issue标签的颜色',
    labels_default STRING COMMENT 'issue的默认标签',
    labels_description STRING COMMENT 'issue的描述',
    assignee_id STRING COMMENT 'issue协作者ID',
    assignee_login STRING COMMENT 'issue协作者github登录ID',
    create_at STRING COMMENT 'issue的创建时间',
    update_at STRING COMMENT 'issue的更新时间',
    comments STRING COMMENT 'issue的评论数',
    closed_at STRING COMMENT 'issue的关闭时间'
)COMMENT 'issue事实表'
PARTITIONED BY(dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_issue_info'
TBLPROPERTIES("parquet.compression"="lzo");
