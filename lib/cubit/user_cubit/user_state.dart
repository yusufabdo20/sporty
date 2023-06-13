part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {}

class UserSuccessWithList extends UserState {
  List<UserModel> users = [];

  UserSuccessWithList( {required List<UserModel> users});
}

class UserFailure extends UserState {}
