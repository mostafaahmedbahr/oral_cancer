import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/view/profile/profile_widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 68.r,
                  child: CircleAvatar(
                    radius: 65.r,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 80.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileItems(
                        startIcon: Icons.person,
                        title: "Khaled Maher",
                        onTap: () {}),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 5.h,
                    ),
                    ProfileItems(
                        startIcon: Icons.email,
                        title: "khaled.maher@gmail.com",
                        onTap: () {}),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 5.h,
                    ),
                    ProfileItems(
                        startIcon: Icons.phone,
                        title: "01145822106",
                        onTap: () {}),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
