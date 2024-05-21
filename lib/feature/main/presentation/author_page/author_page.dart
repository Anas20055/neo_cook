import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/common_widgets/grid_view.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/feature/main/presentation/author_page/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://s3-alpha-sig.figma.com/img/6082/abd3/e767d5e1bfcfcf1b5f391d15bdbbc208?Expires=1717372800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DZFc72a90Yi6kVB3DPzOhcX76rcHC3TLbIu8rXlSSR0L4zuDaTV~Bn7lf389WbGK2MHBas~874ifaOoo3O2AMQFC1MyzoZyEzG~uv0PvVosVgbq6wczEv4GP9Ou2VtZVhkoVhyXpSC4TpQs3-6NeRvt6YZgXZoTpxYlphEbIcPdOYVKbU-69jwsdYsmWz0YLllIb3VofBMg17EiBaTbi~2TDaTo3dkpoNIHlxTuKQIC-63MukAd8T39kjk9Q-N2e9o9x38vKQFQv5xEOVvf0VvNw4jO5ytT1v1qs-tsgTcUY152n1Yk3oub27DxSqmybwqGML3-Q00AM~EkKAyE5xA__'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Ainsley Harriott',
                style: theme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  authorInfo(
                    tilte: '29',
                    subTitle: 'Recipe',
                  ),
                  const SizedBox(width: 17),
                  authorInfo(
                    tilte: '$followers',
                    subTitle: 'Followers',
                  ),
                  const SizedBox(width: 17),
                  authorInfo(
                    tilte: '100',
                    subTitle: 'Following',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  'Ainsley Denzil Dubriel Harriott MBE is an English chef and television presenter. He is known for his BBC cookinп',
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
