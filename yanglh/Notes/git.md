git 指令：

1、git config:
  git config --global user.name "xxx"  配置全局用户名
  git config --global user.email "xxx" 配置全局邮箱
  git config --list 显示配置信息
2、git init 初始化git仓库
3、git clone：
  git clone git@github.com:xxx.git 从远程服务器克隆一个仓库到本地
4、git add 将文件放到暂存区
5、git commit:
  git commit -m 将暂存区的文件提交，且会显示提交消息
  git commit -a -m 跳过暂存区，直接提交目录中有所改变的文件，新增的不会提交
6、git rm:
  git rm -f 强制删除文件，不检查更新
  git rm --cached 删除暂存区的文件
7、git mv
  git mv oldname newname 重命名文件
  git mv file dir 移动文件到指定的目录
8、git branch 查看所有分支
9、git pull 将指定远程仓库的指定分支拉取到本地仓库分支
10、git push 将本地仓库分支推送到远程仓库分支

问题：什么是pull request？

