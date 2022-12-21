import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oral_cancer/bloc/states.dart';
import 'package:oral_cancer/view/home/home_screen.dart';
import 'package:oral_cancer/view/notification/notification_screen.dart';
import 'package:oral_cancer/view/profile/profile_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: "Notification"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: "Profile"),
  ];
  List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  final picker = ImagePicker();
  File? selectImage;
  String? base64 ;
  String? imageName;

  Future<void> openCamera(context) async {
    final pickedFile = await picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.camera);
    if (pickedFile != null) {
      selectImage = File(pickedFile.path);
      // await  upload(selectImage);
    } else {
      print('No image selected.');
    }
    emit(SetImageProfileFromCamera());
  }

  Future<void> openGallery( context) async {
    final pickedFile = await picker.pickImage(
        imageQuality: 50,
        maxHeight: 300,
        maxWidth: 400,
        source: ImageSource.gallery);

    if (pickedFile != null) {
      selectImage = File(pickedFile.path);
      base64 = base64Encode(selectImage!.readAsBytesSync());
      imageName = selectImage?.path.split("_").last;
      print(imageName);


    } else {
      print('No image selected.');
    }
    emit(SetImageProfileFromGallery());
  }
}
