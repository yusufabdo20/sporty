
class UserModel {
  final String userEmail;
  final String userName;
  final String userImage;
  bool userAdmin = false;

  UserModel(
      {required this.userName,
      required this.userImage,
      required this.userEmail});

  factory UserModel.fromJson(jsonDate) {
    return UserModel(
        userName: jsonDate['userName'],
        userImage: jsonDate['userImage'],
        userEmail: jsonDate['userEmail']);
  }
}
