
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

  // Factory constructor from Firestore document
  factory AppUser.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data()!; // Get data from the document

    return AppUser(
      uid: doc.id, // UID is the document ID
      email: data['email'],
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      subscriptionTier:
          _getSubscriptionTierFromString(data['subscriptionTier']),
      lastActive: data['lastActive'] != null
          ? (data['lastActive'] as Timestamp).toDate()
          : null,
      // ... map other fields from data
    );
  }

  // Helper function to convert String to SubscriptionTier enum
  static SubscriptionTier _getSubscriptionTierFromString(String? tier) {
    switch (tier) {
      case 'basic':
        return SubscriptionTier.basic;
      case 'premium':
        return SubscriptionTier.premium;
      default:
        return SubscriptionTier.free;
    }
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
