
 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/constants/constants.dart';
import '../sign_up/sign_up_screen.dart';
import 'login_cubit.dart';
import 'login_states.dart';


class OralLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailCon = TextEditingController();
    var passCon = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => OralLoginCubit(),
      child: BlocConsumer<OralLoginCubit,OralLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OralLoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/oral1.png"),
                          Text("Oral Cancer",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: thirdColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        SizedBox(
                          height: 30.0.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: emailCon,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "email is not vaild";
                            }
                          },
                          decoration: const InputDecoration(
                            border:OutlineInputBorder(),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: thirdColor,
                                )
                            ),
                            focusedBorder:   OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )
                            ),
                            hintText: "E-Mail",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: Icon(Icons.email,
                              color: Colors.black,
                            ),
                          ),
                        ),
                          SizedBox(
                          height: 15.0.h,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          onFieldSubmitted: (value)
                          {


                          },
                          obscureText: cubit.isVisible,
                          controller: passCon,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return "password is not correct";
                            }
                          },
                          decoration: InputDecoration(
                            border:const OutlineInputBorder(),
                            enabledBorder:const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: thirdColor,
                                )
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon:const Icon(Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.black,
                              icon: cubit.isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                              onPressed: (){
                                cubit.changeSuffixIcon();
                              },
                            ),
                          ),
                        ),
                          SizedBox(
                          height: 30.0.h,
                        ),
                        ConditionalBuilder(
                          condition: state is! OralLoginLoadingState,
                          builder: (context)=> SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: thirdColor,
                              ),
                              onPressed: (){

                              },
                              child:   Text("LoGin",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.white,
                                ),),
                            ),
                          ),
                          fallback: (context)=>const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                          SizedBox(
                          height: 15.0.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("",
                              style: TextStyle(
                                color: Colors.black,
                              ),),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context)=>OralSignUpScreen(),),);
                              },
                              child:  Text("Sign Up",
                                style: TextStyle(
                                  color: thirdColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}