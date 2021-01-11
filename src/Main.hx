package;

import build.MgcBuild;
import build.JsBuild;
import sys.io.File;
import python.FileUtils;
import sys.FileSystem;
import platform.Cocos;

/**
 * 梦工厂编译命令
 */
class Main {
	public static var mgc_tools_dir:String;

	public static var mgc_build_dir:String;

	public static var mgcdict:String;

	public static var platformBuild:JsBuildBase;

	static function main() {
		var args = Sys.args();
		mgc_tools_dir = Sys.programPath();
		mgc_tools_dir = mgc_tools_dir.substr(0, mgc_tools_dir.lastIndexOf("/"));
		mgc_build_dir = args[0];
		if (args[1] != null) {
			platformBuild = Type.createInstance(Type.resolveClass("platform." + args[1].charAt(0).toUpperCase() + args[1].substr(1).toLowerCase()),[]);
		}
		trace("工具目录：" + mgc_tools_dir);
		trace("梦工厂编译目录：" + mgc_build_dir);
		if (!FileSystem.exists(mgc_build_dir))
			throw mgc_build_dir + "目录不存在";
		// 生成mgc-dict目录
		mgcdict = mgc_build_dir + "/mgc-dict";
		if (FileSystem.exists(mgcdict)) {
			FileUtils.removeDic(mgcdict);
		}
		FileUtils.createDir(mgcdict);
		// 递归
		var files = FileSystem.readDirectory(mgc_build_dir);
		for (index => value in files) {
			if (value == "mgc-dict")
				continue;
			buildFile(mgc_build_dir + "/" + value, mgcdict + "/" + value);
		}
		// 梦工厂资源生成
		MgcBuild.build(mgc_tools_dir, mgcdict);
		// 生成zip包
		Sys.setCwd(mgcdict);
		Sys.command("zip -r ./1000025.zip ./* -r");
		trace("编译结束");
	}

	/**
	 * 编译文件
	 * @param file
	 */
	public static function buildFile(file:String, buildto:String):Void {
		trace("编译：" + file);
		if (FileSystem.isDirectory(file)) {
			// 递归
			var files = FileSystem.readDirectory(file);
			for (index => value in files) {
				buildFile(file + "/" + value, buildto + "/" + value);
			}
			return;
		}
		// 编译处理
		var ext = file.substr(file.lastIndexOf(".") + 1);
		switch (ext) {
			case "js":
				// JS文件需要经过梦工厂包装
				JsBuild.build(file, buildto, mgc_build_dir);
			default:
				// 默认以外的文件全部拷贝
				FileUtils.copyFile(file, buildto);
		}
	}
}
