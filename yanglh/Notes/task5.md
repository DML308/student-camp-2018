**如果github被墙了或者校园网访问网速特别慢,怎么办?**  
解决办法：  
*访问https://www.ipaddress.com/，查询github.com和github.global.ssl.fastly.net对应的IP地址  
*在终端中输入指令：sudo vim / etc / hosts  
*在文件末尾添加内容：  
\# Github  
151.101.185.194 github.global.ssl.fastly.net  
192.30.253.112 github.com  

**git push -u origin master中的origin指的是什么?**  
origin 并不是指得是远程的仓库，而是指得是远程仓库在本地的一个指针（这个指针有可能过时的）。  
当我们使用使用merge的时候，我们进行合并的时候只是上一次fetch从远程拿到的版本。不是远程仓库的最新版本。  
在clone完成之后，Git会自动为你将此远程仓库命名为origin。  
origin只相当于一个别名，运行git remote –v或者查看.git/config可以看到origin的含义）  
并下载其中所有的数据，建立一个指向它的master分支的指针，我们用(远程仓库名)/(分支名) 这样的形式表示远程分支  
所以origin/master指向的是一个remote branch（从那个branch我们clone数据到本地），但你无法在本地更改其数据。  
