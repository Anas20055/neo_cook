import 'package:cook_app/core/common_widgets/snack_bar.dart';
import 'package:cook_app/core/common_widgets/text_field.dart';
import 'package:cook_app/core/common_widgets/tittle_widget.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/utils/validate_mixin.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final headlineMedium =
        theme.headlineMedium?.copyWith(color: AppColors.orange);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: authListener,
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 36),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gmail',
                              style: headlineMedium,
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              hintText: 'Enter your Gmail',
                              validator: validateEmail,
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
                              style: headlineMedium,
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              validator: validatePassword,
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
                              height: MediaQuery.sizeOf(context).height *
                                  0.316901408450704,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'I don’t have an account?',
                                  style: theme.bodyMedium,
                                ),
                                GestureDetector(
                                  onTap: onNavigate,
                                  child: Text(
                                    ' Sign Up Now',
                                    style: theme.bodyMedium?.copyWith(
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
              if (state is AuthWaiting)
                Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void authListener(context, state) {
    if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.customSnackBar(
        text: state.error!,
      ));
    } else if (state is Authorized) {
      Navigator.pushReplacementNamed(context, AppRouteNames.homePage);
    }
  }

  void onPressed() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    context.read<AuthCubit>().login(
          LoginRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
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
