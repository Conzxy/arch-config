# Comic(漫画)
因为我需要在`wayland`下搭配HIDPI屏幕（比如4K/2K）看漫画或者查看图片，但还是存在一些不支持wayland原生scale的软件，比如`MComicx`，因此需要选择合适的软件来满足我的要求。
这些不支持原生scale的软件就类似于Windows系统下那些只支持API Aware旧方案的GUI软件，它可以让你的GUI在不改动任何代码的情况下直接让窗体的大小等在视觉上符合HIDPI的缩放系数，但是UI内容会肉眼可见的糊，因为这个方案本质是先渲染后再scale成符合缩放系数的样子，所以要实现清晰的HIDPI方案一般需要设置新的API Aware方案，通过相关API调用，可以让每个屏幕拿到各自的DPI，然后开发者自己根据这个去处理（通常要处理`WM_DPICHANGED`事件）。
上面扯远了，我意思是`wayland`下查看图片会糊的软件也是类似的，它们是根据当前的DPI系数强制拉伸的，所以效果不好。

这里，我列举几个不会糊的软件：
* geeqie
* [MView6](https://github.com/newinnovations/mview6)
```shell
# pacman -Sy geeqie
```
但`geeqie`无法直接预览`*.zip`的文件内容，这样对于一些打包成`zip`文件的漫画而言，需要先解压，很麻烦，这方面`MView6`可以做到直接查看`zip`文件，确实满足了我的需求，但这个软件比较玩具，目录的管理几乎没有，不符合我的要求，作者也不是针对看漫画的需求设计的，所以这两如果能结合在一起就很好。

这时候就让我想起了Windows平台常用的`Neeview`，这个软件没有跨平台，不能在`Linux`上原生运行，所以必须考虑用`wine`/`proton`环境来兼容。
这里我搜到了一篇对我有帮助的文章，讲述了用`bottles`来安装`Neeview`需要的环境并管理。
`bottles`可以认为是一个管理多个`wine`的沙盒软件，每个不同的沙盒都有隔离的独立环境，很符合我的要求。
`Neeview`需要`.Net`环境，最新的版本需要`.Net 10`，但是我试了几次，似乎这个环境安装会失败，但github release中有只需要`.Net 9`环境的版本。
这个老版本有个问题是，不默认支持`*.webp`图片格式的显示，所以需要安装额外的插件。
具体流程还是参考下面这个链接为好。
[Linux Mint22.2 NeeViewを利用する方法](https://note.com/aruku_yukkuri/n/n27601e865905#414b526a-1483-4076-8e64-f5d41f8ac9d7)

以防过期，备份下地址：
[7z下载地址](https://sparanoid.com/lab/7z/)
[插件下载地址](https://toro.d.dooo.jp/slplugin.html)