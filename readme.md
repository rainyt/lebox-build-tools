## 梦工厂游戏包编译工具
该工具是用于生成梦工厂可运行的游戏包。在使用之前，需要准备lebox的运行环境：https://github.com/ztwireless/lebox

## 运行环境
需要安装Python3.0+
Mac（测试通过）
Window（未测试）

## 编译命令
命令需要Python3.0以上
```shell
python3 mgc-build.py 编译文件夹 引擎平台
```
引擎平台已支持：
- cocos：兼容2.1.4、2.4.3版本。
- zygameui：兼容使用zygameui框架开发的openfl游戏。

## APK自测包（未完成）
如果需要生成APK自测包，需要安装GIT环境。并在参数后追加apk，可自动生成出APK（mgc-dict/debug.apk）。
注意：
- 第一次运行该命令需要下载lebox运行环境，会较为缓慢，请耐心等待。
- 每次该命令仅可运行一次，不要重复运行，避免编译异常。