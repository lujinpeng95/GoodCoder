# 一、说明

- 参考资料：
  - [8小时转职Golang工程师](https://www.yuque.com/aceld/mo95lb/dsk886)（视频：https://www.bilibili.com/video/BV1gf4y1r79E?p=1&vd_source=0a39289eadc0da17263e587380c7e5d4）
  - [快学Go语音编程](http://legoserver.bcc-szwg.baidu.com:8072/)（百度内网）
- 语言简介：Go语言是Google开发的一种**静态** **强类型**、**编译型**、**并发型**，并具有垃圾回收功能的编程语言。
- 官方资料
  - 官网：[https://go.dev](https://go.dev/)
  - 源码：https://github.com/golang/go
  - 下载：https://go.dev/dl/ ； https://golang.org/dl/
  - 国内下载（官方）：https://golang.google.cn/dl/





# 语言拾遗

## 整型类型约束

不同整型无法运算

- 如下会报类型错误（这种设计的意义：为了更好的实现**类型推导**的功能；加强开发者对**类型越界**的设计意识）

```go
var a int16
var b int32
fmt.Println(a+b)
// invalid operation: a + b (mismatched types int16 and int32)compilerMismatchedTypes
```

