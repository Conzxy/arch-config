# nemo

## Trouble
### Open in terminal没有效果
没有给`gsettings`设置terminal或者预设的terminal不存在。
解决方案：设置一个自己常用的terminal emulator

```shell
# use get command to check terminal
gsettings get org.cinnamon.desktop.default-applications.terminal exec
# set the terminal to your favorite
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
````