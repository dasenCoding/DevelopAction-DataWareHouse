DROP TABLE IF EXISTS ods_develop_action_info;

CREATE EXTERNAL TABLE ods_develop_action_info(
    id STRING COMMENT '唯一标识一条记录',
    line STRING COMMENT '日志行为'
) COMMENT '开发者日志行为'
PARTITIONED BY(dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/ods/ods_develop_action_info'
TBLPROPERTIES("parquet.compression"="lzo");