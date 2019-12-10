#### 思考这样一个问题, 如果github被墙了或者校园网访问网速特别慢,怎么办?例如,clone我们的COStream到服务器时,明明是约40MB的文件包却只有不到100Kb/s的速度.
- 修改host文件
- 翻墙
- 使用gitee
#### 了解git push -u origin master中的origin指的是什么. 可通过git remote -v来列出信息. 如果能体验一下code.aliyun.com或gitee.com或GitLab相信你会有更清楚的理解.
origin就是一个默认的名字,指向远程库,就和创建自己的repo时master是默认的主分支名字一样.
####了解什么是.editorConfig,思考为什么要用空格代替tab,以及在.md .cpp .y .l Makefile文件中分别应该设置几个空格大小呢?
.editorConfig 是编辑器和IDE的配置文件,方便一个开发团队统一代码风格. 编辑器的行为会与.editorConfig中定义的一致,且要高于编辑器自身的设置.
用TAB因为不同编辑器上一个TAB表示的空格不同，所以相同代码别人打开可能是乱码.可以在编辑器里面设置用几个空格来代替一个TAB.
####简单了解什么是"utf-8"编码和"GBK"编码,有趣的故事有"锟斤拷"这个梗.