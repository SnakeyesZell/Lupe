import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageViewerPage extends StatelessWidget 
{
  final String imageUrl;

  ImageViewerPage(
  {
    super.key, 
    required this.imageUrl, 
  }) : assert(imageUrl.runtimeType == String);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=> context.pop(),
        child: Hero(
          tag: this.imageUrl,
          child: PhotoView(
            minScale: PhotoViewComputedScale.contained,
            imageProvider: CachedNetworkImageProvider(
              this.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}

