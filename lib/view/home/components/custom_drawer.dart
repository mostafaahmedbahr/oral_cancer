import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/bloc/cubit.dart';

import '../../../layouts/home_layout/home_layout_screen.dart';
import 'drawer_items.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: mainColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage: const NetworkImage(
                      "https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Khaled Maher",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          Column(
            children: [
              DrawerItems(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>HomeLayoutScreen(),),);
                },
              ),
              const Divider(),
              DrawerItems(
                icon: Icons.notifications_none,
                title: "Notifications",
                onTap: () {
                  AppCubit.get(context).currentIndex=1;
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>HomeLayoutScreen(),),);
                },
              ),
              const Divider(),
              DrawerItems(
                icon: Icons.person_outline,
                title: "Profile",
                onTap: () {
                  AppCubit.get(context).currentIndex=2;
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>HomeLayoutScreen(),),);
                },
              ),
              const Divider(),
              DrawerItems(
                  icon: Icons.group_outlined,

                  title: "About Us",
                onTap: () {}
              ),
              const Divider(),

              DrawerItems(
                  icon: Icons.exit_to_app,

                  title: "Log Out",
                  onTap: () {}
              ),
            ],
          ),
        ],
      ),
    );
  }
}
