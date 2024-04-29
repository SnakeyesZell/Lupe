import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/config/config.dart';
import 'package:lupe/domain/domain.dart';
import 'package:lupe/ui/shared/shared.dart';

class TripDetailsPage extends StatelessWidget 
{
  final Trip trip;

  TripDetailsPage(
  {
    super.key, 
    required this.trip,
  }): assert(trip.runtimeType == Trip);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>
        [
          SliverAppBar(
            title: Text(
              this.trip.title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: AppFontSizes.labelMedium,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 310),
              child: Column(
                children: <Widget>
                [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: CachedNetworkImage(
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                      imageUrl: this.trip.images.first,
                      errorWidget: (BuildContext context, String url, Object error)=> const ImagePlaceHolder(),
                      placeholder: (BuildContext context, String url)=> const ImagePlaceHolder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

