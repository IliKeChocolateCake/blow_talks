import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class DataPrivacy extends StatefulWidget{


  const DataPrivacy ({super.key});

  @override
  State<DataPrivacy> createState() => DataPrivacyPage();

}



class DataPrivacyPage extends State<DataPrivacy>{

  bool showFollower = true;
  bool profileFollowing=true;

  bool joinDate=true;
  bool myLocation=true;
  bool myContribution=false;

  bool onlineStatus=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: isDarkMode(context)? AppGrey.dark100 : AppGrey.light100,

      body: SafeArea(child: Container(
        padding: const EdgeInsets.symmetric( horizontal: 20, ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileSetting()),
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
                      child: const Center(
                        child: Icon(Icons.chevron_left,
                            color: Colors.black, size: 24),
                      ),
                    ),
                  ),
                  Expanded(child: Center(

                    child: Text('Data & Privacy', style: text16Bold.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),),

                  ),),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => AddNewPrice()),
                      // );
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Center(
                        child: Icon(Icons.check,
                            color: Colors.transparent, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Text('Connection Visibility', style: text12Medium.copyWith(color: isDarkMode(context)? AppGrey.dark400 : AppGrey.light400),),

            SizedBox(height: 12,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode(context)? AppGrey.dark50 : AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),


              child: Column(

                children: [

                  _toggleTile2(title: 'Show Followers & Following', subtitle: 'Your followers and following lists will be visible to other members.',value:showFollower,
                    onChanged: (v) => setState(() => showFollower= v),),


                  Divider(
                    color: isDarkMode(context) ? AppGrey.dark200 :  AppGrey.light200,
                    thickness: 1,
                  ),

                  _toggleTile2(title: 'Profile Following', subtitle: 'Let other members follow your profile.',value: profileFollowing,
                    onChanged: (v) => setState(() => profileFollowing= v),),



                ],
              ),
            ),

            SizedBox(height: 16,),
            Text('Activity Visibility', style: text12Medium.copyWith(color: isDarkMode(context) ? AppGrey.dark400 : AppGrey.light400),),
            SizedBox(height: 12,),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode(context)? AppGrey.dark50 : AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),


              child: Column(

                children: [

                  _toggleTile2(title: 'Joined Date', subtitle: 'Show the date you become a member of this platform.',value: joinDate,
                    onChanged: (v) => setState(() => joinDate= v),),

                  Divider(
                    color: isDarkMode(context) ? AppGrey.dark200 :  AppGrey.light200,
                    thickness: 1,
                  ),

                  _toggleTile2(title: 'My Location', subtitle: 'Display your current location on your profile.',value: myLocation,
                    onChanged: (v) => setState(() => myLocation= v),),

                  Divider(
                    color: isDarkMode(context) ? AppGrey.dark200 :  AppGrey.light200,
                    thickness: 1,
                  ),

                  _toggleTile2(title: 'My Contribution', subtitle: 'Enable users on this platform to access your contributions across various communities.',value: myContribution,
                    onChanged: (v) => setState(() => myContribution= v),),

                ],
              ),
            ),

            SizedBox(height: 16,),
            Text('Presence & Availability', style: text12Medium.copyWith(color: isDarkMode(context) ? AppGrey.dark400 : AppGrey.light400),),
            SizedBox(height: 12,),


            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode(context)? AppGrey.dark50 : AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),


              child: Column(

                children: [

                  _toggleTile2(title: 'Online Status', subtitle: 'Let others see when you’re active on this platform.',value: onlineStatus,
                    onChanged: (v) => setState(() => onlineStatus= v),),

                ],
              ),
            ),
          ],

        ),

      )),

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
                Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain), maxLines: 1, overflow:TextOverflow.ellipsis,),

                Text(subtitle, style: text12Regular.copyWith(color: AppGrey.light500),),
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