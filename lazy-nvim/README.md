# Neovim dotfiles
用[`LazyVim`](https://github.com/LazyVim/LazyVim)替换`Vim-Plug`重构了之前的Neovim/Vim配置文件。

通过这个插件管理器，可以轻松地将Neovim的Lua配置项以及Vim的VimScript配置项结构化，极大程度上方便了插件管理。
至此，`~/.vim/plugin`, `~/.vim/plugged`, `~/.vimrc`都不需要维护了。

## 配置文件根目录
* Windows: ~\AppData\Local\nvim
* Mac/Linux: ~/.config/nvim

不清楚可以通过下面这个命令查看：
```vim
:echo stdpath('config')`
```

## 配置项说明
| Directory Name | Description |
| -- | -- | 
| *`corrupted`* | 不用或已损坏的配置文件 |
| `init.lua` | 根目录的配置文件，方便加载子模块的配置 |
| **`lua`** | Neovim的Lua配置脚本 |
| **`lua/config`** | 除插件外的Lua配置存放处 |
| **`lua/plugins`** | Neovim插件的Lua配置存放处，每个文件代表一个插件配置 |
| **`lua/plugins/init.lua`** | 对于简单配置的插件，可以写在该文件的表中 |
| **`plugin`** | VimScript的存放处，兼容原生Vim的插件 |

### Neovim Plugin Submodule
这个具体参考[`LazyVim`的文档](https://lazy.folke.io/spec)就行了，
总之，你需要返回一个符合它要求的Table就行了，常用字段参考现有文件即可。