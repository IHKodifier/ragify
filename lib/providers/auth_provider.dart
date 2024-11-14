import 'package:ragify/widget_export.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

final userProfileProvider = FutureProvider<AppUser?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final userService = ref.watch(userServiceProvider);

  if (authState.value != null) {
    return userService.getUser(authState.value!.uid);
  }
  return null;
});
