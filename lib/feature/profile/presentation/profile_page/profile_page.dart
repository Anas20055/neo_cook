import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/common_widgets/grid_view.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:cook_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:cook_app/feature/profile/presentation/profile_page/widgets/custom_alert_diolog.dart';
import 'package:cook_app/feature/profile/presentation/profile_page/widgets/manage_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 2,
      vsync: this,
    );
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text('Profile'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: onExitPressed,
              icon: SvgPicture.asset(AppSvg.logout),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.white,
                            backgroundImage: CachedNetworkImageProvider(
                              state.profile?.imagePath ??
                                  'https://static.vecteezy.com/system/resources/thumbnails/020/911/740/small/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png',
                            ),
                          ),
                          const SizedBox(width: 28),
                          authorInfo(
                              tilte: "${state.profile?.recipesCount ?? 0}",
                              subTitle: 'Recipe'),
                          const SizedBox(width: 16),
                          authorInfo(
                              tilte: "${state.profile?.followersCount ?? 0}",
                              subTitle: 'Followers'),
                          const SizedBox(width: 16),
                          authorInfo(
                              tilte: "${state.profile?.followingsCount ?? 0}",
                              subTitle: 'Following'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.profile?.name ?? '',
                        style: theme.headlineMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.profile?.bio ?? '______',
                        style:
                            theme.bodyMedium?.copyWith(color: AppColors.grey),
                      ),
                      const SizedBox(height: 10),
                      ManageButton(
                        color: AppColors.beige,
                        textColor: AppColors.orange,
                        onPressed: onPressed,
                        child: const Text('Manage Profile'),
                      ),
                      tabBar(tabController),
                    ],
                  ),
                ),
                SizedBox(
                  height: tabBarViewHeight(state),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      MyGrid(
                        recipes: state.profileRecipe ?? [],
                      ),
                      MyGrid(
                        recipes: state.profileSaved ?? [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
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

  double tabBarViewHeight(ProfileState state) {
    num num1 = state.profileRecipe?.length ?? [].length;
    num num2 = state.profileSaved?.length ?? [].length;

    double height = 0;

    if (num1 >= num2) {
      height = num1.toDouble();
    } else {
      height = num2.toDouble();
    }

    if (height % 2 == 0) {
      return (height / 2) * 223;
    }
    return (height ~/ 2 + 1) * 223;
  }

  Widget tabBar(
    TabController tabController,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: TabBar(
        tabAlignment: TabAlignment.center,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.only(right: 180),
        controller: tabController,
        isScrollable: false,
        indicator: const BoxDecoration(),
        tabs: const [
          Tab(text: 'My recipe'),
          Tab(text: 'Saved recipe'),
        ],
      ),
    );
  }

  onPressed() {
    Navigator.pushNamed(context, AppRouteNames.manageProfilePage,
        arguments: context.read<ProfileCubit>().state.profile?.id ?? 1);
  }

  onExitPressed() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDiolg(
            onPressed: () {
              context.read<ProfileCubit>().leave();
              Navigator.pushReplacementNamed(context, AppRouteNames.login);
            },
            onPressedNo: () {
              Navigator.pop(context);
            },
          );
        });
  }
}
