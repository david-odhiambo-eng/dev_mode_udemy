import 'package:dev_mode/model/auth/sign_up.dart';
import 'package:dev_mode/providerViewModel/auth/signup_provider.dart';
import 'package:dev_mode/views/reusables/success_error.dart';
import 'package:dev_mode/views/home/home_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _playerController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<SignupProvider>().isLoading;
    SignupProvider signUpProvider = context.read<SignupProvider>();
    return Scaffold(
      body: HomeImage(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JetBrainsMono',
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Provide the details below',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontFamily: 'JetBrainsMono',
                        ),
                      ),
                      SizedBox(height: 32),
                      //TextField
                      _showTextField(
                        hint: 'Enter player name',
                        controller: _playerController,
                      ),
                      const SizedBox(height: 14),
                      _showTextField(
                        hint: 'Enter your email',
                        controller: _emailController,
                        textType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 14),
                      _showTextField(
                        hint: 'Enter your password',
                        controller: _passwordController,
                        hidePassword: true,
                      ),

                      const SizedBox(height: 28),
                      //GO BUTTON
                      GestureDetector(
                        onTap: isLoading
                            ? null
                            : () async {
                                await signUpProvider.signUpUser(
                                  playerName: _playerController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );

                                final String? errorMessage =
                                    signUpProvider.errorMessage;
                                final SignUpModel? user = signUpProvider.user;

                                if (!context.mounted) {
                                  return;
                                }

                                if (errorMessage != null) {
                                  //handle error
                                  showErrorOrSuccess(
                                    message: errorMessage,
                                    color: Colors.red,
                                    context: context,
                                  );
                                } else if (user != null) {
                                  //tell the user
                                  showErrorOrSuccess(
                                    message: 'Welcome ${user.playerName}',
                                    color: Colors.green,
                                    context: context,
                                  );
                                }
                              },
                        child: !isLoading
                            ? Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/images/go.png'),
                              )
                            : Text(
                                'Signing you upp...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'JetBrainsMono',
                                ),
                              ),
                      ),
                      SizedBox(height: 28),

                      //GO BUTTON
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white.withValues(alpha: 0.15),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontFamily: 'JetBrainsMono',
                                fontSize: 14,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white.withValues(alpha: 0.15),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      //GOOGLE BUTTON
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Color(0xFF272822),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          padding: EdgeInsets.all(22),
                          child: Image.asset('assets/images/google.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //text field
  Widget _showTextField({
    required String hint,
    required TextEditingController controller,
    bool hidePassword = false,
    TextInputType? textType,
  }) {
    return TextField(
      controller: controller,
      obscureText: hidePassword,
      keyboardType: textType,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'JetBrainsMono',
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontFamily: 'JetBrainsMono',
          fontSize: 14,
        ),
        filled: true,
        fillColor: const Color(0xFF272822),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 17,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.08),
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
