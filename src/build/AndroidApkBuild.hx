package build;

import sys.io.File;
import python.FileUtils;
import sys.FileSystem;

/**
 * 编译自测APK流程：需要安装GIT的lebox运行环境，更换zip包后，进行重新打包。
 */
// class AndroidApkBuild {
    
//     public static function build(zip:String):Void{
//         if(!FileSystem.exists(Main.mgc_tools_dir + "/build") || !FileSystem.exists(Main.mgc_tools_dir + "/build/app-debug")){
//             //目录不存在，下载线上lebox环境
//             FileUtils.createDir(Main.mgc_tools_dir + "/build");
//             Sys.command("cd " + Main.mgc_tools_dir + "/build" + "\njava -jar apktool.jar d app-debug.apk");
//         }
//         //同步完毕后，开始编译项目
//         File.copy(zip,Main.mgc_tools_dir + "/build/app-debug/assets/1000025.zip");
//         Sys.command("cd " + Main.mgc_tools_dir + "/build" + "\njava -jar apktool.jar b app-debug");
//     }

// }