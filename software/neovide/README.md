pacman安装的neovide依赖于pacman安装的nvim v0.9.0，而这个版本有一些问题，比如不支持gtags。  
目前，最好使用v0.8.3的neovim。  

由于neovide，goneovim等neovim GUI都支持指定neovim的bin路径。

> 原本是脚本封装，现在想一下就一行还是alias更好使

```bash
alias nv='neovide --neovim-bin=/bin/vi'
```
