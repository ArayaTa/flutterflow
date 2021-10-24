import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RiankChangFirebaseUser {
  RiankChangFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

RiankChangFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RiankChangFirebaseUser> riankChangFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RiankChangFirebaseUser>(
            (user) => currentUser = RiankChangFirebaseUser(user));
