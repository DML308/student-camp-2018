git add  把工作区的修改，提交到暂存区(在版本库里的stage)
git commit 把暂存区的修改，保存到当前分支(版本库里的master)  -m "message" 要写更新记录
git push  把本地库的记录，推送到远程库
git status 查看库的状态
git diff git.md 可以查看git.mdf改动的具体内容
git log 查看日志  git reflog 查看操作记录
git reset --hard HEAD^^^ 回退到当前版本的上第三个版本  HEAD指向当前分支  一个^表示往前推一个版本
working directory  工作区  比如learngit这个文件夹就是一个工作区
Repository 版本库   是工作区里面隐藏的那个目录.git ，其中又分暂存区stage 和 当前分支master
git checkout -- <file> 用版本库里的版本替换工作区里的版本
git clone git@github.com:leeleezi/student-camp-2019 克隆远程仓库到本地

