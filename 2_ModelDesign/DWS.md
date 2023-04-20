# DWS 层

DWS层属于轻度汇总层，主要是按照维度来进行轻度汇总，便于更好的的服务于应用层。

本次按照维度确认了各个统计指标。


## 开发者主题

开发者提出的总 issue 数/ total_issue_count

开发者 fock 总仓库数/ total_fock_repo_count

开发者 push 总次数/ total_push_count

开发者 review 总次数/ total_review_count

开发者审查pr的评论总数/ total_pr_review_comment_count

开发者 pr 合并的总次数/ total_merged_pr_count

开发者总 push次数/ total_push_count

当天提出的 issue 数/  new_issue_count

当天fock的仓库数/  new_fock_repo_count

push推送次数/   new_push_count

review的次数/  new_review_count

pr审查评论次数/   new_pr_review_comment_count

pr合并次数/ new_merged_pr_count

创建分支数/ new_branch_count

删除分支数/ new_delete_branch_count

发布版本数/ new_release_count

上传资源数/ new_asset_count

连续贡献的天数/  contribute_daycount

表名：**dws_developer_count**


## 仓库主题

仓库总 open issue 数/ repo_total_open_issues

仓库总 closed issue 数/ repo_total_closed_issues

仓库总 pr 数/ repo_total_open_pr

仓库总关闭 pr 数/ repo_total_closed_pr

仓库废弃 pr 数/ repo_total_abdon_pr

仓库总 fock 数/ repo_total_focks

仓库总 stars 数/ repo_total_stars

仓库新增 issue 数/  repo_new_issue_count

仓库新增类型为 bug 的 issue 数/ repo_new_bug_issue_count
 
仓库当日关闭 issue 数/ repo_closed_issue_count

仓库新增fock数/ repo_new_fock_count

仓库新增stars数/ repo_new_star_count

仓库新增 pr 数/ repo_new_pr_count

仓库合并 pr 数/ repo_new_merged_pr_count

仓库当天废弃 pr数/ repo_abdon_pr_count

仓库各语言及其占比/ repo_language_percent

表名：**dws_repo_count**

## 组织主题

组织总人数/  org_total_members
    
组织新增人数/ org_new_members_count

组织拥有的仓库数/ org_total_repo

组织新增仓库数/ org_new_repo_count

表名：**dws_org_count**


## issue主题

repo ID/ repo_id

github_id/ github_id

issue ID/ issue_id

issue title/ issue_title

issue body/ issue_body

issue的开始时间/ issue_create_at

issue的结束时间/ issue_closed_at

issue协作者数量/ issue_assign_count

issue评论数量/ issue_comment_count

表名：**dws_issue_count**


## pull request 主题

repo ID/ repo_id

github ID/ github_id

pr开启时间/ pr_open_time

pr合并时间/ pr_closed_time

pr push次数/ pr_push_count

pr 新增代码行数/ pr_new_codeline_count

pr 删除代码行数/ pr_delete_codeline_count

pr 新增文件数/ pr_new_file_count

表名：**dws_pull_request_count**


## 全域变化

新增仓库数/ github_new_repos_count

新增组织数/ github_new_orgs_count

新增开发者数/ github_new_developers_count

总开发者数/  github_total_developers

总组织数/ github_total_orgs

总仓库数/   github_total_repos

表名：**dws_github_count**