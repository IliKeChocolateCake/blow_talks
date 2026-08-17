import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class NotificationPush extends StatefulWidget{
  
  const NotificationPush ({super.key});
  
  
  @override
  State<NotificationPush> createState() => NotificationPushPage();
}

class NotificationPushPage extends State<NotificationPush>{
  bool pushNotification = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: isDarkMode(context)? AppGradients.darkBackground: AppGradients.lightBackground,
          ),

        child: Column(

          children: [
            Padding(

              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileSetting()),
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode(context)?AppGrey.dark50: AppGrey.light50,
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: Text('Notification', style: text16Bold.copyWith(color: isDarkMode(context) ? AppGrey.darkMain: AppGrey.lightMain)),
                    ),
                  ),

                  InkWell(
                    onTap: () {



                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.transparent, size: 24),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),

              child: _toggleTile2(title: 'Push Notification', subtitle: 'Get real-time updates and important reminders delivered straight to your device.',value: pushNotification,
                onChanged: (v) => setState(() => pushNotification= v),),

            ),


          ],
        ),


      ),

      ),

    );
  }

  Widget _toggleTile2({
    required String title,

    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Medium.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain), maxLines: 1, overflow:TextOverflow.ellipsis,),

                Text(subtitle, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500: AppGrey.light500),),
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
            activeTrackColor: brandColor,
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