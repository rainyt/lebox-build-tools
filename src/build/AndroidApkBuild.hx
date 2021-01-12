package build;

import sys.io.File;
import python.FileUtils;
import sys.FileSystem;

/**
 * 编译自测APK流程：
 * 将1000025.zip的包更新，并进行重新签名获取到APK
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
			+ " && " +
			"java -jar apksigner.jar sign --ks-pass pass:123456  --ks debug.keystore --ks-key-alias demo app-debug.apk ";
		trace("签名:" + sign);
		Sys.command(sign);
		File.copy(Main.mgc_tools_dir + "/apk/app-debug.apk", Main.mgcdict + "/debug.apk");
		FileUtils.removeDic(Main.mgc_tools_dir + "/apk/assets");
		trace("- 编译结束 -\nAPK包目录：" + Main.mgcdict + "/debug.apk");
	}
}
