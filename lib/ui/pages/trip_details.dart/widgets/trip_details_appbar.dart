import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lupe/domain/domain.dart';

import 'package:provider/provider.dart';
import 'package:lupe/config/config.dart';
import 'package:lupe/ui/shared/shared.dart';

import '../provider/trip_details_page_provider.dart';


class TripDetailsAppBar extends StatelessWidget 
{
  const TripDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.watch<TripDetailsPageProvider>();
    double appBarHeight = 310;
    double viewportWith = MediaQuery.of(context).size.width;

    return SliverAppBar(
      title: Text(
        pageProvider.state.trip.title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: AppFontSizes.labelMedium,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, appBarHeight),
        child: Stack(
          children: <Widget>
          [
            const Align(
              alignment: Alignment.center,
              child: _CoverImage(),
            ),

            // Align(
            //   alignment: const Alignment(0.90, 1),
            //   child: _Users(appBarHeight: appBarHeight),
            // ),
            Positioned(
              right: (viewportWith / 2) - 175,
              child: _Users(appBarHeight: appBarHeight),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget 
{
  const _CoverImage();

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.watch<TripDetailsPageProvider>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(500),
      child: CachedNetworkImage(
        width: 300,
        height: 300,
        fit: BoxFit.cover,
        imageUrl: pageProvider.state.trip.images.first,
        errorWidget: (BuildContext context, String url, Object error)=> const ImagePlaceHolder(),
        placeholder: (BuildContext context, String url)=> const ImagePlaceHolder(),
      ),
    );
  }
}

class _Users extends StatelessWidget 
{
  final double appBarHeight;

  const _Users(
  {
    required this.appBarHeight,
  });

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.watch<TripDetailsPageProvider>();
    List<LupeUser> users = pageProvider.state.trip.linkedUsers.take(3).toList();
    int itemCount = users.length;
    double rotation = (math.pi / 7);
    double maxWith = 70;

    return Transform.rotate(
      angle: rotation,
      child: Container(
        width: maxWith,
        height: this.appBarHeight,
        alignment: Alignment.bottomCenter,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context,int index) => _UserItem(
            rotation: rotation, 
            imageUrl: users[index].imageUrl,
            index: index,
            maxWith: maxWith,
          ),
        ),
      ),
    );
  }
}

class _UserItem extends StatelessWidget 
{
  final double rotation;
  final double maxWith;
  final String imageUrl;
  final int index;

  const _UserItem(
  {
    required this.rotation, 
    required this.maxWith, 
    required this.imageUrl, 
    required this.index,
  });

  @override
  Widget build(BuildContext context) 
  {
    double indexOffset = ((index * 1.9)  / 10);
    double imagePadding = (5 - indexOffset); 
    double imageSizeWithOutPadding = (maxWith - (maxWith * indexOffset));
    double imageSize = (imageSizeWithOutPadding - (imagePadding * 2) );
    double translateX = (index == 1) ? 10.0 : 0.0;
    double translateY = (index == 1) ? 6.0 : 0.0;
    Matrix4 transform = Matrix4.identity()
                        ..rotateZ(-this.rotation)
                        ..translate(translateX, translateY);

    return Transform(
      transform: transform,
      child: Container(
        padding: EdgeInsets.all(imagePadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
          // color: Colors.red,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            height: imageSize,
            width: imageSize,
            fit: BoxFit.cover,
            imageUrl: this.imageUrl,
          ),
        ),
      ),
    );
  }
}





