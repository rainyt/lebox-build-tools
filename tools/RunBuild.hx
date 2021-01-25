package;

class RunBuild {
	static function main() {
		trace("梦工厂编译开始");
		trace(Sys.args(), Sys.programPath());
		var path = Sys.args()[0] + "Export/mgc";
		Sys.command("python3 " + StringTools.replace(Sys.programPath(), "run.n", "mgc-build.py") + " " + path + " zygameui apk");
	}
}
