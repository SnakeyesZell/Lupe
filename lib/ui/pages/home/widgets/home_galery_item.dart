import 'dart:ui';
import 'dart:math';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/config/config.dart';

import 'package:lupe/ui/shared/shared.dart';

import 'home_galery_item_users.dart';

class HomeGaleryItem extends StatelessWidget 
{ 
  final Trip trip;

  const HomeGaleryItem(
  {
    super.key, 
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
          Positioned.fill(child: _ImageCaroucel(images: this.trip.images)),
            
          Align(
            alignment: Alignment.topCenter,
            child: _TopLabel(
              date: this.trip.date,
              users: this.trip.linkedUsers,
            ),
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

class _ImageCaroucel extends StatefulWidget 
{ 
  final List<String> images;

  const _ImageCaroucel(
  {
    required this.images,
  });

  @override
  State<_ImageCaroucel> createState() => _ImageCaroucelState();
}

class _ImageCaroucelState extends State<_ImageCaroucel> 
{
  late int totalPages;
  late int currentPage;
  late PageController controller;
  late Timer timer;
  late Random random;

  @override
  void initState() 
  {
    this.currentPage = 0;
    this.totalPages = this.widget.images.length;
    this.controller = PageController();
    this.random = Random();

    this.startAutoPageChange();
    super.initState();
  }

  @override
  void dispose() 
  {
    this.timer.cancel();
    this.controller.dispose(); 

    super.dispose();
  }

  Future<void> startAutoPageChange() async
  {    
    int randomExecution = this.random.nextInt(3000);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async
    { 
      await Future.delayed(Duration(milliseconds: randomExecution), () 
      {
        this.createAutoPageChange();
      });
    });
  }

  void createAutoPageChange() 
  {
    int randomExecution = (this.random.nextInt(3) + 15);
    Duration timerDuration = Duration(seconds: randomExecution);

    this.timer = Timer.periodic(timerDuration, (Timer timer) 
    {
      (this.currentPage < this.totalPages - 1)
      ? this.currentPage++
      : this.currentPage = 0;

      this.controller.animateToPage(
        this.currentPage,
        duration: const Duration(milliseconds: 4000),
        curve: Curves.easeInOutQuart,
      );
    });
    
  }

  @override
  Widget build(BuildContext context) 
  {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: this.controller,
      itemCount: this.widget.images.length,
      itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: this.widget.images[index],
        errorWidget: (BuildContext context, String url, Object error) => const ImagePlaceHolder(),
        placeholder: (context, url) => const ImagePlaceHolder(),
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
  final List<LupeUser> users;

  const _TopLabel(
  {
    required this.date, 
    required this.users,
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
          const SizedBox(height: 5),
          HomeGaleryItemUsers(users: this.users),
        ],
      ),
    );
  }
}
