import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/learning/completed_module_bottomsheet.dart';
import 'package:flutter/material.dart';


class LearningPage extends StatefulWidget{

  const LearningPage ({super.key});


  @override
  State<LearningPage> createState() => LearningPagePage();

}


class LearningPagePage extends State<LearningPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        backgroundColor: AppGrey.light50,


      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,


                children: [

                  InkWell(
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



                  InkWell(
                    onTap: () {},
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
                          child: Icon(Icons.list, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),



              Text('AI Concepts: A PM\'s Introduction', style: text32Bold.copyWith(color: AppGrey.lightMain),),

              SizedBox(height: 16,),

              Text('📖 Introduction to this video', style: text20Bold.copyWith(color: AppGrey.lightMain),),

              SizedBox(height: 12,),


              Text('In this session, we\'re diving deep into the world of Artificial Intelligence (AI) specifically for Product Managers. Forget the tech jargon; we\'re here to make AI accessible and understandable. You\'ll learn how to weave AI into your product roadmap, enhance your development cycles, and create smarter, more intuitive products. We\'ll explore real-world examples, discuss potential challenges, and equip you with the insights to lead your team confidently into the age of AI-driven product innovation. Get ready to unlock the potential of AI and revolutionize your product strategy.', style: text14Regular.copyWith(color: AppGrey.lightMain),),


              SizedBox(height: 32,),
              
              Center(
                
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // thumbnail image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'asset/classroom/ai_concept.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // black overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                    // play button
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.7),

                      ),
                      child: Icon(Icons.play_arrow, color: Colors.black.withValues(alpha: 0.4), size: 28),
                    ),
                  ],
                ),
                
              ),

              SizedBox(height: 32,),

              Text('📃 Helpful document', style: text20Bold.copyWith(color: AppGrey.lightMain),),



              ListTile(
                leading: Icon(Icons.list_alt, size: 14, color: AppGrey.light500,),
                
                title: Text('Transcript_Lesson 3. pdf', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                
                trailing: Icon(Icons.more_horiz, size: 20, color: AppGrey.light500,),
                
              ),

              ListTile(
                leading: Icon(Icons.list_alt, size: 14, color: AppGrey.light500,),

                title: Text('Slideshow_Lesson 3.pptx', style: text14Medium.copyWith(color: AppGrey.lightMain),),

                trailing: Icon(Icons.more_horiz,  size: 20, color: AppGrey.light500,),

              ),

              SizedBox(height: 16,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // left group
                  Row(
                    children: [
                      InkWell(
                        onTap: () {  },
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
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {},
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
                            child: Icon(Icons.chevron_right, color: Colors.black, size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // right button
                  ElevatedButton(
                    onPressed: () {

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.6, // 90% height
                          child: const CompletedModuleBottomsheet(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(0, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                    ),
                    child: Text('Mark as Completed', style: text14Regular),
                  ),
                ],
              ),


            ],

          ),

        ),
      ),

    );
  }


}