import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget 
{
  final String label;
  final VoidCallback onTap;
  final Widget leading;
  final Widget traling;
  final double? withd;
  final Color? color;

  const CustomPrimaryButton(
  {
    super.key, 
    required this.label,
    required this.onTap, 
    this.leading = const SizedBox.shrink(), 
    this.traling = const SizedBox.shrink(), 
    this.withd, 
    this.color,
  });

  @override
  Widget build(BuildContext context) 
  {
    double height = 60;

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: this.withd,
        height: height,
        decoration: BoxDecoration(
          color: (this.color != null) ? this.color : Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>
            [
              this.leading,
              Text(
                this.label,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              this.traling,
            ],
          ),
        ),
      ),
    );
  }
}
