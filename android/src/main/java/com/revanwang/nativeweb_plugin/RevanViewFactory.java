package com.revanwang.nativeweb_plugin;
import android.content.Context;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import static io.flutter.plugin.common.PluginRegistry.Registrar;


public class RevanViewFactory extends PlatformViewFactory {

    private  final Registrar registrar;

    public RevanViewFactory(Registrar registrar){
        super(StandardMessageCodec.INSTANCE);
        this.registrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return null;
    }
}
