import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:lupe/config/config.dart';

class TripDetailsMapTab extends StatelessWidget 
{
  const TripDetailsMapTab({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstrains.viewportMargin),
      child: const CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: <Widget>
        [
          SliverToBoxAdapter(child: _Map()),
          SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight,)),
          SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight,)),
        ],
      ),
    );
  }
}

class _Map extends StatefulWidget 
{
  const _Map();

  @override
  State<_Map> createState() => __MapState();
}

class __MapState extends State<_Map> with AutomaticKeepAliveClientMixin
{
  late Completer<GoogleMapController> controller;
  late CameraPosition kGooglePlex;

  @override
  void initState() 
  {
    this.controller = Completer<GoogleMapController>();
    this.kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );  
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    super.build(context);
    double mapHeight = (MediaQuery.of(context).size.height * 0.6);
    Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = <Factory<OneSequenceGestureRecognizer>>
    {
      Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: 5,          
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstrains.imageRadius - 5),
        child: SizedBox(
          height: mapHeight,
          child: GoogleMap(
            mapType: MapType.normal,
            compassEnabled: false,
            gestureRecognizers: gestureRecognizers,
            initialCameraPosition: this.kGooglePlex,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) 
            {
              this.controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

