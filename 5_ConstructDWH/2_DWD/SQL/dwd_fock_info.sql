CREATE TABLE IF EXISTS dwd_fock_info;

CREATE EXTERNAL TABLE dwd_fock_info(
    create_at STRING COMMENT 'fock时间',
    forkee_id STRING COMMENT '此仓库的唯一ID',
    forkee_full_name STRING COMMENT '克隆后的仓库全称',
    fockee_owner_id STRING COMMENT '克隆后的仓库拥有者ID',
    fockee_owner_login STRING COMMENT '仓库拥有者的github登录名',
    fockee_owner_type STRING COMMENT '仓库拥有者的类型'
)COMMENT 'fock仓库事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_fock_info'
TBLPROPERTIES("parquet.compression"="lzo");
