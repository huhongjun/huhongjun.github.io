# 关于本项目

## 简介

仅基于GitHub发布的数个站点的入口；  

用途：

    - 发布静态网页，作为个人导航门户。
    - 个人github使用记录。
    - 子目录mydocu，访问地址huhongjun.github.io/mydocu

## GitHub发布设置

    启用gh-pages,指向master分支根目录;
    huhongjun/huhongjun.github.io，可用huhongjun.github.io访问；
    huhongjun其余仓库的ghpages可用huhongjun.github.io/仓库名访问；

## 日常维护

### 项目1、入口导航页

文件:   index.html,scripts.js,styles.css,/assets

编辑scripts.js收录网站；

### 项目2、docs目录

使用_config.yml指定的Jekyll theme发布为网页；
入口README.md;

### 项目x、每个子目录是一个静态网站项目

其他私有仓库不能发布gh-pages的可以生成静态网页发布到这里（actions）；
可访问的子目录可以是此处的子目录，也有同组织其他仓库的gh-pages，前缀为仓库名；