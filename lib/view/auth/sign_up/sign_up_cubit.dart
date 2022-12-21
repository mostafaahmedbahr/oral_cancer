import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:oral_cancer/view/auth/sign_up/sign_up_states.dart';



class OralSignUpCubit extends Cubit<OralSignUpStates>
{
  OralSignUpCubit() : super(OralSignUpInitialState());

  static OralSignUpCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }





}