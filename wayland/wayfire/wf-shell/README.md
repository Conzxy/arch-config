# What
`wf-shell`是`wayfire`官方的一组配套工具，如下：
* `wf-panel`
* `wf-dock`
* `wf-background`
* `wf-locker`

# Trouble
## obsidian图标无法正常显示
`obsidian`的图标在`wf-panel`和`wf-dock`上都无法正常显示，这个我翻了下issue，明确了下作者设计思路是：
> This is probably because these apps do not have the correct .desktop file entries and/or do not report their correct app_id.

也就是说需要`*.desktop`文件里面的`StartupWMClass`与`app_id`一致。
我们可以通过`wf-info`获取到对应的`app_id`，最终发现与`obsidian.desktop`中记录的一致，都是`md.obsidian.Obsidian`。

那么为什么图标无法正常显示呢？问题出在`wf-dock`对于`desktop`文件的搜索逻辑，根据[源码](https://github.com/WayfireWM/wf-shell/blob/01c1a9d0a859471f9755df5f80ef212a97d00215/src/util/gtk-utils.cpp#L86)，它并没有根据`obsidian.desktop`匹配，而是去找`${app_id}.desktop`的文件，而其他能找到图标的软件，无非都是有这样的文件罢了。
```cpp
/* Gio::DesktopAppInfo
 *
 * Usually knowing the app_id, we can get a desktop app info from Gio
 * The filename is either the app_id + ".desktop" or lower_app_id + ".desktop" */
Glib::RefPtr<Gio::Icon> get_from_desktop_app_info(std::string app_id)
{
    std::vector<std::string> prefixes = {
        "",
        "org.kde.",
    };

    std::vector<std::string> app_id_variations = {
        app_id,
        tolower(app_id),
    };

    std::vector<std::string> suffixes = {
        "",
        ".desktop"
    };

    for (auto& prefix : prefixes)
    {
        for (auto& id : app_id_variations)
        {
            for (auto& suffix : suffixes)
            {
                auto app_info = Gio::DesktopAppInfo::create(prefix + id + suffix);
                if (app_info)
                {
                    return app_info->get_icon();
                }
            }
        }
    }

    return {};
}
```
### 解决方案
```shell
ln -s /usr/share/applications/obsidian.desktop ~/.local/share/applications/md.obsidian.Obsidian.desktop
```
弊端：会给`wofi`等launcher添加重复的启动项，尽管它们是等价的。
### 更好的方法
```shell
git clone https://github.com/Conzxy/wf-shell.git
# build 
...
```
拷贝我自己的fork，里面有针对这个进行扩展，在`~/.config/wf-shell.ini`中添加新字段：
```ini
[app_id_map_for_desktop]
md.obsidian.Obsidian = obsidian
...
```
这样也能让`wf-dock`/`wf-panel`正确地拿到对应的desktop app info。

如果上流有什么更新值得同步，也可以更新（可能会有冲突）：
```shell
git remote add wf https://github.com/WayfireWM/wf-shell
git pull wf
```
## wf-locker能不能设置单独的背景图
目前给出的配置项来看，不能，只能和`wf-background`设置的背景图同步。

## wf-dock自动隐藏有的时候会失效
那大概率是crash了，原因不清楚。

## wf-dock有些图标点击不会跳转到对应的workspace
查看源码，最终都是转发到了`wayland`的API，所以无法判断是否是`wayfire`自身问题。

尝试将最小化的动画效果从`squeezimize`改为`zoom`，似乎就没问题了，怀疑是动画相关逻辑存在跳转处理缺失。