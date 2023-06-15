class UserModel {
  final String userEmail;
  final String userName;
  String? userImage;
  bool userAdmin;

  UserModel({
    required this.userName,
    this.userImage,
    required this.userAdmin,
    required this.userEmail,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      userName: jsonData['userName'],
      userImage: jsonData['userImage'] == null ? '' : jsonData['userImage'] ,
      userEmail: jsonData['userEmail'],
      userAdmin: jsonData['userAdmin'] == false ? false : true,
    );
  }
}
