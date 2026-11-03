import 'package:dev_mode/providerViewModel/auth/signin_provider.dart';
import 'package:dev_mode/providerViewModel/auth/signup_provider.dart';
import 'package:dev_mode/providerViewModel/get_quiz.dart';
import 'package:dev_mode/providers/team_quiz_data.dart';
import 'package:dev_mode/providers/topic_names_provider.dart';
import 'package:dev_mode/providers/team_name.dart';
import 'package:dev_mode/views/home/home.dart';
import 'package:dev_mode/views/onboarding/sign_in.dart';
import 'package:dev_mode/views/onboarding/signup.dart';
import 'package:dev_mode/views/onboarding/topics/add_teams.dart';
import 'package:dev_mode/views/onboarding/welcome/welcome.dart';

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
        ChangeNotifierProvider(create: (_) => SigninProvider()),
        ChangeNotifierProvider(create: (_) => TopicNamesProvider()),
        ChangeNotifierProvider(create: (_) => GetQuizProvider()),
        ChangeNotifierProvider(create: (_) => SelectedTeamProvider()),
        ChangeNotifierProvider(create: (_) => TeamQuizDataProvider()),
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
      home: Welcome(), //Login(),//Signup(), //HomePage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
