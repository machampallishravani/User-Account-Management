abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSubmitting extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
