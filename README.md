# 关于本项目

## 简介

仅基于GitHub发布的数个站点的入口；  
huhongjun/huhongjun.github.io，可用huhongjun.github.io访问；  
huhongjun其余仓库的gh-pages可用huhongjun.github.io/仓库名访问；


用途：

    - 发布静态网页，作为个人导航门户。
    - 个人github使用记录。
    - 子目录mydocu，访问地址huhongjun.github.io/mydocu

## GitHub发布设置

    启用gh-pages,指向master根目录;
    
    // subt-desktop
    subtree_dir=subt-desktop
    repo_url=https://github.com/huhongjun/huhongjun.github.io.git
    repo_branch=gh-pages-desktop

    // subt-asmatrix
    subtree_dir=subt-asmatrix
    repo_url=https://github.com/huhongjun/mkdocs-asmatrix.git
    repo_branch=gh-pages

    git rm ${subtree_dir}
    git commit -m 'b4 subtree pull' -a
    git subtree add --prefix=${subtree_dir} ${repo_url} ${repo_branch}
    git subtree pull --prefix=${subtree_dir} ${repo_url} ${repo_branch}

## 日志

2021.07.07  GitHub Actions同步子目录与其它仓库的gh-pages

## 日常维护

### 项目1、入口导航页

文件: index.html,scripts.js,styles.css,/assets
用途：入口导航清单；

编辑scripts.js收录网站；

### 项目2、docs目录

文件：_config.yml指定的Jekyll theme发布网页；入口README.md;  
用途：GitHub使用指南与备忘；

### 项目x、每个子目录是一个静态网站项目

其他私有仓库不能发布gh-pages的可以生成静态网页发布到这里（actions）；
可访问的子目录可以是此处的子目录，也有同组织其他仓库的gh-pages，前缀为仓库名；

## 开发与调试

vscode + liveserver extension

搜索与替换(正则表达式) 

[vscode官方文档](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)

    Usage：删除shortcutKey
    Find:       "shortcutKey.:\s".".\s
    Replace:    

    Usage：取url最后面的仓库名，替换前面的name
    Find:       \{"name": "(aaaa)",.*https://.*(\w)",
    Replace:    {"name": "$3$2$3", 

    Usage：取name，填充url
    Find：      (\{"name": ")([\w\.-]*)(", "url": ")(https://.*/)",
    Replace：   $1$2$3https://github.com/osmatrix/$2",
