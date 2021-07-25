# 使用说明

使用 `git subtree` 添加到项目中，注意在添加之前 git 需要处于干净的状态。

#### 新增
git subtree add --prefix=.github https://github.com/work-design/.github.git main

#### 更新
git subtree pull --prefix=.github https://github.com/work-design/.github.git main
