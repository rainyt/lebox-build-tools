package build;

import python.FileUtils;
import sys.io.File;

class MgcBuild {
	public static function build(tools:String, buildgo:String):Void {
		var mgc:String = tools + "/mgc-engine";
		// 处理__start__.html
        File.saveContent(buildgo + "/__start__.html", StringTools.replace(File.getContent(mgc + "/__start__.html"), "::JS::", JsBuild.jsmap.join("\n")));
        // 拷贝资源
        File.copy(mgc + "/service.html", buildgo + "/service.html");
        FileUtils.copyDic(mgc + "/__leto__", buildgo);
	}
}
