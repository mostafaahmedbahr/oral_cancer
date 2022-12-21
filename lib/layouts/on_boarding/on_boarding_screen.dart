import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/components/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/local/cache_helper.dart';
import '../../view/auth/login/login_screen.dart';

class OnBoardingModel {
  String? image;
  String? head;
  String? title;

  OnBoardingModel(this.image, this.head, this.title);
}

List<OnBoardingModel> boarding = [
  OnBoardingModel("assets/images/6029666.jpg", "Symptoms of Oral Cancer", "Title 1"),
  OnBoardingModel("assets/images/oral2020.jpg", "Types of Oral Cancer", "Title 2"),
  OnBoardingModel("assets/images/istockphoto-1209230414-612x612.jpg", "What causes Oral Cancer?", "Title 3"),
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              CacheHelper.saveData(key: 'isBoarding', value: true)
                  .then((value) {
                if (value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OralLoginScreen()),
                      (route) => false);
                }
              });
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1.2,
                color: thirdColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildOnBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    spacing: 5.0,
                    dotWidth: 10,
                    expansionFactor: 4.0,
                    dotHeight: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: thirdColor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: thirdColor,
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.saveData(key: 'isBoarding', value: true)
                          .then((value) {
                        if (value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OralLoginScreen()),
                              (route) => false);
                        }
                      });
                    } else {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildOnBoarding(OnBoardingModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
          ),
           Image.asset(model.image!,height: 200.h,width: double.infinity,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            model.head!,
            style: TextStyle(
              fontSize: 26.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // Text(
          //   model.title!,
          //   style: const TextStyle(
          //     fontSize: 18.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      );
}
