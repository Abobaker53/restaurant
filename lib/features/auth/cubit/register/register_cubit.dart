import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/cubit/register/register_state.dart';

import '../../data/repo/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  final AuthRepo repo = AuthRepo();

  static RegisterCubit get(context) => BlocProvider.of(context);

  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  onRegisterPressed() async {
    emit(RegisterLoadingState());
    var result = await repo.register(
      name: name.text,
      password: password.text,
      email: email.text,
      phone: phone.text,
    );
    result.fold(
      (error) {
        emit(RegisterErrorState(error));
      },
      (message) {
        emit(RegisterSuccessState(message));
      },
    );
  }
}
