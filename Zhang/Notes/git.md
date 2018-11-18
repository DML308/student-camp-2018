命令行中常用的Git指令：

1.安装Git 

$ sudo apt-get install git

2.生成ssh秘钥 

$ ssh-keygen -t rsa -C "your@email.com"

3.使用Git命令下载GitHub上的项目 

$ git clone XXX/XXX.git

注：对于本实验室的项目，命令行指定为  

$ git clone git@github.com:DML308/costream.org.git
$ git clone git@github.com:DML308/cn.costream.org.git 


4.使用Git指令对clone到本地仓库的代码进行修改&提交  

$ add -A
$ git commit -m "your comment" 
$ git pull #拉取别人修改的代码,无冲突时默认合并
$ git push

5.Git版本回滚

$ git reset --hard
