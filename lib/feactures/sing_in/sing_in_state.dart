abstract class SingInState {}

class SignInInitialState extends SingInState {}

class SignInLoadingState extends SingInState {}

class SignInSuccessState extends SingInState {}

class SignUpErrorState extends SingInState {
  final String message;
  SignUpErrorState(this.message);
}
