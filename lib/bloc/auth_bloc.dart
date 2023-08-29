import 'package:app/bloc/auth_event.dart';
import 'package:app/bloc/auth_state.dart';
import 'package:app/models/auth_model.dart';
import 'package:app/models/response_model.dart';
import 'package:app/network/auth_provider.dart';
import 'package:app/utils/string_to_sha1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String login = '';
  String password = '';

  Future<ResponseModel> _getImage({required String login, required String pass}) async {
    var response = await AuthProvider().auth(authParams: AuthModel(login: login, password: pass));
    return response;
  }

  AuthBloc() : super(AuthInitState()) {
    on<AutorisationEvent>(_onAuthorization);
  }

  void _onAuthorization(event, emit) async {
    emit(AuthorizationState());
    ResponseModel data = await _getImage(login: login, pass: stringToSha1(password).toString());
    data.success == true
        ? emit(AuthorizedState(imageData: data.data))
        : emit(AuthErrorState(errorMessage: data.reason ?? 'some error'));
  }
}
