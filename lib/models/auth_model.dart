class AuthModel {
  const AuthModel({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(login: json['login'].toString(), password: json['password'].toString());

  Map<String, dynamic> toJson() => {'login': login, 'password': password};
}
