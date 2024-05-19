import 'package:cook_app/app/presentation/common_widgets/grid_view.dart';
import 'package:cook_app/app/presentation/common_widgets/tittle_widget.dart';
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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: theme.labelMedium,
                  ),
                  tabBar(tabController),
                  const MyGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar tabBar(
    TabController tabController,
  ) {
    return TabBar(
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
