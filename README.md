# GoodCoder

## 01 说明与基础设置记录

- 用途：用于记录日常学习笔记，同时同步至GitHub、Gitee两个托管平台



###Git设置

- 上传失败问题：[error: src refspec xxx does not match any / error: failed to push some refs to](https://blog.csdn.net/u014361280/article/details/109703556)

  - 本质原因：远程没有指定的分支名的分支

  - 可能的报错原因：

    - ① 常用的push命令：`git push origin master`

    - ②  Github受到"Black Lives Matter"运动的影响，从2020年10月1日起，在该平台上创建的所有新的源代码仓库将默认被命名为 “main”，而不是原先的"master"

      ![img](https://mdpic01-1306646166.cos.ap-shanghai.myqcloud.com/mdPic/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQzNjEyODA=,size_16,color_FFFFFF,t_70.png)

  - 解决方案：

    ```powershell
    # 修改本地master分支名，改为main
    git branch -m master main
    
    # 提交代码时，push到main分支
    git push origin main
    ```

    

- 中文乱码问题：https://cloud.tencent.com/developer/article/1728748

  - 补充阅读：
    - https://cloud.tencent.com/developer/article/1541611?from=article.detail.1728748
    - https://blog.csdn.net/qq_34707272/article/details/105971251
    - 若win系统通过bat提交，导致中文乱码，参见：[Bat脚步中文乱码问题](#Win系统设置)
  - 设置git编码

  ```powershell
  git config --global core.quotepath false 
  git config --global gui.encoding utf-8
  git config --global i18n.commit.encoding utf-8 
  git config --global i18n.logoutputencoding utf-8 
  ```

  - 设置环境变量

  ```powershell
  # bash环境
  export LESSCHARSET=utf-8
  
  # cmd环境
  set LESSCHARSET=utf-8
  ```

  - windows配置系统变量：『LESSCHARSET utf-8』

  <img src="https://mdpic01-1306646166.cos.ap-shanghai.myqcloud.com/mdPic/s7cg69bd3y.png" alt="img" style="zoom:67%;" />



###多平台同步

- ① 创建项目：

- ② 

- 删除/修改 项目（名称）

  - gitee

    ![image-20220626231646293](https://mdpic01-1306646166.cos.ap-shanghai.myqcloud.com/mdPic/image-20220626231646293.png)



###Win系统设置

- [解决window的bat脚本执行出现中文乱码的问题](https://www.cnblogs.com/onelikeone/p/11965839.html)：

  - 原理：批处理文件，是以ANSI编码处理的；如果通过将txt文件（默认UTF-8）修改后缀改为bat文件，会出现中文乱码的问题。
  - 解决方案：将要修改的txt文件，选择『另存为』，然后修改文件后缀为bat，并将编码格式设置为『ANSI』
  - 补充阅读：
    - [查看端口使用进程的方式](https://blog.csdn.net/weixin_45640009/article/details/120815019)
    - [pause命令](https://blog.csdn.net/baidu_35761016/article/details/53018176)：Dos命令中的一个命令，让bat任务暂停，并屏幕输出提示信息"Press any key to continue...“ 

  

  

  

### 其他设置

- 输入法输出 『方引号/直角引号』：搜狗输入法『更多设置』--- 『高级』--- 『自定义短语设置』

  <img src="https://mdpic01-1306646166.cos.ap-shanghai.myqcloud.com/mdPic/image-20220626224421650.png" alt="image-20220626224421650" style="zoom: 50%;" />

- ShadowsocksR端口被占用问题：[问题解决： SSR 的 1080 端口被占用](https://blog.csdn.net/longintchar/article/details/99005409?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-99005409-blog-120815019.pc_relevant_multi_platform_whitelistv1&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-99005409-blog-120815019.pc_relevant_multi_platform_whitelistv1&utm_relevant_index=1)

  - 找到安装目录 --- 打开『gui-config.json』--- 修改"localPort"字段的值，然后重启

  ```
  "localPort" : 1088,
  ```



### 常用快捷键

- 终端：
  - 清除一行：『ctrl + w』/ 『ctrl + a』

- 文本：
  - 移至行首/尾：『Home/End』（有些笔记本可以用 『Fn + 左/右键』代替 Home/End）
  - 左/右移动一个单词：『ctrl + 左/右键』
