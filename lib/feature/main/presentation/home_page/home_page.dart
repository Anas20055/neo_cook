import 'package:cook_app/core/common_widgets/grid_view.dart';
import 'package:cook_app/core/common_widgets/tittle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
                      style: theme.headlineSmall,
                    ),
                    Text(
                      'Sarthak',
                      style: theme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'UI Designer & Cook',
                  style: theme.headlineSmall,
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
          child: SizedBox(
            height: 223 * 5,
            child: TabBarView(
              controller: tabController,
              children: [
                MyGrid(),
                MyGrid(),
                MyGrid(),
              ],
            ),
          ),
        ),
      ],
    );
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
