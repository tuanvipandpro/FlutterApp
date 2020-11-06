class LoginResponse {
  String accessToken;
  int employeeId;
  bool admin;

  LoginResponse({this.accessToken, this.employeeId, admin});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['token'],
        employeeId: json['employeeId'],
        admin: json['admin']);
  }
}
