DROP TABLE IF EXISTS dwd_full_request_info;

CREATE EXTERNAL TABLE dwd_full_request_info(
    id STRING COMMENT '唯一标识pr',
    github_id STRING COMMENT '提pr的开发者',
    repo_id STRING COMMENT 'pr所属仓库ID',
    create_at STRING COMMENT 'pr创建时间',
    pull_commits STRING COMMENT 'pr提交次数',
    pull_additions STRING COMMENT 'pr添加的行数',
    pull_deletions STRING COMMENT 'pr删除的行数',
    pull_changed_files STRING COMMENT '更改的文件个数',
    pull_merged STRING COMMENT 'pr是否被合并',
    pull_merged_commit_sha STRING COMMENT 'pr合并标识',
    pull_review_comments STRING COMMENT '审查数',
    pull_requested_reviewer_id STRING COMMENT '审查pr的ID',
    pull_requested_reviewer_login STRING COMMENT '审查pr的github登录名',
    pull_requested_reviewer_type STRING COMMENT '审查pr的用户类型'
)COMMENT 'pull request事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_pull_request_info'
TBLPROPERTIES("parquet.compression"="lzo");