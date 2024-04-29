import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lupe/ui/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/config/config.dart';

import 'package:lupe/ui/providers/providers.dart';

class HomeGalery extends StatelessWidget 
{
  const HomeGalery({super.key});

  @override
  Widget build(BuildContext context) 
  {
    AuthProvider authProvider = context.watch<AuthProvider>();
    bool isLupeUserNotNull = authProvider.state.lupeUser != null;

    return (isLupeUserNotNull) 
    ? const _Galery()
    : const SliverToBoxAdapter(child: CircularProgressIndicator());
  }
}

class _Galery extends StatefulWidget 
{
  const _Galery();

  @override
  State<_Galery> createState() => _GaleryState();
}

class _GaleryState extends State<_Galery> 
{
  @override
  void initState() 
  {
    this.getTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    double spacing = 5;
    TripsProvider tripsProvider = context.watch<TripsProvider>();
    bool isTripsLoaded = tripsProvider.state.areTripsLoaded;

    return SliverGrid.builder(
      itemCount: (!isTripsLoaded) ? 10 : 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,          
      ), 
      itemBuilder: (BuildContext context, int index)
      {
        return (isTripsLoaded) 
        ? _ImageCard(trip: tripsProvider.state.trips[0])
        : ClipRRect(
            borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
            child: const ImagePlaceHolder()
          );
      },
    );
    // : const SliverToBoxAdapter(child: Text('There are no trips'));

    //TODO: Create an empty Widget 
  }

  Future<void> getTrips() async
  {    
    String lupeUserId = context.read<AuthProvider>().state.lupeUser!.id;
    await context.read<TripsProvider>().getTrips(lupeUserId);    
  }
}


class _ImageCard extends StatelessWidget 
{ 
  final Trip trip;

  const _ImageCard(
  {
    required this.trip,
  });

  @override
  Widget build(BuildContext context) 
  {        
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
      child: Stack(
        children: <Widget>
        [
          Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: this.trip.images.first,
              errorWidget: (BuildContext context, String url, Object error) => const ImagePlaceHolder(),
              placeholder: (context, url) => const ImagePlaceHolder(),
            ),
          ),
            
          Align(
            alignment: Alignment.topCenter,
            child: _TopLabel(date: this.trip.date),
          ),
      
          Align(
            alignment: Alignment.bottomCenter,
            child: _CardImageLabel(
              title: this.trip.title,
              description: this.trip.description,
            ),
          )
        ],
      ),
    );
  }
}

class _CardImageLabel extends StatelessWidget 
{
  final String title;
  final String description;

  const _CardImageLabel(
  {
    required this.title, 
    required this.description,
  });

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                Text(
                  this.title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSizes.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  this.description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopLabel extends StatelessWidget 
{
  final DateTime date;

  const _TopLabel(
  {
    required this.date,
  });

  @override
  Widget build(BuildContext context) 
  {
    String formattedDate = DateFormat.yMMMMd().format(this.date);

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const <double> [ 0.1, 0.3 ],
          colors: <Color>
          [
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.2),
          ],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          Text(
            formattedDate,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),            
          ),
        ],
      ),
    );
  }
}

