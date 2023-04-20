DROP TABLE IF EXISTS dwd_release_assets_info;

CREATE EXTERNAL TABLE dwd_release_assets_info(
    asset_name STRING COMMENT '资源名',
    asset_uploader_id STRING COMMENT '资源上传者githubID',
    asset_uploader_login STRING COMMENT '资源上传者github登录名',
    asset_content_type STRING COMMENT '资源类型',
    asset_state STRING COMMENT '资源状态',
    asset_size STRING COMMENT '资源大小',
    asset_download_count STRING COMMENT '资源下载数'
)COMMENT '版本附带资源事实表'
PARTITIONED BY (dt_month STRING, dt_day STRING)
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dwd/dwd_release_info'
TBLPROPERTIES("parquet.compression"="lzo");