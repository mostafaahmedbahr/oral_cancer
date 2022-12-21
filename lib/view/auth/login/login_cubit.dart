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



}