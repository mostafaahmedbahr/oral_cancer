
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/components/constants/constants.dart';


import '../../components/custom_button.dart';
import '../../components/custom_text_form_field.dart';


class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor:primaryColor,
        centerTitle: true,
        elevation: 0.0,
      ),
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
                      size: 80.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextFormField(
                        hintText: "Name",
                        controller: nameController,
                        icon: Icons.person,
                        type: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Name Must Not be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultTextFormField(
                        hintText: "Email",
                        controller: emailController,
                        icon: Icons.email,
                        type: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Email Must Not be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultTextFormField(
                        hintText: "Phone",
                        controller: phoneController,
                        icon: Icons.call,
                        type: TextInputType.phone,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Phone Must Not be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: CustomButton(
                          color: primaryColor,
                          text: "Save",
                          onPressed: (() {
                            if (formKey.currentState!.validate()) {

                            }
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
