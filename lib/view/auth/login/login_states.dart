


abstract class OralLoginStates{}

class OralLoginInitialState extends OralLoginStates{}

class OralLoginLoadingState extends OralLoginStates{}

class OralLoginErrorState extends OralLoginStates{
  final String error;
  OralLoginErrorState(this.error);
}

class OralLoginSuccessState extends OralLoginStates{

}

class ChangeSuffixIconState extends OralLoginStates{}