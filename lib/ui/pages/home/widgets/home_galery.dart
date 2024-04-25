import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';

class HomeGalery extends StatelessWidget 
{
  const HomeGalery({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>
            [
              _ImageCard(imagePath: 'assets/images/image3.jpg',),
              _ImageCard(imagePath: 'assets/images/image2.jpg',),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget 
{ 
  final String imagePath;

  const _ImageCard(
  {
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) 
  {
    Size size = MediaQuery.of(context).size;
    double imageWith = ((size.width / 2) - AppConstrains.viewportMargin - 5);
    double imageHeight = (size.height * 0.30);
        
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
      child: SizedBox(
        width: imageWith,
        height: imageHeight,  
        child: Stack(
          children: <Widget>
          [
            Positioned.fill(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(this.imagePath)
              ),
            ),
      
            const Align(
              alignment: Alignment.topCenter,
              child: _TopLabel(),
            ),
        
            const Align(
              alignment: Alignment.bottomCenter,
              child: _CardImageLabel(),
            )
          ],
        ),
      ),
    );
  }
}

class _CardImageLabel extends StatelessWidget 
{
  const _CardImageLabel();


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
                  'Quindio Le Daqk',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: AppFontSizes.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'This is a description of the trip',
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
  const _TopLabel();

  @override
  Widget build(BuildContext context) 
  {
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
            'March 20 - 2023',
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

