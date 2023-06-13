part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {}

class UserSuccessWithList extends UserState {
  List<UserModel> user = [];

  UserSuccessWithList(List<Map<String, dynamic>> user);
}

class UserFailure extends UserState {}
