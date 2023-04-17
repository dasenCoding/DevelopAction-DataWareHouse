# DevelopAction-DataWareHouse
This project builds an offline data warehouse based on the 2020 Github annual logs provided by OpenDigger. 

## pre.为什么想自己搭建数仓🦄
在次之前，已经在B站学习过电商数仓项目，但是学完总感觉空落落的，感觉学了东西，又感觉没有学东西。
很幸运的是学校与华师大X-Lab实验室有交集，并了解到了该实验室的开源项目OpenDigger，并且提供了2020年GitHub的全域开发者行为数据，虽然数据是已经被处理之后的，不是原汁原味的数据，但是通过观察发现该日志数据中一种行为的字段还包括了其他行为的字段，导致大量的空值。因此其实还有很大的空间能够来充分利用这些数据。

目前来说，

1. 自己也通过电商数仓了解到数仓的搭建和构造，并且也开始阅读William H.Inmon的《数据仓库》、跟着B站一些数据总监发布的数仓讲解进行学习。但是感觉数仓的建模以及搭建不像大数据的其他技术栈学习后就会使用，其本身需要不断地了解那种建模思想和实际应用才能从中不断地提取自己想要地内容，不断地进行优化，所以也很清楚距离自己能够真正搭建中规中矩的数仓还是有很长一段路需要走🐢。
2. 另一方面，正好有亿级别地开发者行为数据。

介于此，正好可以将自己学习地内容通过实践来进行一个提升，在实际构建地过程中思考🤯:
1. 数仓建模地目的
2. 如何梳理业务流程
3. 为什么要进行数仓地建模
4. 如何进行数仓的建模
5. 之后如何进行优化？
6. 数仓的扩展性如何？
> 其实还有很多的问题，这些问题在之后的记录中不断地记录并解答，如果有新的问题，再标注进来同时做好问题的时序，防止重复地陷入某个问题中去。

**🐂“纸上得来终觉浅，绝知此事要躬行”🐂**

--------------------------------------------------------------------------------------------------------
好了进入正题🎉：

该 project 主要用来帮助自己更好的熟悉离线数据仓库的搭建过程，从数仓的业务梳理、建模到分层等各个环节。

提交的大部分内容可能包含了一些笔记、图片或者一些代码片段，记录了自己从0搭建的整个过程。

一定会存在问题或者漏洞，假如作为更加了解数仓各个环节的你能为我提出一些建议和改进的方法，我会倍感荣幸和兴奋！😆🤩

--------------------------------------------------------------------------------------------------------
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

> 🤓上面是目前的一些思考，思考会不全面，同时也有局限性，因为自己每天在看很多内容，可能思考的思路会有对错，这里遇到了就记录一下，日后等数仓基本完成了再进行一下整理。(ps:2023/04/10晚上 教5)
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
 
--------------------------------------------------------------------------------------------------------
 
## 4 开发者行为数仓业务调研/需求分析
 
下面梳理一下在Github中，开发者可以进行的一系列业务流程（可能包含的不全面，因为原始数据中没有的话可能对我现在来讲，扩展起来有些困难😥 2023/04/11晚 教5）。
 
通过详细的调研业务，明确自己的需求，可以很好的帮助自己知道数仓搭建的思路和服务方向。
 
### 4.1 业务调研与分析

这部分了解业务流程，同时通过归纳整合涉及到的业务流程，抽象出来不同的主题域。
 
在进行业务调研时，需要先明确数仓服务的对象，数仓具备数据服务能力，所以业务调研的目的就是明确业务板块中的数据需求。比如电商中的《服务》板块，该业务板块的业务需求有：数据需求/ 核心数据/ 数据应用，其中数据需求是为了提升客户体验，提高服务质量，提高完美订单。
 
所以在开发者行为数仓中，这个数仓的使用对象就是我自己，而我通过使用这个数仓的目的是为了，洞察开发者的行为，从开发者与仓库的各种交互中，一方面了解仓库开发者的使用体验，一方面更好的治理开源项目。

当然一个好的数仓需要同时适配多个业务板块，具备很好的可扩展性。
 
 本项目划定**业务板块 《开源社区治理》**，主要的服务对象就是具有开源项目公司的开源部门的开源项目管理人员/ ，该业务板块下的业务需求有：
 1. 数据需求：开发者行为分析，项目问题解决周期，核心开发者数量
 2. （日后再补充）

--------------------------------------------------------------------------------------------------------

### 4.2 梳理业务流程

主要分下开发者向仓库下提问issue，以及开发者为仓库贡献代码两部分流程：

开发者向仓库下提问issue:


开发者为仓库贡献代码：


--------------------------------------------------------------------------------------------------------

### 4.3 分析业务过程



主要分析Github开源项目中，开发者进行贡献时，一个个不可拆分的业务过程，一一列举出来，梳理出来了以下业务过程：
 1. 开发者在某仓库下创建一条issue
 2. 开发者在issue下进行评论
 3. 协作开发者回答issue提问
 4. 合并pr到主分支中
 5. reviewer 审查 pr
 6. 本地仓库向远程仓库推送代码
 7. 开发者fock某个仓库
 8. 创建仓库版本
 9. 上传版本的附加资源
 10. 开发者提交代码
 
 --------------------------------------------------------------------------------------------------------
 
### 4.3 划分主题域

根据 4.2 中梳理出来的业务过程划分主题域（数据域）
> 主题域是通过梳理出来的业务过程来进行提炼的，需要注意的是业务过程梳理不清楚会导致数据域划分的问题。所以这个事情并不是一蹴而就的，需要不断地理解梳理然后进行完善，这些的确定直接影响到数仓的健壮程度。

- 仓库域：创建仓库版本、上传仓库版本附加资源、开发者fock仓库

- 贡献域：开发者提问issue、开发者提交代码、本地仓库向远程仓库推送代码、开发者评论

- 审查域：reviewer审查pr、合并pr到主分支

- 协作域：协作开发者回答issue提问

--------------------------------------------------------------------------------------------------------

### 4.4 定义维度，构建总线矩阵

使用`贡献域`中`开发者提问issue`的业务过程，来定义维度。在 开发者提问issue 业务过程中，主要有开发者、issue两个维度。

确认两个维度后，可以确定维度下的各个属性，下面从开发者维度可以定义出如下属性：
- 开发者用户ID
- 开发者Github ID
- 开发者类型
