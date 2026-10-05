# yakuake
## Trouble
### yakuake无法正常的启动
`yakuake`是`KDE plasma`下的一个工具，起到的作用类似于`Windows Terminal`的`Quake`模式：全局唯一的一个下落式浮动终端。

由于`wayfire`默认不可能携带KDE的部分服务，所以这里直接运行`yakuake`会直接crash：
```shell
$ yakuake
OutputOrderWatcher may not work as expected. Reason: kde_output_order_v1 protocol is not available
Couldn't start kglobalaccel from org.kde.kglobalaccel.service: QDBusError("org.freedesktop.DBus.Error.ServiceUnknown", "The name is not activatable")
[1]    1166093 segmentation fault (core dumped)  yakuake
```
第一条可以不用管，我们主要修复第二条。
```shell
$ sudo pacman -Sy kglobalacceld kglobalaccel
```
service文件在`kglobalacceld`里面，所以都装一遍最好。

然后应该可以正常启动了，但是`yakuake`会默认显示在中间，这是由于`wayfire`的`placement mode`策略选择了`center`，这里我们改成`Cascade`就没事了，但`yakuake`依然没有显示在正确的位置，这里我们通过`window rules`强制设置他的位置：
```ini
[window-rules]
rule_yakuake_top = on created if app_id is org.kde.yakuake then move 0 0
```
最后设置快捷键来快速显示/隐藏它，这里设置`yakuake`的设置是无用的，这里我们设置`wayfire`的keybinding：
```ini
[command]
binding_toggle_quick_term = <super> KEY_GRAVE
command_toggle_quick_term = qdbus org.kde.yakuake /yakuake/window toggleWindowState
```