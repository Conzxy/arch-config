# walker
## What
基于一个自定义后端`elephant`提供各种服务的`launcher`程序，很类似于Windows平台的`UTools`。

## Install
```shell
# Clone the repository
git clone https://github.com/abenz1267/walker.git
cd walker

# Build with Cargo
cargo build --release

# Run Walker
./target/release/walker
```
# elephant
## What
作为前端`walker`的数据源，提供各种各样的服务，比如应用信息，文件信息等。
## Install
这个参考[elephant的github](https://github.com/abenz1267/elephant)
```shell
yay -S elephant

# Providers, f.e.

yay -S elephant-desktopapplications
```
这里我也不清楚哪里来的`elephant`的service文件，内容放着备份：
```ini
[Unit]
Description=Elephant
After=graphical-session.target

[Service]
Type=simple
ExecStart=elephant
Restart=on-failure

[Install]
WantedBy=graphical-session.target
```
后台服务自然用service包装更方便：
```shell
$ systemctl --user enable elephant
```

## source provider
```shell
$ yay -Ss elephant | grep -E2 provider
```