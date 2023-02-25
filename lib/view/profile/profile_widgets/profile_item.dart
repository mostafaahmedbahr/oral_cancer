import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

class ProfileItems extends StatelessWidget {
  const ProfileItems({Key? key, required this.startIcon, required this.title,required this.onTap}) : super(key: key);
  final IconData startIcon;
  final String title;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Row(
            children: [
              Icon(startIcon,size: 30.w,),
              SizedBox(width: 15.w,),
              Expanded(
                child: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),),
              ),
              const Spacer(),
              // SvgPicture.asset("assets/images/211607_right_arrow_icon.svg",width: 25.w,height: 22.h,),

            ],
          ),
        ),
      ),
    )
    ;
  }
}
