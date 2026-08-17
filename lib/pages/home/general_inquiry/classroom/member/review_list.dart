import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';




class ReviewList extends StatefulWidget{


  const ReviewList ({super.key});


  @override
  State<ReviewList> createState() => ReviewListPage();

}


class ReviewListPage extends State<ReviewList>{
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
                crossAxisAlignment: CrossAxisAlignment.center,
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


                  Text('All Review', textAlign: TextAlign.center, style: text16Bold.copyWith(color: AppGrey.lightMain),),

                  InkWell(
                    onTap: null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Center(
                          child: Icon(Icons.chevron_left, color: Colors.transparent, size: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              review(userName: 'Alice Yap', starCount: 4, timeAgo: '12d ago', description: 'I love this course :)'),


             Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              review(userName: 'Sofia Martinez', starCount: 4, timeAgo: '15d ago', description: 'This course is very helpful for an amateur like me.'),



              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              review(userName: 'Yang Yang', starCount: 5, timeAgo: '22d ago', description: 'I highly recommend this course; it provides a comprehensive introduction to the world of Greek Philosophy.'),



              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              review(userName: 'Maria Lopez', starCount: 5, timeAgo: '24d ago', description: 'This course exceeded my expectations! The lectures are engaging and the materials are well-organized.'),



              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              review(userName: 'Raj Patel', starCount: 5, timeAgo: '26d ago', description: 'I found the course to be insightful and thought-provoking; the discussions really helped deepen my understanding.'),



              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              review(userName: 'Emma Chen', starCount: 5, timeAgo: '27d ago', description: 'An excellent introduction to Greek Philosophy! The instructor is knowledgeable and encourages great discussions.'),



            ],
          ),
        ),
      ),

    );
  }

  Widget review({
    required String userName,
    required int starCount,
    required String timeAgo,
    required String description,
  }) {
    return ListTile(

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName, style: text14Medium.copyWith(color: AppGrey.light600)),
          Row(
            children: [
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    starIndex < starCount ? Icons.star : Icons.star_border,
                    size: 12,
                    color: AppOthers.lightYellowMain,
                  );
                }),
              ),
              SizedBox(width: 8),
              Text(timeAgo, style: text12Regular.copyWith(color: AppGrey.light400)),
            ],
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(description, style: text14Regular.copyWith(color: AppGrey.lightMain)),
      ),
    );
  }

}