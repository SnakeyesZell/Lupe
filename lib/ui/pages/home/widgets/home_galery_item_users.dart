import 'package:flutter/material.dart';
import 'package:lupe/config/config.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lupe/domain/domain.dart';
import 'package:lupe/ui/shared/shared.dart';

class HomeGaleryItemUsers extends StatelessWidget 
{
  final List<LupeUser> users;
  
  const HomeGaleryItemUsers(
  {
    super.key, 
    required this.users,
  });

  @override
  Widget build(BuildContext context) 
  {
    double containerSize = 25;
    double itemsBorderWith = 2;
    double itemsSize = (containerSize - (itemsBorderWith * 2));

    return SizedBox(
      height: containerSize,      
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: this.users.length,
        itemBuilder: (BuildContext context, int index)=> Align(
          alignment: const Alignment(-1, 0),
          widthFactor: 0.7,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: itemsBorderWith,
                color: Colors.white,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstrains.imageRadius),
              child: CachedNetworkImage(
                width: itemsSize,
                height: itemsSize,
                fit: BoxFit.cover,
                imageUrl: this.users[index].imageUrl,
                errorWidget: (BuildContext context, String url, Object error)=> const ImagePlaceHolder(),
                placeholder: (BuildContext context, String url)=> const ImagePlaceHolder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

