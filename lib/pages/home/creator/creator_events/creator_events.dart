import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/creator_content_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/creator/creator_events/create_new_event.dart';
import 'package:blow_talks/pages/home/creator/creator_events/creator_event_list.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';


class CreatorEvents extends StatefulWidget{

  const CreatorEvents ({super.key});


  @override
  State<CreatorEvents > createState() => EventsPage();

}


class EventsPage extends State<CreatorEvents > {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        floatingActionButton: InkWell(
          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateEvent()),
            );

          },
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color:brandColor,
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
              child: Icon(Icons.add,
                  color: Colors.white, size: 24),
            ),
          ),
        ),

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
                                  child: const CreatorContentTypeBottomsheet(),
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
                    Center(child: CreatorEventsList()),
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