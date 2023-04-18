# 业务调研
## 1 需求调研（业务板块、数据需求）
明确构建数仓的业务板块以及需要具体满足的业务需求。

在进行业务调研时，需要先明确数仓服务的对象，数仓具备数据服务能力，所以业务调研的目的就是明确业务板块中的数据需求。

比如电商中的《服务》板块，该业务板块的业务需求有：数据需求/ 核心数据/ 数据应用，其中数据需求是为了提升客户体验，提高服务质量，提高完美订单。

所以在开发者行为数仓中，这个数仓的使用对象就是我自己，而我通过使用这个数仓的目的是为了，洞察开发者的行为，从开发者与仓库的各种交互中，
对开源项目的贡献情况进行分析，为了监控团队协作和效率。

当然一个好的数仓需要同时适配多个业务板块，具备很好的可扩展性。

本项目划定**业务板块 《项目治理》**，主要的服务对象就是具有开源项目公司的开源项目管理人员/ 开源社区的运营人员/ ，该业务板块下的业务需求有：


以开发者角度：
1. 开发者贡献的PR/ISSUE数
2. 贡献频率
3. 提出的ISSUE各类型的占比，发展趋势
4. 开发者提PR的频率
5. 最大连续贡献天数
6. 开发者fock的仓库中，python语言的占比


以仓库项目角度：
1. 项目下 issue 的响应周期
2. 项目下 issue 各个类型的占比，各类型连续7天/30天的增减趋势
3. 项目 pr 的解决周期，平均解决一个 pr 需要的周期
4. 项目每个月合并的 pr 数发展趋势
5. pr 数废弃的比率，成功合入和比率
6. 项目fock数的变化趋势
7. 项目stars的变化趋势

以及还可能需要这些： 以issue角度/ 以pr的角度/ 以comment的角度/ 以commit的角度

> 需求调研和业务的梳理不存在一次做成，需要不断的迭代和完善。




## 2 分析业务流程

本节主要分析`Github`开源项目中，梳理出来了以下业务流程： 
- **代码提交**：开发者通过Git工具向Github仓库提交代码。这些提交会被记录在日志中，并包含提交的作者、时间戳和提交的内容
- **Pull Requests**：开发者通过创建Pull Requests来向仓库的管理员请求合并他们的代码。这些请求会被记录在日志中，并包含请求的作者、时间戳、请求的标题和请求的状态
- **Issues**：开发者通过创建Issues来报告问题或请求新功能。这些Issues会被记录在日志中，并包含问题的作者、时间戳、问题的标题和问题的状态
- **合并代码**：管理员通过合并Pull Requests来将开发者的代码合并到主分支中。这些合并会被记录在日志中，并包含合并的作者、时间戳和合并的内容
- **分支管理**：管理员通过创建、删除和合并分支来管理仓库中的代码。这些操作会被记录在日志中，并包含操作的作者、时间戳和操作的类型
- **代码审核**：管理员通过审查Pull Requests来确保代码的质量和正确性。这些审查会被记录在日志中，并包含审查的作者、时间戳和审查的结果

在`Github`中针对开发者的行为主要有两方面:
- 开发者向仓库提问 `issue`
- 开发者为仓库贡献代码

下面是两部分的流程图（包含了上面梳理出来的业务流程）：

![image](https://github.com/dasenCoding/DevelopAction-DataWareHouse/blob/main/1_BusinessResearch/0-business-image/issue_process.png)

![image](https://github.com/dasenCoding/DevelopAction-DataWareHouse/blob/main/1_BusinessResearch/0-business-image/pr_process.png)



## 3 分析业务过程，划分主题域

业务过程属于业务流程中的一环或者几环，业务过程是一个个不可拆分的事实。如果想要了解详细的业务过程，需要梳理开发者在`GitHub`中的行为流程，具体的流程已经在`2节`中梳理。

根据`3节`中梳理出来的业务过程划分主题域（数据域），以及主题域下含包含的业务过程（加粗的为主题域，下面的为一个个不可拆分的业务过程）

**代码提交和版本控制**： 
- Git提交
- 分支管理
- 合并代码

**Pull Requests管理**：
- 创建
- 审查
- 合并
- 关闭Pull Requests

**问题管理：**
- 创建
- 标记
- 关闭
- 评论Issues

**仓库和项目管理：**
- 创建和删除仓库
- 创建和删除项目
- 创建和删除分支

**用户管理：**
- 添加
- 删除
- 更新用户

**系统和日志管理：**
- 记录、备份、维护系统
- 记录、备份、维护日志


主题域是通过梳理出来的业务过程来进行提炼的，需要注意的是业务过程梳理不清楚会导致数据域划分的问题。所以这个事情并不是一蹴而就的，需要不断地理解梳理然后进行完善，这些直接影响到数仓的健壮程度。

## 4 定义维度构建总线矩阵

### 4.1 如何定义维度
维度属于最后数据分析时使用的角度，角度越多分析社区的角度就越多。

在划分数据域、构建总线矩阵时，需要结合对业务过程的分析定义维度。

维度的作用一般是用来查询约束、分类汇总以及排序等。经常出现在查询或者报表中的 '按照' 语句中。

维度设计的过程就是确定维度的过程，如何生成维度属性，如何评价所生成的维度属性的优劣，决定了维度使用的方便性。

维度建模的核心就是确认维度，需要使用维度建模的步骤确定维度，维度建模的步骤如下：
1. 选择业务过程
2. 声明粒度
3. 确认维度
4. 确认事实

首先选择业务过程，可以通过不同主题域下的业务过程来进行处理，这里选取`Pull Requests管理`域下的业务过程来作为例子：`创建`，`审查`，`合并`，`关闭`；

然后选择粒度：在`审查`这个业务流程中，一行数据代表了 reviewer 对代码的一次审查记录

然后确认维度，维度主要是度量事实的环境，这里是`reviewer`，`审查记录`。

### 4.2 确认维度

根据上面的过程，最终确认的维度有（加粗的为主题域，下面的为主题域下的维度）：

1. 用户维度
2. 仓库维度
3. 组织维度
4. issue维度
5. issue标签维度
6. issue作者维度
7. issue指派热维度
8. issue评论维度
10. pull request维度
11. pull request审查维度
12. 推送push维度
13. 组织成员维度
14. 版本发布维度
15. 发布资源维度

确认维度的依据：
1. 确定主维表，因为没有其他业务表，只有clickhouse中一张日志表，所以将该表作为ODS层数据，同时也选择该表作为主维表。 主维表包含了上面的所有维度

2. 确定相关维表，相关维表是其他业务系统和该主维表相关联的，选择其中某些表生成维度属性。这里因为没有其他的业务系统的数据，所以直接从主维表中确定维度。
3. 确认维表的属性，可以从主维表中选择表字段作为维表的属性/ 也可以从相关维表中选择字段作为维表的属性


确认维表的注意事项：

1. 尽可能产生更多的维度，这样在分析的时候会有更多的角度。个人能力有限，这里先确定上面的维度，在数仓搭建起来之后做更近一步的完善。
2. 添加属性的文字描述
3. 注意区分数值型的属性和事实，一般用作查询的约束分组统计的一般为维表的属性/ 如果参与度量的计算那么就是事实（比如商品的数量价格等属于数值型属性，但是如果是连续的支付金额则为数值型事实）
4. 沉淀出通用的维度属性
5. 将不常用的维度属性，如果无法抽取出来可以直接留在事实表中
> 降低公司的成本，权衡利弊，降低存储，计算资源。

### 4.3 确认维度属性

目前根据上面的注意事项，确定了以下维度及其属性字段（加粗是维度，后面跟着维度属性）：

**1. 用户维度**
- github_id
- github_name
- github_type

**2. 仓库维度**
- repo_id
- repo_name

**3. 组织维度**
- org_id
- org_login

**4. issue维度**
- issue_id
- repo_id (关联 仓库维度)
- issue_number
- issue_title
- issue_body

**5. issue标签维度**
- github_id (关联开发者维度)
- issue_id (关联 issue 维度)
- repo_id  (关联 仓库维度)
- issue_labels_name
- issue_labels_color
- issue_labels_default
- issue_labels_description

**6. issue作者维度**
- github_id
- github_login
- github_type
- issue_id (关联 issue 维度)
- author_association

**7. issue指派人维度**
- github_id (关联开发者维度)
- issue_id (关联 issue 维度)
- assignee_id
- assignee_login

**8. issue评论维度**
- github_id (关联开发者维度)
- issue_id
- comment_id
- comment_body

**10. pull request维度**
- repo_id (关联 仓库维度)
- issue_id (关联 issue 维度)
- pull_merged
- pull_merged_commit_sha
- pull_merged_at
- pull_merged_by_login

**11. pull request审查人维度**
- repo_id (关联仓库维度)
- pull_review_comment_id
- pull_review_comment_body
- pull_review_comment_create

**12. 推送push维度**
- github_id(关联开发者维度)
- push_id
- push_ref
- push_head

**13. 组织成员维度**
- org_id (关联组织维度)
- member_github_id
- member_github_login
- member_github_type

**14. 版本发布维度**
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
- github_id (关联开发者维度)
- repo_id (关联仓库维度)
- release_assets_name
- release_assets_uploader_login
- release_assets_content_type
- release_asset_state
- release_asset_size

> 维度属性的确定，但从思考调研中确定不具备说服力，在数仓中使用时，还观察对查询的性能以及使用的方便程度。


