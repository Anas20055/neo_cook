// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:cook_app/feature/main/domain/entity/recipe_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyGrid extends StatelessWidget {
  final List<RecipeEntity> recipes;
  const MyGrid({
    super.key,
    required this.recipes,
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
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onTab(context, index),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    recipes[index].imagePath,
                  ),
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
                      recipes[index].name,
                      style: theme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'by ${recipes[index].author}',
                      style: theme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(AppSvg.heart),
                        const SizedBox(width: 4),
                        Text(
                          '${recipes[index].likes}',
                          style: theme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(AppSvg.save),
                        const SizedBox(width: 4),
                        Text(
                          '${recipes[index].saves}',
                          style: theme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
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

  void _onTab(context, int index) {
    Navigator.pushNamed(
      context,
      AppRouteNames.detailScreen,
      arguments: recipes[index].id,
    );
  }
}
