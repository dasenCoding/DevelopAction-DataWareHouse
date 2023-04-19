DROP TABLE IF EXISTS dim_developer_info;

CREATE EXTERNAL TABLE dim_developer_info(
    github_id STRING COMMENT '开发者id',
    github_name STRING COMMENT '开发者github登录名',
    github_type STRING COMMENT '开发者类型',
    repo_id ARRAY<BIGINT> COMMENT '开发者关联的仓库ID',
    org_id ARRAY<BIGINT> COMMENT '开发者参与的组织ID'
) COMMENT '开发者维度表'
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dim/dim_developer_info'
TBLPROPERTIES ("parquet.compression"="lzo");

-- 同步策略：同步一次，无需每天装载，因为开发者的 github 中开发者的信息变化缓慢，概率比较低。
-- 使用 parquet 列式存储（压缩率高，占用空间少，存储成本比较低）
-- 使用的压缩方式：lzo（支持切片，可以建立索引）
