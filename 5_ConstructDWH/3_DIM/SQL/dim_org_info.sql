DROP TABLE IF EXISTS dim_org_info;

CREATE EXTERNAL TABLE dim_org_info(
    org_id STRING COMMENT '组织ID',
    org_login STRING COMMENT '组织名'
)COMMENT '组织维度表'
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dim/dim_org_info'
TBLPROPERTIES ("parquet.compression"="lzo");

-- 同步策略：同步一次，无需每天装载，因为组织的信息变化缓慢，概率比较低。
-- 使用 parquet 列式存储（压缩率高，占用空间少，存储成本比较低）
-- 使用的压缩方式：lzo（支持切片，可以建立索引）