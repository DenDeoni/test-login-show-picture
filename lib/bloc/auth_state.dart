sealed class AuthState {}

final class AuthInitState extends AuthState {}

final class AuthorizationState extends AuthState {}

final class AuthorizedState extends AuthState {
  final String imageData;

  AuthorizedState({required this.imageData});
}

final class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}
