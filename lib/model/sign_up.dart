class SignUpModel {
  String email;
  String playerName;

  SignUpModel({required this.email, required this.playerName});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(email: json['email'], playerName: json['player_name']);
  }
}
