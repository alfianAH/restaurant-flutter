import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class AdaptiveIcon extends Icon{
  final IconData iosIcon;
  final IconData androidIcon;
  final Color? iconColor;
  final double? iconSize;

  final bool _isDebug = false;

  AdaptiveIcon({
    required this.iosIcon,
    required this.androidIcon,
    this.iconColor,
    this.iconSize,
  }) : super(null);

  @override
  Widget build(BuildContext context) {
    return Icon(
      UniversalPlatform.isIOS || (UniversalPlatform.isWeb && _isDebug)
          ? iosIcon : androidIcon,
      color: iconColor,
      size: iconSize,
    );
  }
}