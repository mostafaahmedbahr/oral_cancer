import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';


class OralLoginCubit extends Cubit<OralLoginStates>
{
  OralLoginCubit() : super(OralLoginInitialState());

  static OralLoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
   void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }

  var emailCon = TextEditingController();
  var passCon = TextEditingController();

  void login({
    required String email,
    required String password,
})async
  {
    emit(OralLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      emit(OralLoginSuccessState());
      print("success");
    }).catchError((error)
    {
      emit(OralLoginErrorState( error.toString()));
      print("error in login ${error.toString()}");
    });
  }



}