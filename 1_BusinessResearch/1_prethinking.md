## 1 前期准备

自己电脑的配置无法处理亿条数据，目前准备使用阿里云/华为云，租赁3台服务器，用来作为集群，同时将opendigger中公开的2020开发者全域数据从clickhouse中导入到集群中，这部分的配置过程以及注意事项会保存在 /cluster-service中。

> 介于长时间租赁高性能的服务器比较昂贵😥，这里先进行规划，等准备完成后，直接拼接各个部分从服务器的租赁到集群搭建再到数据的导入一起完成。
> 
--------------------------------------------------------------------------------------------------------

## 2 数仓搭建前的一些思考

👉 思考1

在构建数仓之初，个人感觉最重要的是能够清楚的知道构建数仓的目的。目前自己的知识认知认为数仓的最终目的之一是进行数据服务，帮助领导进行决策，在这里来讲就是我搭建的数仓是否能够为我提供数据服务。说白了就是：假如我从ods层直接提出数据进行目标的分析处理的效果比从数仓产出的数据分析的结果要好，那我费劲的做这个数仓干什么？毫无用途，浪费精力。类比到实际应用中，假如领导直接取ods层的数据进行分析，不需要数仓产出的数据为他服务，那还要数仓干啥🥶。

所以数仓的目的之一就是具备强大的数据服务能力。

👉 思考2

另外一个方面，数仓的是对现存的数据进行有效的分类组织和存储，避免重复建设以及数据的不一致性。

举个例子：GitHub中存在成千上万的仓库，几乎每个具备一定规模的仓库下都会有开发者提出的 issue 与 pr，这些 issue 需要仓库管理者或者其他开发者来进行解答，pr 需要仓库的代码 review 进行代码的审查。审查通过的代码予以通过，最终合并到主分支中。

假如仓库的持有者，关心自己仓库下这些内容：
1. issue 的平均解决事件/
2. issue 提出后的响应速率/
3. 常驻的开发者有哪些？
4. 核心开发者的留存情况如何？
5. pr 的解决周期的长短？
6. pr 废弃的比率

等等一些关于GitHub仓库的问题，上面的几个问题中明显有3类主题维度，但是在日志数据中其中一个维度的数据记录中还包括了另外两个维度的字段，假如我要获取 issue 的所有信息，需要进行筛选、处理空值、处理 issue 和开发者/pr交叉的信息（这里指的是pr中的comment可能会引用某个issue）。这样一来，每次处理的时候都需要进行同样的操作，重复工作太多意味着重复的查询很多。

这次使用的数据有大概8亿条数据，不同于之前很少的数据，当数据量很大的时候进行过多的重复查询毫无意义同时增加集群的负担，所以这里能体会到数仓要解决的其中一个问题就是进行解耦，多次同样的查询数据可以抽取作为某一层的数据，当使用的时候直接获取。

> 🤓上面是目前的一些思考，思考会不全面，同时也有局限性，因为自己每天在看很多内容，可能思考的思路会有对错，这里遇到了就记录一下，日后等数仓基本完成了再进行一下整理。
--------------------------------------------------------------------------------------------------------
## 3 开发者行为数仓体系

在写这部分的时候，恰巧观看了阿里巴巴的《大数据之路》的部分章节解读，(ps:参考的资料最后会统一指明👀)所以准备做一个类比，将书中的例子映射到自己的小项目中。

首先，自己数仓的体系架构是什么样子的。

书中将体系架构分成了这几个部分：
- 业务板块
- 主题域（数据域）
- 业务过程
- 原子指标
- 修饰词+修饰类型
- 派生指标
- 维度表
- 汇总事实表
- 明细事实表

参照这些部分的概念，做了如下对比映射到了开发者行为业务流程中：
 - 业务板块：这部分感觉还有点模糊，感觉现在不需要分，业务板块属于比数据域更高维度的业务划分，适用于强大繁琐的业务系统，该项目不需要划分业务板块
 - 主题域: 开发者/ 仓库(开源项目)/ 贡献代码/ 曝光仓库/ 问题交互
 - 业务过程：开发者在仓库下提交issue
 - 原子指标：issue个数/ pr数/ 仓库代码编程语言数/
 - 修饰类型/修饰词：仓库类型下的opendigger仓库(对应修饰类型/ 修饰词)
 - 派生指标：修饰词+原子指标-> opendigger仓库下使用的编程语言个数（原子指标：编程语言个数/ 修饰类型：仓库/ 修饰词：opendigger/)
 
上面的类比会存在偏差，不同模块的划分和理解存在不足，后面会进行各个模块单独的处理和分析，便于后续的改进。
