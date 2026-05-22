import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/auth_repo.dart';
import 'login_State.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  final AuthRepo repo = AuthRepo();

  static LoginCubit get(context) => BlocProvider.of(context);

  final email = TextEditingController();
  final password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  onLoginPressed() async {
    emit(LoginLoadingState());
    var result = await repo.login(
      email: email.text,
      password: password.text,
    );
    result.fold(
          (error) {
        emit(LoginErrorState(error));
      },
          (userModel) {
        emit(LoginSuccessState(userModel));
      },
    );
  }
}