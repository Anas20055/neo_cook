import 'package:cook_app/core/common_widgets/grid_view.dart';
import 'package:cook_app/core/common_widgets/tittle_widget.dart';
import 'package:cook_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cook_app/feature/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<MainCubit>().getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 3,
      vsync: this,
    );
    final theme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AppTitle(
            padding: const EdgeInsets.fromLTRB(20, 57, 0, 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, ',
                      style: theme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Text(
                          state.token?.userName ?? '',
                          style: theme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  'UI Designer & Cook',
                  style: theme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Category',
              style: theme.labelMedium,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: tabBar(tabController),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              if (state is MainLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                height: tabBarViewHeight(state),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    MyGrid(recipes: state.breakfast ?? []),
                    MyGrid(recipes: state.lunch ?? []),
                    MyGrid(recipes: state.dinner ?? []),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  double tabBarViewHeight(MainState state) {
    num num1 = state.breakfast?.length ?? 0;
    num num2 = state.dinner?.length ?? 0;
    num num3 = state.lunch?.length ?? 0;

    double height = 0;

    if (num1 >= num2 && num1 >= num3) {
      height = num1.toDouble();
    } else if (num2 >= num1 && num2 >= num3) {
      height = num2.toDouble();
    } else {
      height = num3.toDouble();
    }

    if (height % 2 == 0) {
      return (height / 2) * 223;
    }
    return (height ~/ 2 + 1) * 223;
  }

  TabBar tabBar(
    TabController tabController,
  ) {
    return TabBar(
      padding: const EdgeInsets.only(left: 20),
      controller: tabController,
      isScrollable: true,
      tabs: const [
        Tab(text: 'Breakfast'),
        Tab(text: '    Lunch  '),
        Tab(text: '   Dinner  '),
      ],
    );
  }
}
