
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ragify/widget_export.dart';

class AppUser {
  final String uid; // Firebase UID
  final String email;
  final String? displayName;
  final String? photoURL;
  SubscriptionTier subscriptionTier;
  DateTime? lastActive;
  // ... other analytics data (e.g., usage stats)

  AppUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    this.subscriptionTier = SubscriptionTier.free, // Default tier
    this.lastActive,
    // ... other analytics data
  });

  // Factory constructor to create AppUser from Firebase User
  factory AppUser.fromFirebaseUser(firebase_auth.User user) {
    return AppUser(
      uid: user.uid,
      email: user.email!, // Assuming email is mandatory
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }

  // Method to update user data in Firestore
  Future<void> updateUserData(FirebaseFirestore firestore) async {
    await firestore.collection('users').doc(uid).set({
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'subscriptionTier': subscriptionTier.name, // Store enum name
      'lastActive': lastActive,
      // ... other analytics data
    });
  }
}

// Enum for Subscription Tiers
enum SubscriptionTier { free, basic, premium }
