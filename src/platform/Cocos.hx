package platform;

import sys.io.File;
import build.JsBuild.JsBuildBase;

/**
 * Cocos小游戏编译兼容
 */
class Cocos extends JsBuildBase {
	override function build(file:String, root:String):String {
        super.build(file, root);
        var data = File.getContent(file);
		if (file.indexOf("cocos2d-js-min.js") != -1) {
			// 处理cocos2d-js-min.js文件
			// 移除onAudioInterruptionBegin、onAudioInterruptionEnd处理
			data = StringTools.replace(data, "wx.onAudioInterruptionBegin", "window.onAudioInterruptionBegin");
			data = StringTools.replace(data, "wx.onAudioInterruptionEnd", "window.onAudioInterruptionBegin");
			return data;
        }
        else if (file.indexOf("weapp-adapter/index.js") != -1) {
            // 解决Cocos2.1.4版本的TypeError: Cannot assign to read only property 'navigator' of object '#<Window>'"问题
            return "";
        }
        else if (file.indexOf("adapter-min.js") != -1) {
            // 解决Cocos2.4.2版本的TypeError: Cannot assign to read only property 'navigator' of object '#<Window>'"问题
			return File.getContent(Main.mgc_tools_dir + "/game-engine/cocos/2.4.x/adapter-min.js");
        }
		return null;
	}
}
