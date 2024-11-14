import 'package:ragify/widget_export.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AppUser?> getUser(String userId) async {
    try {
      final docSnapshot =
          await _firestore.collection('users').doc(userId).get();

      if (docSnapshot.exists) {
        return AppUser.fromFirestore(docSnapshot);
      } else {
        return null; // User document doesn't exist
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}
