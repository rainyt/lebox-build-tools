package build;

import python.FileUtils;
import sys.FileSystem;

/**
 * 编译自测APK流程：需要安装GIT的lebox运行环境，更换zip包后，进行重新打包。
 */
class AndroidApkBuild {
    
    public static function build(zip:String):Void{
        if(!FileSystem.exists(Main.mgc_tools_dir + "/build") || !FileSystem.exists(Main.mgc_tools_dir + "/build/LeboxGame")){
            //目录不存在，下载线上lebox环境
            FileUtils.createDir(Main.mgc_tools_dir + "/build");
            Sys.command("cd " + Main.mgc_tools_dir + "/build" + "\nunzip ./LeboxGame.zip");
        }
        //删除多余的东西
        if(FileSystem.exists(Main.mgc_tools_dir + "/build/__MACOSX"))
            FileUtils.removeDic(Main.mgc_tools_dir + "/build/__MACOSX");
        //同步完毕后，开始编译项目
        Sys.command("cd " + Main.mgc_tools_dir + "/build/LeboxGame" + "\n./gradlew assembleDebug");
    }

}