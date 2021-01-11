package build;

import python.FileUtils;
import sys.FileSystem;
import sys.io.File;

class JsBuild {
	
	public static var jsmap:Array<String> = [];

	public static function build(file:String, buildto:String, root:String):Void {
        var fileName = StringTools.replace(file,root + "/","");
		jsmap.push('<script src="' + fileName + '?m=8c7025" type="text/javascript"></script>');
		var data = Main.platformBuild != null ? Main.platformBuild.build(file,root) : File.getContent(file);
		if(data == null)
			data = File.getContent(file);
		var dir = buildto.substr(0, buildto.lastIndexOf("/"));
		if (!FileSystem.exists(dir)) {
			FileUtils.createDir(dir);
		}
		File.saveContent(buildto, 'define("' + fileName + '", function(require, module, exports, process) {\n' + data + "\n})");
	}
}

class JsBuildBase {
	
	public function new() {
		
	}

	/**
	 * 平台兼容编译器处理
	 * @param file 
	 * @param buildto 
	 * @param root 
	 */
	public function build(file:String, root:String):String{
		return null;
	}

}