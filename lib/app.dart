import 'package:ragify/widget_export.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ragify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: authState.when(
        data: (user) {
          if (user != null) {
            return const UserHomePage();
          } else {
            return const PublicHomePage();
          }
        },
        error: (error, stackTrace) {
          print('Error: $error');
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong!'),
            ),
          );
        },
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      routes: {
        // publicHomeRoute: (context) => const PublicHomePage(),
        // userHomeRoute: (context) => const UserHomePage(),
      },
    );
  }
}
