import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lupe/ui/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:provider/provider.dart';
import 'package:lupe/config/config.dart';

import '../provider/trip_details_page_provider.dart';

class TripDetailsGalery extends StatelessWidget 
{
  const TripDetailsGalery({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TripDetailsPageProvider pageProvider = context.read<TripDetailsPageProvider>();

    int crossAxisCount = 5;
    int itemCount = pageProvider.state.trip.images.length;
    double spacing = 2;
    double rows = (itemCount / crossAxisCount);
    int maxItems = (rows.ceil() * crossAxisCount);
    int secondBottomRightIndex = ((maxItems - crossAxisCount) - 1);

    return SliverGrid.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,          
      ),
      itemBuilder: (BuildContext context, int index) 
      {
        String imageUrl = pageProvider.state.trip.images[index];
        bool isTopLeftCorner = (index == 0);
        bool isBottomLefttCorner = (index == maxItems - crossAxisCount);
        bool isTopRightCorner = this.getBottomLefttCorner(index, crossAxisCount, itemCount);
        bool isBottomRightCorner = this.getBottomRightCorner(
          index: index, 
          maxItems: maxItems, 
          itemCount: itemCount, 
          secondBottomRightIndex: secondBottomRightIndex,
        );

        return _Item(
          isTopLeftCorner: isTopLeftCorner, 
          isTopRightCorner: isTopRightCorner, 
          isBottomLefttCorner: isBottomLefttCorner, 
          isBottomRightCorner: isBottomRightCorner, 
          imageUrl: imageUrl,
        );
      },
    );
  }

  bool getBottomLefttCorner(int index, int crossAxisCount, int itemCount) 
  {
    return (index == (crossAxisCount - 1) || 
           (itemCount < crossAxisCount) && 
           index == (itemCount - 1));
  }

  bool getBottomRightCorner(
  {
    required int index, 
    required int maxItems, 
    required int itemCount, 
    required int secondBottomRightIndex,
  }) 
  {
    return (index == (itemCount - 1) || 
           ((itemCount < maxItems) && 
           index == secondBottomRightIndex));
  }
}

class _Item extends StatelessWidget 
{
  final bool isTopLeftCorner;
  final bool isTopRightCorner;
  final bool isBottomLefttCorner;
  final bool isBottomRightCorner;
  final String imageUrl;

  const _Item(
  {
    required this.isTopLeftCorner,
    required this.isTopRightCorner,
    required this.isBottomLefttCorner,
    required this.isBottomRightCorner,
    required this.imageUrl,
  });


  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: ()=> context.pushNamed(AppRouteNames.imageViewer, extra: this.imageUrl),
      child: Hero(
        tag: this.imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isTopLeftCorner ? AppConstrains.imageRadius : 0),
            topRight: Radius.circular(isTopRightCorner ? AppConstrains.imageRadius : 0),
            bottomLeft: Radius.circular(isBottomLefttCorner ? AppConstrains.imageRadius : 0),
            bottomRight: Radius.circular(isBottomRightCorner ? AppConstrains.imageRadius : 0),
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            placeholder: (BuildContext context, String url)=> const ImagePlaceHolder(),
            errorWidget: (BuildContext context, String url, Object error)=> const ImagePlaceHolder(),
            errorListener: (Object value) => {},
          ),
        ),
      ),
    );
  }
}

