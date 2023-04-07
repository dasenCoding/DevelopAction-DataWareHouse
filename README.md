# DevelopAction-DataWareHouse
This project builds an offline data warehouse based on the 2020 Github annual logs provided by OpenDigger. 

该 project 主要用来帮助自己更好的熟悉离线数据仓库的搭建过程，从数仓的业务梳理、建模到分层等各个环节。

提交的大部分内容可能包含了一些笔记、图片或者一些代码片段，记录了自己从0搭建的整个过程。

一定会存在问题或者漏洞，假如作为更加了解数仓各个环节的你能为我提出一些建议和改进的方法，我会倍感荣幸和兴奋！

--------------------------------------------------------------------------------------------------------
## 1 前期准备

自己电脑的配置无法处理亿条数据，目前准备使用阿里云/华为云，租赁3台服务器，用来作为集群，同时将opendigger中公开的2020开发者全域数据从clickhouse中导入到集群中，这部分的配置过程以及注意事项会保存在 /cluster-service中。

> 介于长时间租赁高性能的服务器比较昂贵，这里先进行规划，等准备完成后，直接拼接各个部分从服务器的租赁到集群搭建再到数据的导入一起完成。
