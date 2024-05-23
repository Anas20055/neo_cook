import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/common_widgets/grid_view.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/feature/main/presentation/author_page/widgets/custom_button.dart';
import 'package:cook_app/feature/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  bool pressed = false;
  int followers = 144;

  @override
  void initState() {
    context.read<MainCubit>().getAuthor(id: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainAuthorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: onBack,
                          icon: const Icon(
                            size: 14,
                            Icons.arrow_back_ios_new_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(state
                                .author?.imagePath ??
                            'https://static.vecteezy.com/system/resources/thumbnails/020/911/740/small/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.author?.name ?? '',
                    style: theme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      authorInfo(
                        tilte: '${state.author?.recipesCount ?? 0}',
                        subTitle: 'Recipe',
                      ),
                      const SizedBox(width: 17),
                      authorInfo(
                        tilte: '${state.author?.followersCount ?? 0}',
                        subTitle: 'Followers',
                      ),
                      const SizedBox(width: 17),
                      authorInfo(
                        tilte: '${state.author?.followingsCount ?? 0}',
                        subTitle: 'Following',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      textAlign: TextAlign.center,
                      state.author?.bio ?? '',
                      style: theme.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      pressed: pressed,
                      onPressed: onPressed,
                      child: pressed
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Followed',
                                  style: TextStyle(
                                    color: AppColors.orange,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(AppSvg.check),
                              ],
                            )
                          : const Text('Follow'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MyGrid(
                    recipes: [],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onPressed() {
    setState(() {
      pressed = !pressed;
      if (!pressed) {
        followers--;
      } else {
        followers++;
      }
    });
  }

  void onBack() {
    Navigator.pop(context);
  }

  Widget authorInfo({
    required String tilte,
    required String subTitle,
  }) {
    return Column(
      children: [
        Text(
          tilte,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
