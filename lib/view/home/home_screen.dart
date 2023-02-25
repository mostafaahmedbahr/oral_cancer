import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/bloc/cubit.dart';
import 'package:oral_cancer/bloc/states.dart';
import 'package:oral_cancer/view/home/components/carousel_item.dart';
import 'package:oral_cancer/view/home/components/service_item.dart';
import 'package:oral_cancer/view/types/types_screen.dart';

import '../../widgets/camera_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> carouselItems = [
    const CarouselItem(image: "assets/images/2009.jpg"),
    const CarouselItem(image: "assets/images/5523045.jpg"),
    const CarouselItem(
        image: "assets/images/shutterstock_1932108737-scaled.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                    items: carouselItems,
                    options: CarouselOptions(
                      height: 130.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Choose a Service",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ServiceItem(
                  title: "Oral Cancer Category",
                  description:
                      "Read about oral cancer Categories and increase your knowledge",
                  image: "assets/images/5523045-removebg-preview.png",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    {
                      return TypesScreen();
                    }));
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                ServiceItem(
                  title: "Detect Oral Cancer",
                  description:
                      "Take a picture and detect if you normal or suffering from oral cancer or ulcer",
                  image: "assets/images/5523045-removebg-preview.png",
                  onTap: () {
                    openImagePicker(context);
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Contact Us",
            onPressed: () {},
            child: Image.asset("assets/images/doctor.png"),
          ),
        );
      },
    );
  }
}
