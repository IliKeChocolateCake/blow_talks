import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/notifications/all_notifcation.dart';
import 'package:blow_talks/utils.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';



class Notifications extends StatefulWidget{

  const Notifications ({super.key});

  @override
  State<Notifications> createState() => NotificationPage();

}

class NotificationPage extends State<Notifications>{
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 5,
        child:  Container(

          padding: EdgeInsets.symmetric(horizontal: 20),

          width: double.infinity,
          decoration: BoxDecoration(

            gradient: isDarkMode(context)?AppGradients.darkBackground: AppGradients.lightBackground,
          ),

          child: SafeArea(child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20),

                child:  Text('Notifications', style: text24Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain)),
              ),



              const SizedBox(height: 20),

              ButtonsTabBar(
                backgroundColor: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain,
                labelSpacing: 12,
                radius: 100,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                labelStyle: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200),
                unselectedLabelStyle: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),
                unselectedBackgroundColor: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Following'),
                  Tab(text: 'Comments'),
                  Tab(text: 'Replies'),
                  Tab(text: 'Event Updates'),
                ],
              ),

              const SizedBox(height: 10),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: AllNotifcation()),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                  ],
                ),
              ),
            ],
          ),)

        ),

    );
  }



}