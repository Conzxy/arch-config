# Arch Config

## Introduction
这是本人ArchLinux的部分自用配置文件，在此记录和备份。

## 日用软件归纳
* 桌面环境（Desktop environment）
    * wayfire(A 3D-wayland compositor)
    * wcm(wayland config manager)
    * wf-dock(bottom)
    * waybar(top)
    * wf-background(background replacement of awww)
    * wf-locker(screen locker)
    * ~~wf-panel~~
* shell
    * zsh
* 终端模拟器（terminal emulator）
    * Alacritty
    * kitty
    * foot
    * yakuake(下拉式浮动终端（drop floating-terminal）)
* 笔记软件（note writer）
    * Obsidian(or Vscode with Markdown plugin)
* 看漫画软件（comic viewer）
    * Neeview(in `bottles`)
* 看视频软件（video player）
    * mpv
* 音乐播放器（music player）
    * go-musicfox
    * netease-cloud-music-gtk4
    * ~~splayer-next~~
* 图片查看器（picture viewer）
    * gthumb
    * MView6(✅zip)
    * geeqie(❌zip)
* 文件管理器（file manager）
    * nemo
* 网页浏览器（web browser）
    * microsoft edge
    * firefox
* 桌面环境(Desktop Environment)
    * wayfire(+wf-shell)
* 即时通讯软件（IM）
    * linuxqq
* 游戏（game）
    * dwproton(Windows)
    * Steam
* Windows兼容软件（Windows compatibility software）：
    * dwproton(In Steam)
    * wine
    * bottles
* 输入法（input method）
    * fcitx5 + rime(chinese) + anthy(Japanese)
* 编辑器（editor）
    * vim
    * neovim
    * vscode
* 编程环境（IDE）
    * neovim+plugin
    * vscode+plugin
* Office(word/ppt/pdf)
    * WPS
    * okular
* 包管理器（package manager）：
    * pacman
    * yay
    * flatpak
* 代理软件/梯子（Proxy software）
    * clash verge recv
    * ~~clash for windows(cfw)~~
    * clash(CLI)
## 同步配置文件脚本
```bash
./script/sync-config
```