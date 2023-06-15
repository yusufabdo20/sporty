import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sporty/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

  void addUserToEvent({
    required String eventId,
    required String userEmail,
    required bool userAdmin,
  }) {
    emit(UserLoading());
    try {
      final eventRef = events.doc(eventId);
      final usersCollection = eventRef.collection('users');

      usersCollection.add({
        'userEmail': userEmail,
        'userAdmin': userAdmin,
      });
      emit(UserSuccess());
    } catch (e) {
      emit(UserFailure());
    }
  }

  // Future<UserModel?> getUser(String email) async {
  //   QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('userEmail', isEqualTo: email)
  //       .get();

  //   if (usersSnapshot.docs.isNotEmpty) {
  //     // Assuming there's only one user with the given email
  //     var userData = usersSnapshot.docs[0].data();
  //     return UserModel(
  //       userEmail: userData['userEmail'], userName: userData['userName'],
  //       userImage: userData['userImage'],
  //       // Add other required properties
  //     );
  //   }

  //   return null; // Return null if no user found
  // }

  void getUser(String email) async {
    QuerySnapshot usersSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    emit(UserLoading());
    try {
      List<DocumentSnapshot> matchingUsers =
          usersSnapshot.docs.where((docSnapshot) {
        Map<String, dynamic>? userData =
            docSnapshot.data() as Map<String, dynamic>?;
        String userEmail = userData?['userEmail'];
        return userEmail == email;
      }).toList();

      List<UserModel> users = UserModel.fromJson(matchingUsers as Map<String, dynamic>) as List<UserModel>;

      emit(UserSuccessWithList(users: users));
    } catch (e) {
      emit(UserFailure());
    }
  }
}
