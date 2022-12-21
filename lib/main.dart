import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/bloc/cubit.dart';
import 'package:oral_cancer/components/constants/constants.dart';
import 'package:oral_cancer/layouts/home_layout/home_layout_screen.dart';
import 'package:oral_cancer/shared/local/cache_helper.dart';
import 'package:oral_cancer/view/auth/login/login_screen.dart';

import 'layouts/on_boarding/on_boarding_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await CacheHelper.init();
  Widget startWidget;

  bool isBoarding=CacheHelper.getData(key: "isBoarding")??false;
  if(isBoarding){
    startWidget=OralLoginScreen();
  }else{
    startWidget=const OnBoardingScreen();
  }
  runApp( MyApp(start: startWidget,));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.start}) : super(key: key);

  final Widget start;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(providers: [
          BlocProvider(create: (BuildContext context)=>AppCubit()),
        ], child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // fontFamily: "ZenDots",
            primaryColor: primaryColor,
            primarySwatch: primaryColor,
          ),
          home: OnBoardingScreen(),
        ));
      },
    );
  }
}
