// subt-desktop
subtree_dir=subt-desktop
repo_url=https://github.com/huhongjun/huhongjun.github.io.git
repo_branch=gh-pages-desktop

git rm -r ${subtree_dir}
git commit -m 'b4 subtree add' -a
git subtree add --prefix=${subtree_dir} ${repo_url} ${repo_branch}
git subtree pull --prefix=${subtree_dir} ${repo_url} ${repo_branch}
git add ${subtree_dir}/* && git commit -m 'commit after subtree add & pull' -a

// subt-asmatrix
subtree_dir=subt-asmatrix
repo_url=https://github.com/huhongjun/mkdocs-asmatrix.git
repo_branch=gh-pages

git rm -r ${subtree_dir}
git commit -m 'b4 subtree add' -a
git subtree add --prefix=${subtree_dir} ${repo_url} ${repo_branch}
git subtree pull --prefix=${subtree_dir} ${repo_url} ${repo_branch}
git add ${subtree_dir}/* && git commit -m 'commit after subtree add & pull'