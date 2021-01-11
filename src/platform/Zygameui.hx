package platform;

import sys.io.File;
import build.JsBuild.JsBuildBase;

class Zygameui extends JsBuildBase {
	override function build(file:String, root:String):String {
		if (file.indexOf(root + "/game.js") != -1) {
			return File.getContent(Main.mgc_tools_dir + "/game-engine/zygameui-openfl/game.js");
		} else if (file.indexOf("zygameui-dom.js") != -1)
			return File.getContent(Main.mgc_tools_dir + "/game-engine/zygameui-openfl/zygameui-mgc-dom.js");
		return super.build(file, root);
	}
}
