import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/leaderboard/guide.dart';
import 'package:blow_talks/pages/home/leaderboard/rewards.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => LeaderboardPage();
}

class LeaderboardPage extends State<Leaderboard> {
  String _selectedFilter = '7 days';

  final List<Map<String, dynamic>> _leaders = [
    {'name': 'Jason Maze',        'avatar': 'asset/classroom/enroll/brian.png',    'xp': 550},
    {'name': 'Ethan Blake',       'avatar': 'asset/classroom/enroll/david.png',    'xp': 431},
    {'name': 'Oliver Smith',      'avatar': 'asset/classroom/enroll/emily.png',    'xp': 408},
    {'name': 'Noah Johnson',      'avatar': null,                                   'xp': 329},
    {'name': 'Lucas Brown',       'avatar': 'asset/classroom/enroll/frank.png',    'xp': 223},
    {'name': 'Mason Davis',       'avatar': 'asset/classroom/enroll/henry.png',    'xp': 214},
    {'name': 'Logan Wilson',      'avatar': 'asset/discussion/zara.png',      'xp': 208},
    {'name': 'James Taylor',      'avatar': null,                                   'xp': 105},
    {'name': 'Alexander Martinez','avatar': 'asset/chat/noah.png', 'xp': 39},
    {'name': 'Benjamin Anderson', 'avatar': 'asset/chat/liam.png',    'xp': 20},
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
              // ── Header ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    Expanded(
                      child: Center(
                        child: Text('Leaderboard', style: text16Bold.copyWith(color:  isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),
                      ),
                    ),
                    InkWell(

                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const XpGuide()),
                        );

                      },

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
                        child: Center(
                          child: Icon(Icons.help_outline, color: AppGrey.lightMain, size: 22),
                        ),
                      ),

                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // ── XP Progress Card ──
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Arc progress indicator
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator(
                                      value: 0.72,
                                      strokeWidth: 8,
                                      backgroundColor: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                                      valueColor: AlwaysStoppedAnimation<Color>(brandColor),
                                      strokeCap: StrokeCap.round,
                                    ),
                                  ),
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: brandColor.withValues(alpha: 0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.diamond, color: brandColor, size: 28),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Expert', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                                      const SizedBox(width: 8),
                                      Text('LEVEL 5', style: text10Medium.copyWith(color:isDarkMode(context)?AppGrey.light400: AppGrey.light400)),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  RichText(
                                    text: TextSpan(
                                      style: text12Regular.copyWith(color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500),
                                      children: [
                                        const TextSpan(text: 'Earn more '),
                                        TextSpan(
                                          text: '25 XP',
                                          style: text12Bold.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),
                                        ),
                                        const TextSpan(text: ' to up-level & unlock enticing rewards!'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  OutlinedButton(
                                    onPressed: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (_) => const ViewRewards()),
                                      );

                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: isDarkMode(context)? AppGrey.dark300:AppGrey.light300),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                      minimumSize: Size.zero,
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text('View Rewards', style: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Filter Chips ──
                      Row(
                        children: ['7 days', '30 days', 'All-time'].map((filter) {
                          final isSelected = _selectedFilter == filter;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedFilter = filter),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  color: isSelected ? isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  filter,
                                  style: text12Medium.copyWith(
                                    color: isSelected ? isDarkMode(context)? AppGrey.dark400 : AppGrey.light400: isDarkMode(context)? AppGrey.dark400 : AppGrey.light400
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 16),

                      // ── Leaderboard List ──
                      ..._leaders.asMap().entries.map((entry) {
                        final index = entry.key;
                        final user = entry.value;
                        return _leaderTile(index + 1, user['name'], user['avatar'], user['xp']);
                      }),

                      const SizedBox(height: 20),
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

  Widget _leaderTile(int rank, String name, String? avatar, int xp) {
    Color rankColor;
    if (rank == 1) {
      rankColor = const Color(0xFFFFD700);       // gold
    } else if (rank == 2) {rankColor = const Color(0xFFC0C0C0);}  // silver
    else if (rank == 3) {rankColor = const Color(0xFFCD7F32);}  // bronze
    else {rankColor = AppGrey.light400;}

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Rank
          SizedBox(
            width: 28,
            child: Text(
              '$rank',
              style: rank <= 3
                  ? text14Bold.copyWith(color: rankColor)
                  : text14Regular.copyWith(color:  isDarkMode(context)?AppGrey.dark400: AppGrey.light400),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 12),

          // Avatar
          avatar != null
              ? CircleAvatar(radius: 24, backgroundImage: AssetImage(avatar))
              : CircleAvatar(
            radius: 24,
            backgroundColor: brandColor.shade100,
            child: Icon(Icons.person, color: brandColor, size: 24),
          ),
          const SizedBox(width: 12),

          // Name
          Expanded(
            child: Text(name, style: text14Medium.copyWith(color:  isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
          ),

          // XP
          Text(
            '+ $xp XP',
            style: text12Medium.copyWith(color:  isDarkMode(context)?AppGrey.dark400:AppGrey.light400),
          ),
        ],
      ),
    );
  }
}