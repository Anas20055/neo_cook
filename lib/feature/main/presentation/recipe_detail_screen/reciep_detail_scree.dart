// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/feature/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/core/routes/routes.dart';

class ReciepDetailScreen extends StatefulWidget {
  final int id;
  const ReciepDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ReciepDetailScreen> createState() => _ReciepDetailScreenState();
}

class _ReciepDetailScreenState extends State<ReciepDetailScreen> {
  @override
  void initState() {
    context.read<MainCubit>().getDetailRecipe(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if (state is MainLoadingDetail) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height +
                        48 *
                            ((state.detailRecipe?.ingredients.length ?? 0) - 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 249,
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: state.detailRecipe?.imagePath ??
                                  'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: IconButton(
                      onPressed: onBack,
                      icon: const Icon(
                        size: 14,
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 233,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text(
                              state.detailRecipe?.name ?? '',
                              style: theme.bodyLarge,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset(AppSvg.clock),
                              const SizedBox(width: 8),
                              Text(
                                state.detailRecipe?.preparationTime ?? '',
                                style: theme.labelSmall?.copyWith(
                                  color: AppColors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 2,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.beige,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Text(
                              state.detailRecipe?.difficulty ?? '',
                              style: theme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: onAuthorPressed,
                            child: Text(
                              'by ${state.detailRecipe?.author ?? ''}',
                              style: theme.bodyMedium?.copyWith(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: onLike,
                                    child: state.detailRecipe?.liked ?? false
                                        ? SvgPicture.asset(
                                            AppSvg.heartButtonField)
                                        : SvgPicture.asset(AppSvg.heartButton),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      '${state.detailRecipe?.likes ?? 0} likes',
                                      style: theme.bodyMedium),
                                ],
                              ),
                              GestureDetector(
                                onTap: onSave,
                                child: state.detailRecipe?.saved ?? false
                                    ? SvgPicture.asset(AppSvg.saveButtonField)
                                    : SvgPicture.asset(AppSvg.saveButton),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Description',
                            style: theme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.detailRecipe?.description ?? '',
                            style: theme.labelSmall,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Ingredients',
                            style: theme.headlineMedium,
                          ),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 8),
                            shrinkWrap: true,
                            itemCount:
                                state.detailRecipe?.ingredients.length ?? 0,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 1,
                                color: AppColors.backGrey,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.detailRecipe?.ingredients[index]
                                              .key ??
                                          '',
                                      style: theme.labelSmall,
                                    ),
                                    Text(
                                      state.detailRecipe?.ingredients[index]
                                              .value ??
                                          '',
                                      style: theme.labelSmall?.copyWith(
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onBack() {
    Navigator.pop(context);
  }

  void onAuthorPressed() {
    Navigator.pushNamed(context, AppRouteNames.authorPage);
  }

  void onLike() {
    context.read<MainCubit>().likeRecipe(id: widget.id);
  }

  void onSave() {
    context.read<MainCubit>().saveRecipe(id: widget.id);
  }
}
