import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/components/constants/constants.dart';

class DrawerItems extends StatelessWidget {
   DrawerItems({Key? key,required this.onTap, required this.title, required this.icon}) : super(key: key);
  final void Function()? onTap;
  final String title;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,color: thirdColor,),
            SizedBox(width: 20.w,),
            Text(title,style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),),
            const Spacer(),
            Icon(Icons.arrow_forward_ios,color: thirdColor,),
          ],
        ),
      ),
    );
  }
}
