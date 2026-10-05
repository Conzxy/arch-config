# 音乐播放器

## 网易云（netease-cloud）
官方的网易云客户端十分简陋，且不适配wayland的HIDPI scasle，故最好不用，直接卸掉。
有很多其他第三方客户端可以替代，UI更美观，功能更丰富，效果还不错。

## splayer-next
功能丰富，UI美观，但是不知道为什么，解码似乎很烂，歌曲播放的前面几秒以及跳转都有卡顿，十分影响体验，不考虑使用。

## netease-cloud-music-gtk4
基于`Rust`和`gtk4`编写的第三方，UI相比`splayer-next`比较简陋，但基本功能都有，也够用，播放没大毛病。

## go-musicfox
基于TUI的第三方，UI设计的还行，有突出和布局，就是无法显示封面比较遗憾，其他可以给到夯，挂在`yakuake`上用就完事了。