import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'routes/router.dart';
import 'providers/courses_provider.dart';
import 'providers/conferences_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Carga de variables de entorno
  await dotenv.load(fileName: ".env");
  // Inicializa Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Configura estrategia de URL para web
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => ConferencesProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'SaulSandovalM',
        routerConfig: router,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: CustomColor.backgroundBase,
          useMaterial3: true,
        ),
      ),
    );
  }
}
