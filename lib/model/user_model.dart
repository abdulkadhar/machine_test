enum AuthType { google, phoneNumber }

class UserModel {
  final String? userName;
  final String? phoneNumber;
  final String uid;
  final AuthType type;

  UserModel({
    required this.uid,
    required this.type,
    this.phoneNumber,
    this.userName,
  });
}
