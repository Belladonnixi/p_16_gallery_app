/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/basketball_1.jpeg
  AssetGenImage get basketball1 =>
      const AssetGenImage('assets/images/basketball_1.jpeg');

  /// File path: assets/images/basketball_2.jpeg
  AssetGenImage get basketball2 =>
      const AssetGenImage('assets/images/basketball_2.jpeg');

  /// File path: assets/images/bike.jpeg
  AssetGenImage get bike => const AssetGenImage('assets/images/bike.jpeg');

  /// File path: assets/images/kaya.jpeg
  AssetGenImage get kaya => const AssetGenImage('assets/images/kaya.jpeg');

  /// File path: assets/images/running.jpeg
  AssetGenImage get running =>
      const AssetGenImage('assets/images/running.jpeg');

  /// File path: assets/images/ski.jpeg
  AssetGenImage get ski => const AssetGenImage('assets/images/ski.jpeg');

  /// File path: assets/images/soccer.jpeg
  AssetGenImage get soccer => const AssetGenImage('assets/images/soccer.jpeg');

  /// File path: assets/images/tennis_1.jpeg
  AssetGenImage get tennis1 =>
      const AssetGenImage('assets/images/tennis_1.jpeg');

  /// File path: assets/images/tennis_2.jpeg
  AssetGenImage get tennis2 =>
      const AssetGenImage('assets/images/tennis_2.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        basketball1,
        basketball2,
        bike,
        kaya,
        running,
        ski,
        soccer,
        tennis1,
        tennis2
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
