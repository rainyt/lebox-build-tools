package build;

import haxe.Json;
import python.FileUtils;
import sys.io.File;

/**
 * 梦工厂所需的资源编译
 */
class MgcBuild {
	/**
	 * 包内的文件
	 */
	public static var packageFiles:Array<String> = [];

	public static function build(tools:String, buildgo:String):Void {
		var mgc:String = tools + "/mgc-engine";
		// 处理__start__.html
		File.saveContent(buildgo + "/__start__.html", StringTools.replace(File.getContent(mgc + "/__start__.html"), "::JS::", JsBuild.jsmap.join("\n")));
		// 拷贝资源
		File.copy(mgc + "/service.html", buildgo + "/service.html");
		FileUtils.copyDic(mgc + "/__leto__", buildgo);
		// 处理service-config.js
		var serviceConfig = File.getContent(mgc + "/service-config.js");
		var packageFilesObject:Dynamic = {};
		for (str in packageFiles) {
			Reflect.setProperty(packageFilesObject, str, true);
		}
		serviceConfig = StringTools.replace(serviceConfig, "::PACKAGE_FILES::", Json.stringify(packageFilesObject));
		serviceConfig = StringTools.replace(serviceConfig, "::DEBUG::", Sys.args().indexOf("release") != -1 ? "false" : "true");
		File.saveContent(buildgo + "/__leto__/service-config.js", serviceConfig);
	}
}
