import 'package:brain_train/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserScore(String userId, String gameId, int score) async {
    final userRef = _firestore.collection('users').doc(userId);
    final userDoc = await userRef.get();

    if (!userDoc.exists) {
      await userRef.set({
        'gameScores': {gameId: score},
      });
    } else {
      final currentScores = Map<String, int>.from(userDoc.data()?['gameScores'] ?? {});
      currentScores[gameId] = score;
      await userRef.update({'gameScores': currentScores});
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
