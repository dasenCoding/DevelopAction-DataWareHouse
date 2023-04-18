# DIM 层建模

该层进行维度表的建模。

根据 `1_BusinessResearch`中确定的维度，（加粗是维度，后面跟着维度属性）：

**1. 用户维度**

表名：dim_developer_info
- github_id
- github_name
- github_type

**2. 仓库维度**

表名：dim_repo_info
- repo_id
- repo_name

**3. 组织维度**

表名：dim_org_info
- org_id
- org_login

**4. issue维度**

表名：dim_issue_info
- issue_id
- repo_id (关联 仓库维度)
- issue_number
- issue_title
- issue_body

**5. issue标签维度**

表名：dim_issue_label_info
- github_id (关联开发者维度)
- issue_id (关联 issue 维度)
- repo_id  (关联 仓库维度)
- issue_labels_name
- issue_labels_color
- issue_labels_default
- issue_labels_description

**6. issue作者维度**

表名：dim_issue_author_info
- github_id
- github_login
- github_type
- issue_id (关联 issue 维度)
- author_association

**7. issue指派人维度**

表名：dim_issue_assignee_info
- github_id (关联开发者维度)
- issue_id (关联 issue 维度)
- assignee_id
- assignee_login

**8. issue评论维度**

表名：dim_issue_comment_info
- github_id (关联开发者维度)
- issue_id
- comment_id
- comment_body

**10. pull request维度**

表名：dim_pull_request_info
- repo_id (关联 仓库维度)
- issue_id (关联 issue 维度)
- pull_merged
- pull_merged_commit_sha
- pull_merged_at
- pull_merged_by_login

**11. pull request审查人维度**

表名：dim_pull_request_reviewer_info
- repo_id (关联仓库维度)
- pull_review_comment_id
- pull_review_comment_body
- pull_review_comment_create

**12. 推送push维度**

表名：dim_push_info
- github_id(关联开发者维度)
- push_id
- push_ref
- push_head

**13. 组织成员维度**

表名：dim_org_member_info
- org_id (关联组织维度)
- member_github_id
- member_github_login
- member_github_type

**14. 版本发布维度**

表名：dim_release_info
- github_id (关联开发者维度)
- repo_id (关联仓库维度)
- release_id
- release_tag_name
- release_target_commitish
- release_name
- release_draft
- release_author_id
- release_author_login
- release_prerelease

**15. 发布资源维度**

表名：dim_release_assets_info
- github_id (关联开发者维度)
- repo_id (关联仓库维度)
- release_assets_name
- release_assets_uploader_login
- release_assets_content_type
- release_asset_state
- release_asset_size