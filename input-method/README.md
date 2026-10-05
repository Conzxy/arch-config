# 输入法
用标准的`fcitx5`，平时用得到也就中文和日文，所以安装以下的插件。

## Chinese
rime，一个不错的中文引擎，安装可以参考[rime引擎安装Guide](https://github.com/SHORiN-KiWATA/Shorin-ArchLinux-Guide/blob/main/wiki/archlinux/%E4%B8%AD%E6%96%87%E8%BE%93%E5%85%A5%E6%B3%95.md)
```shell
sudo pacman -Sy fcitx5-rime rime-ice-git
```
这里我们设置雾凇方案：
```shell
mkdir -p ~/.local/share/fcitx5/rime
vim ~/.local/share/fcitx5/rime/default.custom.yaml
```
deafult.custom.yaml：
```yaml
patch:
  # 这里的 rime_ice_suggestion 为雾凇方案的默认预设
  __include: rime_ice_suggestion:/
```
## Japanese
```shell
# pacman -Sy fcitx5-anthy
```

## 皮肤
### 社区原生
[一些好看的Fcitx5皮肤](https://forums.debiancn.org/t/topic/6591)

个人比较喜欢这款：[灰樱 Sakura](https://github.com/sanweiya/fcitx5-mellow-themes)
### 搜狗转换
有一个[开源项目](https://github.com/fkxxyz/ssfconv)可以将搜狗输入法的皮肤转换成`fcitx5`皮肤文件，然后拷贝到`~/.local/share/fcitx5/themes`即可。

不过这里要注意一点，由于搜狗输入法的样式都是双行的：上面一行是拼音，下面是候选列表。但`fcitx5`默认的方案不是这样的，而是仅有候选列表，这里我们可以设置一下让它显示双行，从而让皮肤显示正常：
![xxx](<../assets4obsidian/Pasted image 20261005210140.png>)
这个`composing text`就会导致单行候选列表样式。其他两个都可以选，效果具体自己看，一般选`Don't show`。
