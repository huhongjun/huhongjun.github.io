# 关于本项目

## 简介

仓库用途：

    - 发布静态网页，作为个人导航门户。
    - 个人github使用记录。

## 发布准备

    CNAME添加：portal指向huhongjun.github.io;
    启用gh-pages,指向master分支根目录;
    设置自定义域名portal.asmatrix.com；  ;  
    huhongjun/huhongjun.github.io，可用huhongjun.github.io； 

## 日常维护

### 项目1、入口导航页

编辑scripts.js收录网站；

### 项目2、docss目录

使用_config.yml指定的Jekyll theme发布为网页；
入口README.md;

### 每个子目录是一个静态网站项目

其他私有仓库不能发布gh-pages的可以生成静态网页发布到这里。

## 文件说明

顶层目录部署静态网页；

Jekyll相关文件: README.md,_config.yml;  

上传的静态文件:index.html,scripts.js,styles.css,assets目录;
