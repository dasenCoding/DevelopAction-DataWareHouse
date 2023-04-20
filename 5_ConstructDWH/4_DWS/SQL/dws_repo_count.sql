DROP TABLE IF EXISTS dws_repo_count;

CREATE EXTERNAL TABLE dws_repo_count(
    repo_id STRING COMMENT '仓库id',
    repo_total_open_issues BIGINT COMMENT '仓库总 open issue 数',
    repo_total_closed_issues BIGINT COMMENT '仓库总 closed issue 数',
    repo_total_open_pr BIGINT COMMENT '仓库总 pr 数',
    repo_total_closed_pr BIGINT COMMENT '仓库总关闭 pr 数',
    repo_total_abdon_pr BIGINT COMMENT '仓库废弃 pr 数',
    repo_total_focks BIGINT COMMENT '仓库总 fock 数',
    repo_total_stars BIGINT COMMENT '仓库总 stars 数',
    repo_new_issue_count BIGINT COMMENT '仓库新增 issue 数',
    repo_new_bug_issue_count BIGINT COMMENT '仓库新增类型为 bug 的 issue 数',
    repo_closed_issue_count BIGINT COMMENT '仓库当日关闭 issue 数',
    repo_new_fock_count BIGINT COMMENT '仓库新增fock数',
    repo_new_star_count BIGINT COMMENT '仓库新增stars数',
    repo_new_pr_count BIGINT COMMENT '仓库新增 pr 数',
    repo_new_merged_pr_count BIGINT COMMENT '仓库合并 pr 数',
    repo_abdon_pr_count BIGINT COMMENT '仓库当天废弃 pr数',
    repo_language_percent BIGINT COMMENT '仓库各语言及其占比'
)COMMENT '仓库主题汇总表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dws/dws_repo_count'
TBLPROPERTIES("parquet.compression"="lzo");