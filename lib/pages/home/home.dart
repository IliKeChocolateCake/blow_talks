import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/community_list.dart';
import 'package:blow_talks/pages/home/general_inquiry/discussion/discussion.dart';
import 'package:blow_talks/pages/home/leaderboard/leaderboard.dart';
import 'package:blow_talks/pages/home/private/wellness.dart';
import 'package:blow_talks/pages/setting/community_setting.dart';
import 'package:flutter/material.dart';





class Home extends StatefulWidget{
  
  const Home ({super.key});
  
  
  @override
  State<Home> createState() => HomePage();
  
}


class HomePage extends State<Home>{


  bool isExpanded=true;
  bool isWell=true;
  bool isTrading = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,



      body: SingleChildScrollView(

        child: SafeArea(child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            gradient: AppGradients.lightBackground,

          ),

          child: Padding(padding: EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Row(

                  children: [



                    CircleAvatar(
                      radius: 25.5,
                      backgroundImage: AssetImage('asset/profile/profile.jpg'),
                    ),

                    SizedBox(width: 6,),

                    Text('AI Hub by Jane', style: text16Medium,),


                    IconButton(onPressed: (){

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.5, // 90% height
                          child: const CommunityList(),
                        ),
                      );

                    }, icon: Icon(Icons.unfold_more), iconSize: 16, color: AppGrey.light300,),

                    Spacer(),


                    InkWell(
                      onTap: () {  },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color:Colors.white,
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
                            child: IconButton(onPressed: () {

                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                barrierColor: Colors.black.withValues(alpha: 0.3),
                                backgroundColor: Colors.transparent,
                                builder: (context) => FractionallySizedBox(
                                  heightFactor: 0.85, // 90% height
                                  child: const CommunitySetting(),
                                ),
                              );

                            }, icon: Icon(Icons.more_horiz, color: AppGrey.lightMain, size: 24)),
                          ),
                        ),
                      ),
                    ),


                  ],

                ),


                SizedBox(
                  height: 20,
                ),



                Container(


                  width: double.infinity,

                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),


                  ),

                  child: Column(


                    children: [

                      _titleLog('Feed', 'asset/icon/feed.png', onTap: (){} ),
                      Divider(
                        color: AppGrey.light200,
                        thickness: 1,
                      ),
                      _titleLog('Leaderboard', 'asset/icon/leaderboard.png', onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Leaderboard()),
                        );
                      }),



                    ],
                  ),

                ),


                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('General', style: text12Medium.copyWith(color:AppGrey.light400)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded; // toggle
                        });
                      },
                      icon: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppGrey.light300, size: 16,
                      ),
                    ),
                  ],
                ),


                if (isExpanded)...[

                  SizedBox(height: 12,),

                  Container(


                    width: double.infinity,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),


                    ),

                    child: Column(


                      children: [

                        _titleLog('General Discussion', 'asset/icon/public.png', onTap: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Discussion()),
                          );

                        } ),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog2('Collaborative AI Learning', 'asset/icon/public.png'),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog('Private Group Discussion', 'asset/icon/private.png', onTap: (){} ),


                      ],
                    ),

                  ),




                ],

                SizedBox(height: 16,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('AI Wellness 🧘', style: text12Medium.copyWith(color:AppGrey.light400)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isWell = !isWell; // toggle
                        });
                      },
                      icon: Icon(
                        isWell
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppGrey.light300, size: 16,
                      ),
                    ),
                  ],
                ),


                if (isWell)...[

                  SizedBox(height: 12,),

                  Container(


                    width: double.infinity,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),


                    ),

                    child: Column(


                      children: [

                        _titleNotification(context, 'Embrace AI', 'asset/icon/public.png', badgeCount: 1),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog('AI in Self-Help Literature', 'asset/icon/public.png'),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog('30-Day AI Wellness Challenge', 'asset/icon/private.png', onTap: (){

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            barrierColor: Colors.black.withValues(alpha: 0.5),
                            backgroundColor: Colors.transparent,
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.75, // 90% height
                              child: const Wellness(),
                            ),
                          );


                        } ),


                      ],
                    ),

                  ),




                ],
                SizedBox(height: 16,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('AI in Trading 📈', style: text12Medium.copyWith(color:AppGrey.light400)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isTrading = ! isTrading; // toggle
                        });
                      },
                      icon: Icon(
                        isTrading
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppGrey.light300, size: 16,
                      ),
                    ),
                  ],
                ),



                if (isTrading)...[

                  SizedBox(height: 12,),

                  Container(


                    width: double.infinity,

                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),


                    ),

                    child: Column(


                      children: [

                        _titleLog('Algorithmic Trading', 'asset/icon/public.png', onTap: (){} ),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog('AI Stock Analysis', 'asset/icon/public.png'),
                        Divider(
                          color: AppGrey.light200,
                          thickness: 1,
                        ),
                        _titleLog('7-Day AI Trading Challenge', 'asset/icon/private.png', onTap: (){} ),


                      ],
                    ),

                  ),




                ],



              ],

            ),


          ),

        ),),



      ),

    );






  }
  
  
  
  
}


ListTile _titleLog(String title, String image, {VoidCallback? onTap}) {
  return ListTile(
    dense: true, // 👈 Add this
    visualDensity: VisualDensity(vertical: -4),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    // minLeadingWidth: 40,
    title: Text(
      title,
      style: text14Regular.copyWith(color: AppGrey.lightMain),
    ),
    leading: SizedBox(
      width: 16,
      height: 16,
      child: Image.asset(image),
    ),
    onTap: onTap,
  );
}


ListTile _titleLog2(String title, String image, {VoidCallback? onTap}) {
  return ListTile(
    dense: true, // 👈 Add this
    visualDensity: VisualDensity(vertical: -4),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    // minLeadingWidth: 40,
    title: Text(
      title,
      style: text14Bold.copyWith(color: AppGrey.lightMain),
    ),
    leading: SizedBox(
      width: 16,
      height: 16,
      child: Image.asset(image),
    ),
    onTap: onTap,
  );
}

ListTile _titleNotification(BuildContext context, String title, String image,
    {int badgeCount = 0, VoidCallback? onTap}) {
  return ListTile(
    dense: true, // 👈 Add this
    visualDensity: VisualDensity(vertical: -4),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    // minLeadingWidth: 40,
    title: Text(
      title,
      style: text14Bold.copyWith(color: AppGrey.lightMain),
    ),
    leading: SizedBox(
      width: 16,
      height: 16,
      child: Image.asset(image),
    ),
    trailing: badgeCount > 0
        ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:AppOthers.lightRedMain, // red from your color system
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        badgeCount > 99 ? '99+' : badgeCount.toString(),
        style: text8Bold.copyWith(color: Colors.white),
      ),
    )
        : null, // no trailing if count is 0
    onTap: onTap,
  );
}