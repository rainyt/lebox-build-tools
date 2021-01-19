package platform;

import sys.io.File;
import build.JsBuild.JsBuildBase;

/**
 * zygameui框架编译兼容
 */
class Zygameui extends JsBuildBase {
	override function build(file:String, root:String):String {
		if (file.indexOf(root + "/game.js") != -1) {
			var content = File.getContent(file);
			var webpath = content;
			content = content.substr(content.lastIndexOf("lime.lime.embed(\"") + "lime.lime.embed(\"".length);
			content = content.substr(0, content.indexOf("\""));
			webpath = webpath.substr(webpath.indexOf("window.webPath") + "window.webPath".length);
			webpath = webpath.substr(webpath.indexOf("'") + 1);
			webpath = webpath.substr(0, webpath.indexOf("'"));
			var ret = StringTools.replace(File.getContent(Main.mgc_tools_dir + "/game-engine/zygameui-openfl/game.js"), "::JSID::", content);
			ret = StringTools.replace(ret,"::WEB_PATH::",webpath);
			return ret;
		} else if (file.indexOf("zygameui-dom.js") != -1)
			return File.getContent(Main.mgc_tools_dir + "/game-engine/zygameui-openfl/zygameui-mgc-dom.js");
		return super.build(file, root);
	}
}