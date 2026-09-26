import 'package:dev_mode/providerViewModel/signin_provider.dart';
import 'package:dev_mode/providerViewModel/signup_provider.dart';
import 'package:dev_mode/views/home/home.dart';
import 'package:dev_mode/views/onboarding/sign_in.dart';
import 'package:dev_mode/views/onboarding/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {}
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => SigninProvider())

      ],
      child: DevMode(),
    ),
  );
}

class DevMode extends StatelessWidget {
  const DevMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),//Signup(), //HomePage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
