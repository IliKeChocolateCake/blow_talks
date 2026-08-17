import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/change_email_one.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/profile_change_password.dart';
import 'package:blow_talks/pages/profile/profile_setting/account/username.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';


class Account extends StatefulWidget{


  const Account ({super.key});


  @override
  State<Account> createState() => AccountPage();

}



class AccountPage extends State<Account>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(child: Container(


        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(

          gradient: isDarkMode(context)?AppGradients.darkBackground: AppGradients.lightBackground,

        ),

        child:Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileSetting()),
                    ); },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
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

                  Expanded(
                    child: Center(
                      child: Text('Account Settings', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
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

              child: Column(

                children: [

                  _titleLog2('Username', 'sofia0912', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Username()),
                    );
                  }),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog2('Email', 's*****3@gmail.com', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ChangeEmailOne()),
                    );
                  }),

                  Divider(
                    color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                    thickness: 1,
                  ),

                  _titleLog('Password', onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileChangePassword()),
                    );
                  }),


                ],
              ),

            ),

          ],
        ),

      ),),
    );
  }

  ListTile _titleLog(String title, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // minLeadingWidth: 40,
      title: Text(
        title,
        style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),
      ),

      onTap: onTap,

      trailing: Icon(Icons.chevron_right, size: 16, color:isDarkMode(context)?AppGrey.dark300: AppGrey.light300,),
    );
  }

  ListTile _titleLog2(String title, String value, {VoidCallback? onTap}) {
    return ListTile(
      dense: true, // 👈 Add this
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // minLeadingWidth: 40,
      title: Row(
        children: [
          Text(
            title,
            style: text14Regular.copyWith(color: isDarkMode(context)? AppGrey.darkMain:AppGrey.lightMain),
          ),

          Spacer(),

          Text(value, style: text14Regular.copyWith(color:isDarkMode(context)? AppGrey.dark500: AppGrey.light500),)
        ],
      ),

      onTap: onTap,

      trailing:  Icon(Icons.chevron_right, size: 16, color: isDarkMode(context)?AppGrey.dark300: AppGrey.light300,),
    );
  }
}