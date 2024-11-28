import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterFormSubmitted) {
      yield RegisterSubmitting();
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (event.password != event.confirmPassword) {
          yield RegisterFailure(errorMessage: "Passwords do not match");
          return;
        }
        yield RegisterSuccess();
      } catch (e) {
        yield RegisterFailure(errorMessage: "An error occurred: $e");
      }
    }
  }
}
