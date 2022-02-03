import 'dart:async';
import '../../../../models/user.dart';
import '../user/user_repository.dart';
import '../../app/service_locator.dart';

abstract class UserService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<User>> fetchUsers();
  Future<User> getUser(id);
  Future<User> updateUser({id, User data});
  Future<void> removeUser(id);
  Future<User> addUser(User data);

  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
