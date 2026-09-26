class SignInModel {
  String email;
  String playerName;
  String accessToken;
  String tokenType;

  SignInModel({
    required this.email,
    required this.playerName,
    required this.accessToken,
    required this.tokenType,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      playerName: json['player_name'],
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }
}
