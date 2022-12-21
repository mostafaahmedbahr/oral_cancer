import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oral_cancer/bloc/cubit.dart';
import 'package:oral_cancer/bloc/states.dart';

import '../../components/constants/constants.dart';
import '../../view/home/components/custom_drawer.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 5.0,
            backgroundColor: Colors.white,
            title: const Text(
              "Oral Cancer Detection",
              style: TextStyle(
                color: thirdColor,
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          drawer: const SafeArea(child: CustomDrawer()),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navItems,
            selectedItemColor: thirdColor,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
          ),
        );
      },
    );
  }
}
