import 'package:cook_app/app/presentation/common_widgets/text_field.dart';
import 'package:cook_app/app/presentation/common_widgets/tittle_widget.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/mixins/validate_mixin.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with CustomTextFieldValidator {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool obsecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTitle(
              padding: const EdgeInsets.fromLTRB(20, 89, 165, 68),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome Back To ',
                      style: theme.headlineLarge,
                    ),
                    TextSpan(
                      text: 'CooksCorner',
                      style: theme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gmail',
                      style: theme.headlineMedium,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      hintText: 'Enter your Gmail',
                      validator: validateNotEmpty,
                      controller: emailController,
                      suffixIcon: const Icon(
                        Icons.alternate_email,
                        size: 18,
                        color: AppColors.iconGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Password',
                      style: theme.headlineMedium,
                    ),
                    const SizedBox(height: 5),
                    MyTextField(
                      validator: validateNotEmpty,
                      hintText: 'Enter your Password',
                      controller: passwordController,
                      obscure: obsecure,
                      suffixIcon: IconButton(
                        onPressed: onObsecure,
                        icon: Icon(
                          obsecure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: AppColors.iconGrey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: onPressed,
                      child: const Text('Sign In'),
                    ),
                    SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height * 0.316901408450704,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I don’t have an account?',
                          style: theme.bodySmall,
                        ),
                        GestureDetector(
                          onTap: onNavigate,
                          child: Text(
                            ' Sign Up Now',
                            style: theme.bodySmall?.copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPressed() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
  }

  void onNavigate() {
    Navigator.pushNamed(context, AppRouteNames.register);
  }

  void onObsecure() {
    setState(() {
      obsecure = !obsecure;
    });
  }
}
