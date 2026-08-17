import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';

class XpGuide extends StatelessWidget {
  const XpGuide({super.key});

  final List<Map<String, dynamic>> _items = const [
    {
      'title': 'Get a "like" on a post',
      'desc': 'Receive points when your post get a like from other members.',
      'xp': 3,
    },
    {
      'title': 'Get a new comment',
      'desc': 'Receive points when your post get a comment.',
      'xp': 5,
    },
    {
      'title': 'Follow a member',
      'desc': 'Get points when you first follow a member from this community.',
      'xp': 10,
    },
    {
      'title': 'Submit a course rating',
      'desc': 'Earn points by rating your completed course.',
      'xp': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: isDarkMode(context)?AppGradients.darkBackground: AppGradients.lightBackground),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // ── Header ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── List ──
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: List.generate(_items.length, (i) {
                      final item = _items[i];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: text14Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item['desc'],
                                        style: text12Regular.copyWith(color:isDarkMode(context)?AppGrey.dark400: AppGrey.light400),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '${item['xp']} XP',
                                  style: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400),
                                ),
                              ],
                            ),
                          ),
                          if (i < _items.length - 1)
                            Divider(color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200, thickness: 1, height: 0),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}