import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/leaderboard/guide.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';

class ViewRewards extends StatelessWidget {
  const ViewRewards({super.key});

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
                    const Spacer(),

                    InkWell(

                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const XpGuide()),
                        );

                      },

                      child:    Container(
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
                        child: Center(
                          child: Icon(Icons.help_outline, color: AppGrey.lightMain, size: 22),
                        ),
                      ),

                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Scrollable Level List ──
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _levelSection(
                        context: context,
                        level: 3,
                        title: 'Achiever',
                        xp: 50,
                        iconColor: const Color(0xFFFF9800),
                        isCurrent: false,
                        unlocks: [
                          _unlockItem('asset/leaderboard/book.png', 'Data Science Intermediate',context),
                          _unlockItem('asset/leaderboard/book.png', 'Data Science Advanced',context),
                        ],
                      ),
                      _levelSection(
                        context: context,
                        level: 4,
                        title: 'Challenger',
                        xp: 150,
                        iconColor: const Color(0xFFE91E8C),
                        isCurrent: false,
                        unlocks: [
                          _unlockItem('asset/leaderboard/book.png', 'Introduction to AI',context),
                        ],
                      ),
                      _levelSection(
                        context: context,
                        level: 5,
                        title: 'Expert',
                        xp: 400,
                        iconColor: brandColor,
                        isCurrent: true,
                        unlocks: [],
                      ),
                      _levelSection(
                        context: context,
                        level: 6,
                        title: 'Master',
                        xp: 800,
                        iconColor: const Color(0xFFE91E8C),
                        isCurrent: false,
                        unlocks: [
                          _unlockItem('asset/leaderboard/hashtag.png', '7-Day AI Trading Challenge',context),
                        ],
                      ),
                      _levelSection(
                        context: context,
                        level: 7,
                        title: 'Grandmaster',
                        xp: 1600,
                        iconColor: const Color(0xFFFFD700),
                        isCurrent: false,
                        unlocks: [],
                      ),
                      _levelSection(
                        context: context,
                        level: 8,
                        title: 'Legend',
                        xp: 3200,
                        iconColor: const Color(0xFF9C27B0),
                        isCurrent: false,
                        unlocks: [
                          _unlockItem('asset/leaderboard/hashtag.png', 'AI Agent Group',context),
                          _unlockItem('asset/leaderboard/book.png', 'Introduction to Algorithms',context),
                        ],
                      ),
                      const SizedBox(height: 24),
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

  Widget _levelSection({
    required int level,
    required String title,
    required int xp,
    required Color iconColor,
    required bool isCurrent,
    required List<Widget> unlocks,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Level row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.diamond, color: iconColor, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LEVEL $level', style: text10Medium.copyWith(color: isDarkMode(context)?AppGrey.dark400: AppGrey.light400)),
                    Row(
                      children: [
                        Text(title, style: text14Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                        if (isCurrent) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: brandColor),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text('CURRENT', style: text10Medium.copyWith(color: brandColor)),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '${_formatXP(xp)} XP',
                style: text12Medium.copyWith(color: isDarkMode(context)? AppGrey.dark400:AppGrey.light400),
              ),
            ],
          ),

          // Unlocks
          if (unlocks.isNotEmpty) ...[
            const SizedBox(height: 8),
            ...unlocks.map((w) => Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 8),
              child: w,
            )),
          ],

          const SizedBox(height: 8),
          Divider(color:isDarkMode(context)?AppGrey.dark200: AppGrey.light200, thickness: 1),
        ],
      ),
    );
  }

  Widget _unlockItem(String image, String label, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDarkMode(context)?AppGrey.dark100:AppGrey.light100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500)),
        ),
      ],
    );
  }

  String _formatXP(int xp) {
    if (xp >= 1000) return '${(xp / 1000).toStringAsFixed(xp % 1000 == 0 ? 0 : 1)},${(xp % 1000).toString().padLeft(3, '0')}';
    return '$xp';
  }
}