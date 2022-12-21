import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/bloc/cubit.dart';
import 'package:oral_cancer/view/auth/sign_up/sign_up_cubit.dart';



Widget pickItem(
    {required String title,
      required String icon,
      required VoidCallback onClick}) =>
    TextButton(
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(
                  color: Colors.black,
                ),),
                Image.asset(icon, height: 40.h),
              ]),
        ),
    );

void openImagePicker(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext openImagePicker) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: CupertinoActionSheet(
          cancelButton: CupertinoButton(
              child:    Text('Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.black,
              ),
              ),
              onPressed: () => Navigator.of(context).pop()),
          actions: <Widget>[
            TextButton(
                onPressed: () {},
                child:  const Text('Choose file',
                    style : TextStyle(
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center)),
            pickItem(
                title:'Camera',
                icon:'assets/images/camera.png',
                onClick: () {
                  AppCubit.get(context).openCamera(context);
                  Navigator.pop(context);
                }),

            pickItem(
                title: 'Gallery',
                icon: 'assets/images/gallery.png',
                onClick: () {
                  AppCubit.get(context).openGallery(context);
                  Navigator.pop(context);
                }),
          ],
        ),
      );
    },
  );
}