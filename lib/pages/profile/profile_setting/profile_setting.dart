import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/main.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/account.dart';
import 'package:blow_talks/pages/profile/profile_setting/appearances.dart';
import 'package:blow_talks/pages/profile/profile_setting/data_and_privacy/data_privacy.dart';
import 'package:blow_talks/pages/profile/profile_setting/language.dart';
import 'package:blow_talks/pages/profile/profile_setting/notification_push.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_payment/payment_history.dart';
import 'package:blow_talks/pages/profile/profile_setting/set_profile/edit_profile.dart';
import 'package:blow_talks/utils.dart';
import 'package:blow_talks/widget/main_navigation.dart';
import 'package:flutter/material.dart';




class ProfileSetting extends StatefulWidget{

  const ProfileSetting ({super.key});

  @override
  State<ProfileSetting> createState() => ProfileSettingPage();

}


class ProfileSettingPage extends State<ProfileSetting>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(



      body:SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(

          gradient: isDarkMode(context)
              ? AppGradients.darkBackground
              : AppGradients.lightBackground,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(

          children: [


            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Navigation(role: '', initialIndex: 3,)),
                    );

                      },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: isDarkMode(context) ? AppGrey.dark50: AppGrey.light50,
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
                          child: Icon(Icons.chevron_left, color: isDarkMode(context)? Colors.white :Colors.black, size: 24),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Center( // 👈 Add this
                      child: Text('Settings', style: text16Bold.copyWith(color: isDarkMode(context) ? AppGrey.darkMain : AppGrey.lightMain,)),
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



            Container(  width: double.infinity,

              decoration: BoxDecoration(

                color: isDarkMode(context) ? AppGrey.dark50: AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Account Settings', 'asset/profile/account.png', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Account()),
                    );
                  }),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Profile Settings', 'asset/profile/profile_setting.png', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EditProfile()),
                    );
                  }),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Data & Privacy', 'asset/profile/data_privacy.png', onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DataPrivacy()),
                    );
                  }),





                ],
              ),

            ),



            SizedBox(height: 16,),

            Container(

              width: double.infinity,
              decoration: BoxDecoration(

                color: isDarkMode(context) ? AppGrey.dark50: AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Payment History', 'asset/profile/payment.png', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PaymentHistory()),
                    );

                  }),



                ],
              ),

            ),


            SizedBox(height: 16,),

            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode(context) ? AppGrey.dark50: AppGrey.light50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),

              child: Column(

                children: [

                  _titleLog('Push Notifications', 'asset/profile/push_notifications.png', onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NotificationPush()),
                    );
                  }),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                ValueListenableBuilder<ThemeMode>(
                  valueListenable: appThemeMode,
                  builder: (context, mode, _) {
                    final label = mode == ThemeMode.dark
                        ? 'Dark'
                        : mode == ThemeMode.system
                        ? 'System'
                        : 'Light';

                    return _titleLog2(
                      'Appearances',
                      'asset/profile/appearance.png',
                      label, // 👈 updates automatically when theme changes
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => AppearanceBottomSheet(
                            initialIndex: appThemeMode.value == ThemeMode.dark
                                ? 1
                                : appThemeMode.value == ThemeMode.system
                                ? 2
                                : 0,
                          ),
                        ).then((_) {
                          // bottom sheet closed — force page to rebuild
                          if (mounted) setState(() {});
                        });
                      },
                    );
                  },
                ),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog2('Language', 'asset/profile/language.png', 'English', onTap: (){
                      showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const LanguageBottomSheet(),
  );
                  }),





                ],
              ),

            ),


            SizedBox(height: 16,),

            Container(

              width: double.infinity,

              decoration: BoxDecoration(

                color: isDarkMode(context) ? AppGrey.dark50: AppGrey.light50 ,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: Column(

                children: [

                  _titleLog('Log Out', 'asset/profile/log_out.png', onTap: () {
                    _showLogOutDialog(context);
                  }),



                ],
              ),

            ),



            const Spacer(),

            // footer — no divider, seamless with the gradient background
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02, // 2% of screen height
              ),
              child: Column(
                children: [
                  Text('blowtalks', style: text20Bold.copyWith(color: isDarkMode(context)? AppGrey.dark300: AppGrey.light300)),
                  Text('Meet. Connect. Thrive.', style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark300:AppGrey.light300)),
                ],
              ),
            ),





          ],
        ),




      ),),


    );
  }

  ListTile _titleLog(String title, String image, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Regular.copyWith(color: isDarkMode(context) ? AppGrey.darkMain : AppGrey.lightMain,),
      ),
      leading: SizedBox(
        width: 28,
        height: 28,
        child: Image.asset(image),
      ),
      onTap: onTap,

      trailing: Icon(Icons.chevron_right, size: 16, color: isDarkMode(context) ? AppGrey.dark300 :AppGrey.light300,),
    );
  }

  void _showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Log Out?',
          style: text16Bold.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: text14Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500:AppGrey.light500),
        ),
        actions: [
          Row(
            children: [
              // Stay button
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppGrey.light200,
                    foregroundColor: AppGrey.lightMain,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    minimumSize: const Size(0, 44),
                  ),
                  child: Text('Stay', style: text14Regular.copyWith(color: AppGrey.lightMain)),
                ),
              ),
              const SizedBox(width: 12),
              // Log out button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: your actual log out logic here
                    // e.g. clear tokens, navigate to login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppAlert.lightError500,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    minimumSize: const Size(0, 44),
                  ),
                  child: Text('Log out', style: text14Regular.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile _titleLog2(String title, String image, String value, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // minLeadingWidth: 40,
      title: Row(
        children: [
          Text(
            title,
            style: text14Regular.copyWith(color: isDarkMode(context) ? AppGrey.darkMain : AppGrey.lightMain,),
          ),
          
          Spacer(),
          
          Text(value, style: text14Regular.copyWith(color: isDarkMode(context) ? AppGrey.dark300 :AppGrey.light300,))
        ],
      ),
      leading: SizedBox(
        width: 28,
        height: 28,
        child: Image.asset(image),
      ),
      onTap: onTap,

      trailing: Icon(Icons.chevron_right, size: 16, color: isDarkMode(context)? AppGrey.dark300: AppGrey.light300,),
    );
  }

}