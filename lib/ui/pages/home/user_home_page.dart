import 'package:ragify/widget_export.dart';



class UserHomePage extends ConsumerWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileAsync = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authServiceProvider).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: userProfileAsync.when(
        data: (user) {
          if (user != null) {
            return Center(child: Text('Welcome, ${user.displayName}!'));
          } else {
            return const Center(child: Text('User profile not found.'));
          }
        },
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: const Icon(Icons.home),
      ),
    );
  }
}
