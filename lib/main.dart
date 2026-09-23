
import 'package:dev_mode/views/home/home.dart';
import 'package:dev_mode/views/onboarding/sign_in.dart';
import 'package:dev_mode/views/onboarding/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    await dotenv.load(fileName: '.env');
    print('BACKEND URL: ${dotenv.env['BACKEND_URL']}');
  }catch(e){
    print('ERROR: $e');
  }
  runApp(DevMode());
}

class DevMode extends StatelessWidget {
  const DevMode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Signup(),//Login(),//HomePage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}