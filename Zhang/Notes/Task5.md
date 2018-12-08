# 任务5 #
### Github访问速度慢和下载慢的解决方法 ###

#### 原因 ####
``` Github的CDN被墙，由于网络代理商的原因，所以访问下载很慢。```

#### 解决方法 ####
``` 绕过DNS解析，从本地直接绑定host。```

#### 具体解决过程 ####
在本地host文件中添加映射
Windows系统的host文件位置如下：
```C:\Windows\System32\drives\etc\hosts```

Mac\Linux系统的hosts文件位置如下：
```/etc/hosts```

具体步骤如下：

```
1.用文本编辑器打开hosts文件
2.访问ipaddress网站https://www.ipaddress.com/，查看网站对应的IP地址，输入网址则可查阅到对应的IP地址，这是一个查询域名映射关系的工具
3.查询 github.global.ssl.fastly.net 和 github.com 两个地址
4.多查几次，选择一个稳定，延迟较低的 ip 按如下方式添加到host文件的最后面
5.保存hosts文件
6.重启浏览器，或刷新DNS缓存，告诉电脑hosts文件已经修改，linux/mac执行sudo /etc/init.d/networking restart命令；windows在cmd中输入ipconfig /flushdns命令即可。
7.起飞！！！
```
