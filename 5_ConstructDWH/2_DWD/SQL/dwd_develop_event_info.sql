DROP TABLE IF EXISTS dwd_develop_event_info;

CREATE EXTERNAL TABLE dwd_develop_event_info(
    id STRING COMMENT '日志ID',
    body STRING COMMENT '日志内容',
    type STRING COMMENT '日志事件类型',
    action STRING COMMENT '行为',
    action_id STRING COMMENT '发生此行为的开发者ID',
    action_login STRING COMMENT '发生此行为的开发者github登录名',
    repo_id STRING COMMENT '仓库ID',
    org_login STRING COMMENT '组织ID'
)COMMENT '开发者日志事件事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_develop_event_info'
TBLPROPERTIES("parquet.compression"="lzo");