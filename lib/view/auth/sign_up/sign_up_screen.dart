
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/view/auth/login/login_screen.dart';
import 'package:oral_cancer/view/auth/sign_up/sign_up_cubit.dart';
import 'package:oral_cancer/view/auth/sign_up/sign_up_states.dart';
import 'package:oral_cancer/view/home/home_screen.dart';

import '../../../components/constants/constants.dart';
import '../../../layouts/home_layout/home_layout_screen.dart';
import '../../../widgets/camera_widget.dart';



class OralSignUpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OralSignUpCubit(),
      child: BlocConsumer<OralSignUpCubit,OralSignUpStates>(
        listener: (context, state) {
          if(state is OralSignUpSuccessState){
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context)=>const HomeLayoutScreen(),),
            );
          }
        },
        builder: (context, state) {
          var cubit = OralSignUpCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset("assets/images/oral1.png"),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sign Up To ",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: thirdColor,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text("Oral Cancer ",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: thirdColor,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ],
                              ),
                             const Spacer(),
                             Stack(
                               alignment: Alignment.bottomRight,
                               children: [
                                 CircleAvatar(
                                   radius: 70.sp,
                                   child:    ClipRRect(
                                     borderRadius: BorderRadius.circular(50),
                                     child: Image.network("https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1060&t=st=1667462533~exp=1667463133~hmac=02170f1859a0031e4df6c3517b669b2d3dd332d7e2813b5e6e042ce5e2c052c6",
                                       height: 140,
                                       fit: BoxFit.cover,),
                                   ),
                                 ),
                                InkWell(
                                  onTap: (){
                                    openImagePicker(context);
                                  },
                                  child:  const CircleAvatar(
                                    backgroundColor:thirdColor,
                                    child: Icon(Icons.edit,
                                      color: Colors.white,),
                                  ),
                                ),
                               ],
                             ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: cubit.nameCon,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "name must not be empty ..";
                              }
                            },
                            decoration:  InputDecoration(
                              border:const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: thirdColor,
                                  )
                              ),
                              focusedBorder: const  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                              prefixIcon:const Icon(Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: cubit.phoneCon,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "phone must not be empty ..";
                              }
                            },
                            decoration:  InputDecoration(
                              border:const OutlineInputBorder(),
                              enabledBorder:const  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: thirdColor,
                                  )
                              ),
                              focusedBorder:const   OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              hintText: "phone",
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                              prefixIcon:const Icon(Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: cubit.addressCon,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "address must not be empty ..";
                              }
                            },
                            decoration:  InputDecoration(
                              border:const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: thirdColor,
                                  )
                              ),
                              focusedBorder: const  OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              hintText: "Address",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                              prefixIcon:const Icon(Icons.home_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: cubit.emailCon,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "email is not vaild";
                              }
                            },
                            decoration:  InputDecoration(
                              border:const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: thirdColor,
                                  )
                              ),
                              focusedBorder: const  OutlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.black,
                                  )
                              ),
                              hintText: "E-Mail",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,

                              ),
                              prefixIcon:const Icon(Icons.email,
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
                            controller: cubit.passCon,
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
                              hintStyle:   TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
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
                            condition: state is! OralSignUpLoadingState,
                            builder: (context)=> SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: thirdColor,
                                ),
                                onPressed: (){
                                  cubit.register(
                                    name:  cubit.nameCon.text,
                                    email: cubit.emailCon.text,
                                    phone: cubit.phoneCon.text,
                                    password: cubit.passCon.text,
                                  );
                                },
                                child:   Text("Sign Up",
                                  style: TextStyle(
                                    fontSize: 25.sp,
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
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context)=>OralLoginScreen(),),
                                  );
                                },
                                child:  Text("Login",
                                  style: TextStyle(
                                    color: thirdColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp,
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
            ),
          );
        },
      ),
    );
  }

}