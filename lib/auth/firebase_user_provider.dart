import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyStartingLineupFirebaseUser {
  MyStartingLineupFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

MyStartingLineupFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyStartingLineupFirebaseUser> myStartingLineupFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MyStartingLineupFirebaseUser>(
            (user) => currentUser = MyStartingLineupFirebaseUser(user));
