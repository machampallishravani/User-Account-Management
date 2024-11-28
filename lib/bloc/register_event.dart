import 'dart:io';

abstract class RegisterEvent {}

class RegisterFormSubmitted extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String password;
  final String confirmPassword;
  final File? profileImage;

  RegisterFormSubmitted({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.password,
    required this.confirmPassword,
    this.profileImage,
  });
}
