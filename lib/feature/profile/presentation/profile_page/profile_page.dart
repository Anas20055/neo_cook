import 'package:cook_app/core/routes/routes.dart';
import 'package:cook_app/feature/auth/data/data_source/local/shared_preff.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRouteNames.login);
              SessionDataProvider().setSessionId(null);
            },
            icon: const Icon(Icons.exit_to_app))
      ],
    );
  }
}
