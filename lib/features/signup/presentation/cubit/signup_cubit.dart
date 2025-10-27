import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsouq_merchant/core/api/api_result.dart';
import 'package:newsouq_merchant/features/signup/data/repos/signup_repo_imp.dart';
import 'package:newsouq_merchant/features/signup/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepoImp signupRepoImp;

  SignupCubit({required this.signupRepoImp}) : super(SignupInitial());

  void signup(String email, String password, String name) async {
    emit(SignupLoading());

    ApiResult<UserCredential> response = await signupRepoImp.signup(
      email,
      password,
      name,
    );

    if (response is Success<UserCredential>) {
      emit(SignupSuccess(userCredential: response.data));
    } else if (response is Failure<UserCredential>) {
      emit(SignupError(apiErrorModel: response.apiErrorModel));
    }
  }
}
