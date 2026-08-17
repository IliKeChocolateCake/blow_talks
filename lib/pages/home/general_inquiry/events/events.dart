import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/content_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/general_inquiry/events/event_list.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';


class Events extends StatefulWidget{

  const Events  ({super.key});


  @override
  State<Events > createState() => EventsPage();

}


class EventsPage extends State<Events > {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradients.lightBackground,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => const Navigation()),
                        // );
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
                          Text('General Inquiry', style: text16Bold),
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
                                Text('Events', style: text12Regular.copyWith(color: Colors.grey)),
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


              Padding(padding: EdgeInsets.symmetric(horizontal: 20),


                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Text('All Events', style: text12Medium.copyWith(color: AppGrey.lightMain),),
                          SizedBox(width: 8,),
                          Icon(Icons.keyboard_arrow_down,size: 14,)
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ButtonsTabBar(
                        backgroundColor: AppGrey.lightMain,
                        radius: 100,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        labelStyle: text12Medium.copyWith(color: AppGrey.light200),
                        unselectedLabelStyle: text12Medium.copyWith(color: AppGrey.lightMain),
                        unselectedBackgroundColor: AppGrey.light200,
                        tabs: [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Past'),

                        ],
                      ),
                    ),
                  ],
                ),

              ),









              const SizedBox(height: 10),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: EventsList()),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}