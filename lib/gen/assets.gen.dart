/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  $AssetsSvgBitcoinGen get bitcoin => const $AssetsSvgBitcoinGen();
  $AssetsSvgFoodDeliveryGen get foodDelivery =>
      const $AssetsSvgFoodDeliveryGen();
  $AssetsSvgIconsGen get icons => const $AssetsSvgIconsGen();
  $AssetsSvgOnlineShoppingGen get onlineShopping =>
      const $AssetsSvgOnlineShoppingGen();
  $AssetsSvgTaskManagementGen get taskManagement =>
      const $AssetsSvgTaskManagementGen();
  $AssetsSvgTravelGen get travel => const $AssetsSvgTravelGen();
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/github.png
  AssetGenImage get github =>
      const AssetGenImage('assets/images/icons/github.png');
}

class $AssetsSvgBitcoinGen {
  const $AssetsSvgBitcoinGen();

  /// File path: assets/svg/bitcoin/alwaysInPocket.svg
  SvgGenImage get alwaysInPocket =>
      const SvgGenImage('assets/svg/bitcoin/alwaysInPocket.svg');

  /// File path: assets/svg/bitcoin/highlyBlockchained.svg
  SvgGenImage get highlyBlockchained =>
      const SvgGenImage('assets/svg/bitcoin/highlyBlockchained.svg');

  /// File path: assets/svg/bitcoin/manageAnyWhere.svg
  SvgGenImage get manageAnyWhere =>
      const SvgGenImage('assets/svg/bitcoin/manageAnyWhere.svg');
}

class $AssetsSvgFoodDeliveryGen {
  const $AssetsSvgFoodDeliveryGen();

  /// File path: assets/svg/food_delivery/lunch_time.svg
  SvgGenImage get lunchTime =>
      const SvgGenImage('assets/svg/food_delivery/lunch_time.svg');

  /// File path: assets/svg/food_delivery/order_food.svg
  SvgGenImage get orderFood =>
      const SvgGenImage('assets/svg/food_delivery/order_food.svg');

  /// File path: assets/svg/food_delivery/take_away.svg
  SvgGenImage get takeAway =>
      const SvgGenImage('assets/svg/food_delivery/take_away.svg');
}

class $AssetsSvgIconsGen {
  const $AssetsSvgIconsGen();

  /// File path: assets/svg/icons/code.svg
  SvgGenImage get code => const SvgGenImage('assets/svg/icons/code.svg');

  /// File path: assets/svg/icons/login.svg
  SvgGenImage get login => const SvgGenImage('assets/svg/icons/login.svg');

  /// File path: assets/svg/icons/trippleArrow.svg
  SvgGenImage get trippleArrow =>
      const SvgGenImage('assets/svg/icons/trippleArrow.svg');
}

class $AssetsSvgOnlineShoppingGen {
  const $AssetsSvgOnlineShoppingGen();

  /// File path: assets/svg/online_shopping/fastDelivery.svg
  SvgGenImage get fastDelivery =>
      const SvgGenImage('assets/svg/online_shopping/fastDelivery.svg');

  /// File path: assets/svg/online_shopping/onlineShopping.svg
  SvgGenImage get onlineShopping =>
      const SvgGenImage('assets/svg/online_shopping/onlineShopping.svg');

  /// File path: assets/svg/online_shopping/safePayment.svg
  SvgGenImage get safePayment =>
      const SvgGenImage('assets/svg/online_shopping/safePayment.svg');
}

class $AssetsSvgTaskManagementGen {
  const $AssetsSvgTaskManagementGen();

  /// File path: assets/svg/task_management/createSchedule.svg
  SvgGenImage get createSchedule =>
      const SvgGenImage('assets/svg/task_management/createSchedule.svg');

  /// File path: assets/svg/task_management/manageTask.svg
  SvgGenImage get manageTask =>
      const SvgGenImage('assets/svg/task_management/manageTask.svg');

  /// File path: assets/svg/task_management/startDay.svg
  SvgGenImage get startDay =>
      const SvgGenImage('assets/svg/task_management/startDay.svg');
}

class $AssetsSvgTravelGen {
  const $AssetsSvgTravelGen();

  /// File path: assets/svg/travel/enjoy.svg
  SvgGenImage get enjoy => const SvgGenImage('assets/svg/travel/enjoy.svg');

  /// File path: assets/svg/travel/schedule.svg
  SvgGenImage get schedule =>
      const SvgGenImage('assets/svg/travel/schedule.svg');

  /// File path: assets/svg/travel/selectDestination.svg
  SvgGenImage get selectDestination =>
      const SvgGenImage('assets/svg/travel/selectDestination.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
