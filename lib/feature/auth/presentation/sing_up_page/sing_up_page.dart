import 'package:cook_app/core/common_widgets/snack_bar.dart';
import 'package:cook_app/core/common_widgets/text_field.dart';
import 'package:cook_app/core/common_widgets/tittle_widget.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/utils/validate_mixin.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> with CustomTextFieldValidator {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final rePasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool obsecure = true;
  bool obsecure2 = true;
  bool isPasswordSame = true;

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
                      padding: const EdgeInsets.fromLTRB(20, 89, 0, 68),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign up for delicious',
                            style: theme.headlineLarge,
                          ),
                          Text(
                            'Discoveries!',
                            style: theme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                              'Name',
                              style: headlineMedium,
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              validator: validateNotEmpty,
                              hintText: 'Enter your Name',
                              controller: nameController,
                              suffixIcon: const Icon(
                                Icons.person_2_outlined,
                                size: 18,
                                color: AppColors.iconGrey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Gmail',
                              style: headlineMedium,
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              validator: validateEmail,
                              hintText: 'Enter your Gmail',
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
                            const SizedBox(height: 16),
                            Text(
                              'Re-Password',
                              style: headlineMedium,
                            ),
                            const SizedBox(height: 5),
                            MyTextField(
                              hintText: 'Enter your Re-Password',
                              validator: validateNotEmpty,
                              controller: rePasswordController,
                              obscure: obsecure2,
                              suffixIcon: IconButton(
                                onPressed: onObsecure2,
                                icon: Icon(
                                  obsecure
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 18,
                                  color: AppColors.iconGrey,
                                ),
                              ),
                            ),
                            showPasswordNotSame(),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: onPressed,
                              child: const Text('Sign Up'),
                            ),
                            const SizedBox(height: 108),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: theme.bodyMedium,
                                ),
                                GestureDetector(
                                  onTap: onNavigate,
                                  child: Text(
                                    ' Sign In Now',
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
    } else if (state is AuthSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.customSnackBar(
            text: state.success ?? 'hello', color: Colors.green),
      );
      Navigator.pop(context);
    }
  }

  bool checkPasswordSame() {
    if (passwordController.text == rePasswordController.text) {
      isPasswordSame = true;
    } else {
      isPasswordSame = false;
    }
    setState(() {});
    return isPasswordSame;
  }

  Widget showPasswordNotSame() {
    if (isPasswordSame) {
      return const SizedBox();
    } else {
      return const Padding(
        padding: EdgeInsets.only(left: 19, top: 8),
        child: Row(
          children: [
            Text(
              'Password is not the same',
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }
  }

  void onPressed() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    if (!checkPasswordSame()) {
      return;
    }
    context.read<AuthCubit>().register(RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
        ));
  }

  void onNavigate() {
    Navigator.pop(context);
  }

  void onObsecure() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  void onObsecure2() {
    setState(() {
      obsecure2 = !obsecure2;
    });
  }
}
