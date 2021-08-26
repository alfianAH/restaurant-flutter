import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/widgets/adaptive_icon.dart';

class ImageNetworkLoader extends StatelessWidget{
  final String imageSource;
  final BoxFit? imageFit;

  const ImageNetworkLoader({
    required this.imageSource,
    this.imageFit
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageSource,
      fit: imageFit,
      errorBuilder: (context, error, stackTrace) {
        return Center(
          child: AdaptiveIcon(
            androidIcon: Icons.broken_image_rounded,
            iosIcon: CupertinoIcons.arrow_clockwise,
            iconSize: 75,
            iconColor: Theme.of(context).textTheme.headline6!.color,
          )
        );
      },
    );
  }
}