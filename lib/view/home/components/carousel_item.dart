import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Image.asset(
          image,
          width:double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
