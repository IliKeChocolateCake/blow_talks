import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/channel_detail_bottomsheet.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_channel/create_channel.dart';
import 'package:flutter/material.dart';

class ManageChannel extends StatefulWidget {
  const ManageChannel({super.key});

  @override
  State<ManageChannel> createState() => ManageChannelPage();
}

class ManageChannelPage extends State<ManageChannel> {
  final List<Map<String, dynamic>> _sections = [
    {
      'title': 'General',
      'channels': [
        {'name': 'General Discussion', 'isPrivate': false},
        {'name': 'Collaborative AI Learning', 'isPrivate': false},
        {'name': 'Private Group Discussion', 'isPrivate': true},
      ],
    },
    {
      'title': 'AI Wellness 🧘',
      'channels': [
        {'name': 'Embrace AI', 'isPrivate': false},
        {'name': 'AI in Self-Help Literature', 'isPrivate': false},
        {'name': '30-Day AI Wellness Challenge', 'isPrivate': true},
      ],
    },
    {
      'title': 'AI in Trading 📈',
      'channels': [
        {'name': 'Algorithmic Trading', 'isPrivate': false},
        {'name': 'AI Stock Analysis', 'isPrivate': false},
        {'name': '7-Day AI Trading Challenge', 'isPrivate': true},
      ],
    },
    {
      'title': 'AI in Finance 💰',
      'channels': [
        {'name': 'AI Wealth Strategies', 'isPrivate': false},
        {'name': 'AI and Financial Literature', 'isPrivate': false},
        {'name': '30-Day AI Wealth Challenge', 'isPrivate': true},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light50,
      body: SafeArea(
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
                      child: Text('Manage Channels', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CreateChannel()),
                      );

                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: brandColor,
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
                        child: Icon(Icons.add, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            // ── Channel List ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _sections.asMap().entries.map((sectionEntry) {
                    final sectionIndex = sectionEntry.key;
                    final section = sectionEntry.value;
                    final channels = section['channels'] as List<Map<String, dynamic>>;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          section['title'],
                          style: text12Medium.copyWith(color: AppGrey.light400),
                        ),
                        const SizedBox(height: 8),

                        // ✅ ReorderableListView per section
                        ReorderableListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) newIndex--;
                              final item = channels.removeAt(oldIndex);
                              channels.insert(newIndex, item);
                            });
                          },
                          children: channels.asMap().entries.map((e) {
                            final channel = e.value;
                            return _channelTile(
                              key: ValueKey('$sectionIndex-${channel['name']}'),
                              name: channel['name'],
                              isPrivate: channel['isPrivate'],
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _channelTile({
    required Key key,
    required String name,
    required bool isPrivate,
  }) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(

        onTap: (){

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            backgroundColor: Colors.transparent,
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.9,
              child: ChannelDetailBottomsheet(name: name),  // 👈 Pass label
            ),
          );

        },

        child: Row(
          children: [
            Icon(
              isPrivate ? Icons.lock_outlined : Icons.language_outlined,
              size: 20,
              color: AppGrey.light400,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: text14Regular.copyWith(color: AppGrey.lightMain),
              ),
            ),
            Icon(Icons.drag_indicator, size: 20, color: AppGrey.light300),
          ],
        ),

      ),
    );
  }
}