DROP TABLE IF EXISTS dwd_delete_info;

CREATE EXTERNAL TABLE dwd_delete_info(
    github_id STRING COMMENT '开发者ID',
    create_at STRING COMMENT '时间',
    delete_ref STRING COMMENT '开发者删除的分支',
    delete_ref_type STRING COMMENT '删除资源类型',
    delete_pusher_type STRING COMMENT '删除事件的开发者类型'
)COMMENT '开发者删除资源事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_delete_info'
TBLPROPERTIES("parquet.compression"="lzo");