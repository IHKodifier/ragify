import 'package:ragify/widget_export.dart';

class UserHomePage extends ConsumerWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body:  Center(child: Text('User Home GAME OVER')),
    floatingActionButton: FloatingActionButton.extended(onPressed: null, label: Icon(Icons.home)),);
  }
}