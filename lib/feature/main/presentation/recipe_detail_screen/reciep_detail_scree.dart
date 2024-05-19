import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReciepDetailScreen extends StatefulWidget {
  const ReciepDetailScreen({super.key});

  @override
  State<ReciepDetailScreen> createState() => _ReciepDetailScreenState();
}

class _ReciepDetailScreenState extends State<ReciepDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
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
                    color: Colors.white),
                child: Column(
                  children: [
                    Text('Ainsley’s Jerk Chicken'),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
