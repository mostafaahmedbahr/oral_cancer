import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/constants/constants.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.title, required this.description, required this.image,required this.onTap}) : super(key: key);
  final String title,description,image;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              // "assets/images/5523045-removebg-preview.png",
              width: 90.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // "Oral Cancer Category",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    description,
                    // "Read about oral cancer Categories and increase your knowledge",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: thirdColor,
            )
          ],
        ),
      ),
    );
  }
}
