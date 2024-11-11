import 'package:ragify/widget_export.dart';

class PublicHomePage extends ConsumerWidget {
  const PublicHomePage({super.key});

   @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: Center(child: Text('Public Home Page')));
  }
}