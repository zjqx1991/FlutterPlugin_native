package com.revanwang.nativeweb_plugin;
import io.flutter.plugin.common.PluginRegistry.Registrar;



public class NativewebPlugin {

  //注册
  public static void registerWith(Registrar registrar) {
    registrar.platformViewRegistry().registerViewFactory("nativeweb", new RevanViewFactory(registrar));
  }
}
