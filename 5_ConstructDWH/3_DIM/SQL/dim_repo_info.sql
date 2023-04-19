DROP TABLE IF EXISTS dim_repo_info;

CREATE EXTERNAL TABLE dim_repo_info(
    repo_id STRING COMMENT '仓库id',
    repo_name STRING COMMENT '仓库名称',
    repo_description STRING COMMENT '仓库描述',
    repo_size STRING COMMENT '仓库大小',
    repo_stargazers_count STRING COMMENT '仓库的star数',
    repo_forks_count STRING COMMENT '仓库的fock数',
    repo_language STRING COMMENT '仓库的主要语言',
    repo_has_issues STRING COMMENT '仓库是否开启ISSUE功能',
    repo_has_projects STRING COMMENT '仓库是否开启project功能',
    repo_has_downloads STRING COMMENT '仓库是否开启下载功能',
    repo_has_wiki STRING COMMENT '仓库是否开启wiki功能',
    repo_has_pages STRING COMMENT '仓库是否开启pages功能',
    repo_license STRING COMMENT '仓库的许可证书',
    repo_default_branch STRING COMMENT '仓库的默认分支数',
    repo_created_at STRING COMMENT '仓库的创建时间',
    repo_updated_at STRING COMMENT '仓库的更新时间',
    repo_pushed_at STRING COMMENT '仓库上次推送时间'
)COMMENT '仓库维度表'
STORED AS PARQUET
LOCATION '/warehouse/develop_action/dim/dim_repo_info'
TBLPROPERTIES ("parquet.compression"="lzo");

-- 同步策略：同步一次，无需每天装载，因为仓库的信息变化缓慢，概率比较低。
-- 使用 parquet 列式存储（压缩率高，占用空间少，存储成本比较低）
-- 使用的压缩方式：lzo（支持切片，可以建立索引）