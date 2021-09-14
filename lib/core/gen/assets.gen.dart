/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsLogoGen {
  const $AssetsLogoGen();

  String get patchai => 'assets/logo/patchai.svg';
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  String get en => 'assets/translations/en.json';
  String get it => 'assets/translations/it.json';
}

class $AssetsWeatherGen {
  const $AssetsWeatherGen();

  String get c => 'assets/weather/c.svg';
  String get h => 'assets/weather/h.svg';
  String get hc => 'assets/weather/hc.svg';
  String get hr => 'assets/weather/hr.svg';
  String get lc => 'assets/weather/lc.svg';
  String get lr => 'assets/weather/lr.svg';
  String get s => 'assets/weather/s.svg';
  String get sl => 'assets/weather/sl.svg';
  String get sn => 'assets/weather/sn.svg';
  String get t => 'assets/weather/t.svg';
}

class Assets {
  Assets._();

  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
  static const $AssetsWeatherGen weather = $AssetsWeatherGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
