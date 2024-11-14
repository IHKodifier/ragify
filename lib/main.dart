

import 'package:firebase_core/firebase_core.dart';
import 'package:ragify/firebase_options.dart';
import 'package:ragify/widget_export.dart';



void main() async  {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

