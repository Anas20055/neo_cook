import 'package:cached_network_image/cached_network_image.dart';
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ReciepDetailScreen extends StatefulWidget {
  const ReciepDetailScreen({super.key});

  @override
  State<ReciepDetailScreen> createState() => _ReciepDetailScreenState();
}

class _ReciepDetailScreenState extends State<ReciepDetailScreen> {
  bool like = false;
  bool save = false;
  int likes = 12;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height + 48 * 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 249,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://s3-alpha-sig.figma.com/img/f2b2/a0f4/bca297ef579e6efc869bdd2d06414c28?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OKWBY77Ua2aT7xznTbTPTtSdVR4I0-ZXXK6wrCkO4DzAibm9fiWFhDYkA0-YiAcxEFAivW55Ts2cLyQ5-71tXTWbT9w4RxjFyuxXc8FYqrKYw6407505baVqsmlFY5KCIJ7tnKw8N3J4CP~xebCkt8rq7Ui0qrDgXyhrmEH2GB1ZGP~uikuHH9m6ewdXMCoY6pLqe64kFyYcju6ShgSW1lUF4w05bmizAKG7Xv7AnPeoFj2kkdd~7dTC7GR3E7~Cls-m--UQauajfhWO4h3fHjtNz-plVY8nirvKDL~K6KtfhjAH0x07bCcwRI90LVmr7YJXg8LhhDY5fzyz1xLVNw__'),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 8,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                      const Padding(
                        padding: EdgeInsets.only(right: 150),
                        child: Text(
                          'Ainsley’s Jerk Chicken',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SvgPicture.asset(AppSvg.clock),
                          const SizedBox(width: 8),
                          const Text(
                            '20-30 min',
                            style: TextStyle(
                              color: AppColors.orange,
                              fontSize: 14,
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
                        child: const Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouteNames.authorPage);
                        },
                        child: const Text(
                          'by Ainsley Harriott',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
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
                                child: like
                                    ? SvgPicture.asset(AppSvg.heartButtonField)
                                    : SvgPicture.asset(AppSvg.heartButton),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '$likes likes',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: onSave,
                            child: save
                                ? SvgPicture.asset(AppSvg.saveButtonField)
                                : SvgPicture.asset(AppSvg.saveButton),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'You pick up your palette knife and then work that into. Give your meat a good old rub. That’s it, nice and hot, hot and spicy meat. He-he boy...',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 8),
                        shrinkWrap: true,
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 1,
                            color: AppColors.backGrey,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chicken',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '1 kg',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
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
          ),
        ),
      ),
    );
  }

  void onLike() {
    setState(() {
      like = !like;
      if (!like) {
        likes--;
      } else {
        likes++;
      }
    });
  }

  void onSave() {
    setState(() {
      save = !save;
    });
  }
}
