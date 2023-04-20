DROP TABLE IF EXISTS dwd_release_info;

CREATE EXTERNAL TABLE dwd_release_info(
    release_author_id STRING COMMENT '发布版本的作者ID',
    release_author_login STRING COMMENT '发布版本的作者github登录名',
    release_author_type STRING COMMENT '发布版本的作者类型',
    release_id STRING COMMENT '版本ID',
    release_tag_name STRING COMMENT '版本标签名称',
    release_target_commitish STRING COMMENT '版本相关分支头',
    release_name STRING COMMENT '版本名称',
    release_draft STRING COMMENT '是否为草稿',
    release_prerelease STRING COMMENT '是否为预发行版本',
    release_create_at STRING COMMENT '版本创建时间',
    release_published_at STRING COMMENT '版本的发布时间',
    release_body STRING COMMENT '版本内容'
)COMMENT '发布版本事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_release_info'
TBLPROPERTIES("parquet.compression"="lzo");