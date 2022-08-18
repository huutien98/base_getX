import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheThumbnailMovie extends StatelessWidget {
  final String urlImage;

  const CacheThumbnailMovie({Key? key, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Transform.scale(
        scale: 0.3,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
