DROP TABLE IF EXISTS dwd_create_info;

CREATE EXTERNAL TABLE dwd_create_info(
    github_id STRING COMMENT '创建时间的开发者id',
    repo_id STRING COMMENT '创建事件所属仓库',
    create_at STRING COMMENT '创建事件发生时间',
    create_ref STRING COMMENT '开发者创建的资源',
    create_ref_type STRING COMMENT '开发者创建的资源类型',
    create_master_branch STRING COMMENT '开发者创建的主分支',
    create_description STRING COMMENT '创建事件描述',
    create_pusher_type STRING COMMENT '创建事件的开发者类型'
)COMMENT '开发者创建事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_create_info'
TBLPROPERTIES("parquet.compression"="lzo");
