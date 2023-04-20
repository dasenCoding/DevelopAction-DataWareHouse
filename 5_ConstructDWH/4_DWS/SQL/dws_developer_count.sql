DROP TABLE IF EXISTS dws_developer_count;

CREATE EXTERNAL TABLE dws_developer_count(
    github_id STRING COMMENT '开发者id',
    github_login STRING COMMENT '开发者login',
    total_issue_count BIGINT COMMENT '开发者提出的总 issue 数',
    total_fock_repo_count BIGINT COMMENT '开发者 fock 总仓库数',
    total_push_count BIGINT COMMENT '开发者 push 总次数',
    total_review_count BIGINT COMMENT '开发者 review 总次数',
    total_pr_review_comment_count BIGINT COMMENT '开发者审查pr的评论总数',
    total_merged_pr_count BIGINT COMMENT '开发者 pr 合并的总次数',
    new_issue_count BIGINT COMMENT '当天提出的 issue 数',
    new_fock_repo_count BIGINT COMMENT '当天fock的仓库数',
    new_push_count BIGINT COMMENT 'push推送次数',
    new_review_count BIGINT COMMENT 'review的次数',
    new_pr_review_comment_count BIGINT COMMENT 'pr审查评论次数',
    new_merged_pr_count BIGINT COMMENT 'pr合并次数',
    new_branch_count BIGINT COMMENT '创建分支数',
    new_delete_branch_count BIGINT COMMENT '删除分支数',
    new_release_count BIGINT COMMENT '发布版本数',
    new_asset_count BIGINT COMMENT '上传资源数',
    new_contribute_daycount BIGINT COMMENT '连续贡献的天数',
    new_issues STRING COMMENT '开发者提出的 issues'
) COMMENT '开发者主题汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_developer_count'
TBLPROPERTIES("parquet.compression"="lzo");