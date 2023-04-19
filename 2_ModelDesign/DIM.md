# DIM 层建模

该层进行维度表的建模。



## 1 确认维度属性,表名

根据 `1_BusinessResearch`中确定的维度，确定维度的属性, 目前根据上面的注意事项，确定了以下维度及其属性字段(加粗是维度，后面跟着维度属性):

### 1.1 用户维度
- github_id
- github_name
- github_type
- repo_id(关联仓库维度)
- org_id(关联组织维度)

表名：**dim_develop_info**

### 1.2 仓库维度

- repo_id
- repo_name
- repo_description
- repo_size
- repo_stargazers_count
- repo_forks_count
- repo_language
- repo_has_issues
- repo_has_projects
- repo_has_downloads
- repo_has_wiki
- repo_has_pages
- repo_license
- repo_default_branch
- repo_created_at
- repo_updated_at
- repo_pushed_at

表名：**dim_repo_info**

### 1.3 组织维度

- org_id
- org_login

表名：**dim_org_info**

> 维度属性的确定，但从思考调研中确定不具备说服力，在数仓中使用时，还观察对查询的性能以及使用的方便程度。


## 2 后续优化

该部分等第一版数仓搭建起来，根据服务效果进行更改。