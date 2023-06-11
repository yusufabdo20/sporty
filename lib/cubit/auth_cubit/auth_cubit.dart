import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMassage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMassage: 'wrong-password'));
      }
    } catch (ex) {
      emit(LoginFailure(errMassage: 'somthing went wrong'));
    }
  }

  Future<void> registerUser(
      {required String email, required String password ,required String name}) async {
    emit(RegistrLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = user.user!.uid;
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        // 'imagePath': imagePath,
      });
      emit(RegistrSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegistrFailure(errMassage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegistrFailure(errMassage: 'email-already-in-use'));
      }
    } catch (ex) {
      emit(RegistrFailure(errMassage: 'Something Went Wrong'));
    }
  }
}
