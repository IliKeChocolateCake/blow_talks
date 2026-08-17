import 'dart:io';
import 'dart:ui';
import 'package:blow_talks/pages/setting/cancel_membership.dart';
import 'package:blow_talks/pages/setting/notification_setting.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class CommunitySetting extends StatefulWidget{

  const CommunitySetting ({super.key});

  @override
  State<CommunitySetting> createState()=> CommunitySettingPage();


}



class CommunitySettingPage extends State<CommunitySetting> {
  bool showOnlyJoined = false;
  bool enableFollow = true;
  bool enableMessaging = false;
  bool contributionVisibility = true;
  bool joinedCommunities = false;

  Future<void> _share() async {
    // Copy asset to temp file
    final byteData = await rootBundle.load('asset/profile/profile.jpg');
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/preview.jpg');
    await file.writeAsBytes(byteData.buffer.asUint8List());

    SharePlus.instance.share(
      ShareParams(
        previewThumbnail: XFile('asset/profile/profile.jpg'), // real file path ✅
        text: 'Join AI Hub by Gordon!',
        subject: 'Join this community today!',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(

            gradient: AppGradients.lightBackground

        ),
        child: Stack(
          children: [
            // ── Main scrollable content ──
            SingleChildScrollView(
              child: Column(
                children: [
                  // ── Banner + Avatar ──
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'asset/profile/profile.jpg',
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: -36,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const CircleAvatar(
                            radius: 36,
                            backgroundImage: AssetImage('asset/profile/kuma.png'),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 44),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text('AI Hub by Jane', style: text20Bold),
                        const SizedBox(height: 6),
                        Text(
                          'Welcome to AI Hub! This is a space for AI enthusiasts to connect, share ideas, and explore the latest advancements i...',
                          style: text12Regular.copyWith(color: AppGrey.light500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _chip('● 25 online'),
                            const SizedBox(width: 8),
                            _chip('108 members'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _actionButton(
                              icon: Icons.open_in_new,
                              color: Colors.white,
                              onTap: () => _share(), backgroundColor: brandColor,
                            ),
                            const SizedBox(width: 12),
                            _actionButton(
                              icon: Icons.notifications_off_outlined,
                              color: AppGrey.lightMain,
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => const NotificationSetting()),
                                );
                              }, backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),


                    child: Container(

                      width: double.infinity,

                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),


                      ),

                      child: Column(

                        children: [

                          _toggleTile(
                            title: 'Show Only Joined Channels',
                            subtitle: 'Only joined channels will appear in the channel list.',
                            value: showOnlyJoined,
                            onChanged: (v) => setState(() => showOnlyJoined = v),
                          ),

                        ],
                      ),
                    ),

                  ),

                  SizedBox(height: 12,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),


                    child: Container(

                      width: double.infinity,

                      decoration: BoxDecoration(

                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),


                      ),

                      child: Column(

                        children: [

                          _toggleTile(
                            title: 'Enable Follow',
                            subtitle: 'Allow community members to follow your profile.',
                            value: enableFollow,
                            onChanged: (v) => setState(() => enableFollow = v),
                          ),
                          Divider(
                            color: AppGrey.light200,
                            thickness: 1,
                          ),

                          _toggleTile(
                            title: 'Enable Messaging',
                            subtitle: 'Allow community members message you directly.',
                            value: enableMessaging,
                            onChanged: (v) => setState(() => enableMessaging = v),
                          ),
                          Divider(
                            color: AppGrey.light200,
                            thickness: 1,
                          ),

                          _toggleTile(
                            title: 'Contribution Visibility',
                            subtitle: 'Make your contributions visible to all members.',
                            value: contributionVisibility,
                            onChanged: (v) => setState(() => contributionVisibility = v),
                          ),
                          Divider(
                            color: AppGrey.light200,
                            thickness: 1,
                          ),

                          _toggleTile(
                            title: 'Joined Communities',
                            subtitle: 'Show members the communities you\'ve joined.',
                            value: joinedCommunities,
                            onChanged: (v) => setState(() => joinedCommunities = v),
                          ),

                        ],
                      ),
                    ),

                  ),




                  const SizedBox(height: 12),


                  Padding(padding: EdgeInsets.symmetric(horizontal: 20),

                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            barrierColor: Colors.black.withValues(alpha: 0.5),
                            backgroundColor: Colors.transparent,
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.95, // 90% height
                              child: const CancelMembership(),
                            ),
                          );

                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                        child: Text(
                          'Cancel Membership',
                          style: text14Regular.copyWith(color: AppAlert.lightError500),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),

            // ── Drag handle pinned on top of everything ──
            Positioned(
              top: 12,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8), // white so visible over banner
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppGrey.light400),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: text12Regular.copyWith(color: AppGrey.light500),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required Color backgroundColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: backgroundColor, // pass withOpacity(0.2) when calling
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _toggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: text12Regular.copyWith(color: AppGrey.light500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,

            // ── Thumb ──

            inactiveThumbColor: Colors.white,

            // ── Track ──
            activeTrackColor: const Color(0xff0AAB83),
            inactiveTrackColor: AppFixed.lightGrey,

            // ── Track border ──
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return brandColor; // no border when active
              }
              return AppFixed.lightGrey; // border color when inactive
            }),




          ),
        ],
      ),
    );
  }
}