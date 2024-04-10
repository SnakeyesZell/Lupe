import 'package:flutter/material.dart';
import 'package:lupe/config/assets/app_fonts.dart';

class CustomPrimaryButton extends StatelessWidget 
{
  final String label;
  final VoidCallback onTap;

  const CustomPrimaryButton(
  {
    super.key, 
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xfffee600),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22
          ),
          child: Text(
            this.label,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.quicksandBold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
