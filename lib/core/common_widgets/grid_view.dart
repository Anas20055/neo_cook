// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyGrid extends StatelessWidget {
  const MyGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14.0,
          crossAxisSpacing: 14.0,
          mainAxisExtent: 209,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onTab(context),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      'https://s3-alpha-sig.figma.com/img/f2b2/a0f4/bca297ef579e6efc869bdd2d06414c28?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OKWBY77Ua2aT7xznTbTPTtSdVR4I0-ZXXK6wrCkO4DzAibm9fiWFhDYkA0-YiAcxEFAivW55Ts2cLyQ5-71tXTWbT9w4RxjFyuxXc8FYqrKYw6407505baVqsmlFY5KCIJ7tnKw8N3J4CP~xebCkt8rq7Ui0qrDgXyhrmEH2GB1ZGP~uikuHH9m6ewdXMCoY6pLqe64kFyYcju6ShgSW1lUF4w05bmizAKG7Xv7AnPeoFj2kkdd~7dTC7GR3E7~Cls-m--UQauajfhWO4h3fHjtNz-plVY8nirvKDL~K6KtfhjAH0x07bCcwRI90LVmr7YJXg8LhhDY5fzyz1xLVNw__'),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Egg Omlet',
                      style:
                          theme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'by Ainsley Harriott',
                      style: theme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(AppSvg.heart),
                        const SizedBox(width: 4),
                        Text(
                          '118',
                          style: theme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(AppSvg.save),
                        const SizedBox(width: 4),
                        Text(
                          '118',
                          style: theme.bodyMedium?.copyWith(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _onTab(context) {
    Navigator.pushNamed(context, AppRouteNames.detailScreen);
  }
}
