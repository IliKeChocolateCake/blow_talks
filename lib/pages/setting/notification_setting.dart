import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/setting/mute_duration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class NotificationSetting extends StatefulWidget{
  
  const NotificationSetting ({super.key});
  
  
  @override
  State<NotificationSetting> createState() => NotificationSettingPage();
  
  
}


class NotificationSettingPage extends State<NotificationSetting>{

  bool mute = false;
  bool activity = true;
  bool newCourse= true;
  bool newEvents = true;
  bool eventReminder= true;



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppGrey.light100,

      appBar: AppBar(
        title: Text('Notifications', style: text16Bold.copyWith(color: AppGrey.lightMain),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () { Navigator.pop(context); },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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

      ),

      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(height: 16,),
                    _toggleTile(title: 'Mute All Notification', subtitle: 'You won’t receive any notifications from this community.', value: mute, onChanged:  (v) => setState(() => mute = v)),
                    SizedBox(height: 16,),

                    if(mute)...[
                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),

                      SizedBox(height: 16,),

                      _titleLog('Mute For', '1 hour', onTap: () {


                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MuteDuration()),
                      );


                      }


                      ),

                      SizedBox(height: 16,),

                    ],




                  ],
                ),

              ),

              SizedBox(height: 16,),

              Text('Discussion', style: text12Regular.copyWith(color: AppGrey.light300),),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(height: 16,),
                    _toggleTile(title: 'Activity Alerts', subtitle: 'Get notified when someone likes your post, comments on it, or replies to your comments.', value: activity, onChanged:  (v) => setState(() => activity = v)),
                    SizedBox(height: 16,),

                  ],
                ),

              ),

              SizedBox(height: 16,),

              Text('Classroom', style: text12Regular.copyWith(color: AppGrey.light300),),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(height: 16,),
                    _toggleTile(title: 'New Course Alerts', subtitle: 'Get notified when a new course is published.', value: newCourse, onChanged:  (v) => setState(() => newCourse = v)),
                    SizedBox(height: 16,),

                  ],
                ),

              ),

              SizedBox(height: 16,),

              Text('Events', style: text12Regular.copyWith(color: AppGrey.light300),),
              SizedBox(height: 16,),


              Container(


                width: double.infinity,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),


                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    SizedBox(height: 16,),
                    _toggleTile(title: 'New Event Alerts', subtitle: 'Get notified when a new event is announced.', value: newEvents, onChanged:  (v) => setState(() => newEvents = v)),
                    SizedBox(height: 16,),


                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),

                    SizedBox(height: 16,),

                    _toggleTile(title: 'Event Reminders', subtitle: 'A reminder will be sent to you 10 minutes prior to the start of the event you are attending.', value: eventReminder, onChanged:  (v) => setState(() => eventReminder = v)),

                    SizedBox(height: 16,),






                  ],
                ),

              ),






            ],
          ),
        ),

      ),

    );


  }

  ListTile _titleLog(String title,  String duration,  {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Medium.copyWith(color: AppGrey.lightMain),
      ),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        
        Text(duration, style: text14Regular.copyWith(color: AppGrey.light500),),
        Icon(Icons.chevron_right, color: AppGrey.light300,)
        
      ],),
    );
  }

  Widget _toggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain)),
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