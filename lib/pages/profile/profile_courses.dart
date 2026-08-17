import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/completed.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/not_start.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/type/progress.dart';
import 'package:flutter/material.dart';



class ProfileCourses extends StatefulWidget{

  const ProfileCourses ({super.key});

  @override
  State<ProfileCourses> createState() => ProfileCoursesPage();

}


class ProfileCoursesPage extends State<ProfileCourses>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(


        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(

            gradient: AppGradients.lightBackground,
            
          ),

          child: Column(

            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () { Navigator.pop(context); },
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
                      child: Center( // 👈 Add this
                        child: Text('Courses', style: text16Bold.copyWith(color: AppGrey.lightMain)),
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
              courseNotStarted('asset/classroom/product_manager.png', 'AI for Project Manager', 'Not Started',
                  onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CourseDetailsNotStarted()),
                    );

                  }),


              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),


              courseProgress('asset/classroom/ai_guide.png', 'Complete ChatGPT, Claude AI Guide', 55,
                  onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CourseDetailsProgress()),
                    );

                  }),


              IntrinsicWidth(
                child: Divider(
                  color: AppGrey.light200,
                  thickness: 1,
                ),
              ),


              courseCompleted('asset/classroom/deep_learning.png', 'Deep Learning Fundamentals', 'Completed on 15 Jan, 2025', onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CourseDetailsCompleted()),
                );


              }),

            ],

          ),


      ),

      ),

    );
  }

  InkWell courseNotStarted (String image, String title, String status, {VoidCallback? onTap}){

    return InkWell(

      child: ListTile(

        onTap: onTap,
        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('$status\n\n', style: text12Medium.copyWith(color: AppGrey.light600),),


          ],

        ),

      ),


    );


  }

  InkWell courseProgress (String image, String title, int progressPercentage, {VoidCallback? onTap}){

    return InkWell(

      onTap: onTap,

      child: ListTile(

        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressPercentage / 100,
                    backgroundColor: AppGrey.lightMain.withValues(alpha: 0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(brandColor), // your app's color
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 6,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '$progressPercentage%',
                  style: text12Regular.copyWith(color: AppGrey.lightMain),
                ),
              ],
            ),

            Text('\n'),
          ],
        ),

      ),


    );


  }


  InkWell courseCompleted (String image, String title, String status, {VoidCallback? onTap}){

    return InkWell(

      onTap: onTap,
      child: ListTile(

        leading: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(image),

        ),

        title: Text(title, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Wrap(

              crossAxisAlignment: WrapCrossAlignment.start,

              children: [

                Icon(Icons.check, color: brandColor,size: 14,),
                SizedBox(width: 8,),
                Text('$status\n\n', style: text12Medium.copyWith(color: brandColor),),
              ],

            ),


          ],

        ),

      ),


    );


  }

}