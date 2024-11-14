import 'package:ragify/widget_export.dart';

class PublicHomePage extends ConsumerWidget {
  const PublicHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Public Home Page'),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(authServiceProvider).signInWithGoogle();
            // FirebaseFirestore.instance.collection('users').doc().set({'key':'value'});
          },
          child: Text('Google Sign In'),
        )
      ],
    )));
  }
}
