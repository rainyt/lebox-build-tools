## 梦工厂游戏包编译工具
该工具是用于生成梦工厂可运行的游戏包。如需更新测试APK，请前往lebox的运行环境：https://github.com/ztwireless/lebox，然后进行编译，替换工具中的app-debug.apk文件。

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

## APK自测包
在命令的第三个参数填写`apk`则可以自动生成出自测包，安装到手机运行测试。
例子：
```shell
python3 mgc-build.py 编译文件夹 引擎平台 apk
```