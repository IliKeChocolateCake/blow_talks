import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/content_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/general_inquiry/discussion/feed.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';


class Discussion extends StatefulWidget{

  const Discussion ({super.key});


  @override
  State<Discussion> createState() => DiscussionPage();

}


class DiscussionPage extends State<Discussion> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: isDarkMode(context)?AppGradients.darkBackground:AppGradients.lightBackground,
          ),
          child: Column(
            children: [

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (Navigator.canPop(context)) Navigator.pop(context);
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
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('General Inquiry', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                          InkWell(
                            onTap: () {

                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                barrierColor: Colors.black.withValues(alpha: 0.5),
                                backgroundColor: Colors.transparent,
                                builder: (context) => FractionallySizedBox(
                                  heightFactor: 0.5, // 90% height
                                  child: const ContentTypeBottomsheet(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Discussion', style: text12Regular.copyWith(color: Colors.grey)),
                                Icon(Icons.unfold_more, size: 12, color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 44),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child:  // Tab bar
                ButtonsTabBar(
                  backgroundColor: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain,
                  radius: 100,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  labelStyle: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.dark200: AppGrey.light200),
                  unselectedLabelStyle: text12Medium.copyWith(color:  isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),
                  unselectedBackgroundColor:  isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                  tabs: [
                    Tab(text: 'General Discussion 💬'),
                    Tab(text: 'Resources 📖'),
                    Tab(text: 'AI-related 🤖'),
                  ],
                ),
              ),



              const SizedBox(height: 10),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Feed()),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                  ],
                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}