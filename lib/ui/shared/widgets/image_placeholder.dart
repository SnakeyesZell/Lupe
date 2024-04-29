import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget 
{
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
    );
  }
}

