abstract class SingUpState {}

class SignUpInitialState extends SingUpState {}

class SignUpLoadingState extends SingUpState {}

class SignUpSuccessState extends SingUpState {}

class SignUpErrorState extends SingUpState {
  final String message;
  SignUpErrorState(this.message);
}
