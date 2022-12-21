import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:oral_cancer/view/auth/sign_up/sign_up_states.dart';



class OralSignUpCubit extends Cubit<OralSignUpStates>
{
  OralSignUpCubit() : super(OralSignUpInitialState());

  static OralSignUpCubit get(context) => BlocProvider.of(context);
  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var passCon = TextEditingController();
  var phoneCon = TextEditingController();
  var addressCon = TextEditingController();
  bool isVisible = true;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }

  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async
  {
    emit(OralSignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user);
      print(value.user?.uid);
      emit(OralSignUpSuccessState());
      print("success");
    }).catchError((error) {
      emit(OralSignUpErrorState());
      print("error in register ${error.toString()}");
    });
  }



}