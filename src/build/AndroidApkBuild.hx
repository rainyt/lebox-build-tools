package build;

import sys.io.File;
import python.FileUtils;
import sys.FileSystem;

/**
 * 编译自测APK流程：需要安装GIT的lebox运行环境，更换zip包后，进行重新打包。
 */
class AndroidApkBuild {
	public static function build(zip:String):Void {
		// 同步完毕后，开始编译项目
		FileUtils.createDir(Main.mgc_tools_dir + "/apk/assets");
		File.copy(zip, Main.mgc_tools_dir + "/apk/assets/1000025.zip");
		aapt("assets/1000025.zip", "assets/1000025.zip");
	}

	/**
	 * 更新文件到APK中
	 * @param file
	 * @param to
	 */
	public static function aapt(file:String, to:String):Void {
		var platfrom = Sys.systemName();
		var command = platfrom == "Windows" ? "aapt.exe" : "aapt";
		var signCommand = platfrom == "Windows" ? "jarsigner.exe" : "jarsigner";
		// 移除APK中的1000025.zip
		var clear = "cd \""
			+ Main.mgc_tools_dir
			+ "/apk\""
			+ " && "
			+ command
			+ " r app-debug.apk assets/1000025.zip META-INF/CERT.SF META-INF/MANIFEST.MF";
		trace("clear apk file:" + clear);
		Sys.command(clear);
		var update = "cd \"" + Main.mgc_tools_dir + "/apk\"" + " && " + command + " a app-debug.apk " + file;
		trace("update apk file:" + update);
		Sys.command(update);
		// 重新签名 jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore demo.keystore demo.apk demo -signedjar demo_signed.apk
		var sign = "cd \""
			+ Main.mgc_tools_dir
			+ "/apk\""
			+ " && "
			+ signCommand
			+
			" -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore debug.keystore -storepass 123456 -keypass 123456 app-debug.apk demo -signedjar app-debug-signed.apk";
		trace("签名:" + sign);
		Sys.command(sign);
		File.copy(Main.mgc_tools_dir + "/apk/app-debug-signed.apk", Main.mgcdict + "/debug.apk");
		FileSystem.deleteFile(Main.mgc_tools_dir + "/apk/app-debug-signed.apk");
		FileUtils.removeDic(Main.mgc_tools_dir + "/apk/assets");
		trace("- 编译结束 -\nAPK包目录：" + Main.mgcdict + "/debug.apk");
	}
}
