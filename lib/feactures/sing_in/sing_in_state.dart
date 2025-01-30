abstract class SingInState {}

class SignInInitialState extends SingInState {}

class SignInLoadingState extends SingInState {}

class SignInSuccessState extends SingInState {}

class SignInErrorState extends SingInState {
  final String message;
  SignInErrorState(this.message);
}
