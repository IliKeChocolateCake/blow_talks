import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';



class GiveReview extends StatefulWidget{
  
  const GiveReview ({super.key});
  
  @override
  State<GiveReview> createState() => GiveReviewPage();
  
}


class GiveReviewPage extends State<GiveReview>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppGrey.light50,

      body: Column(
mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

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
                      child: Icon(Icons.close, color: Colors.black, size: 24),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Review', style: text16Bold),

                    ],
                  ),
                ),
                SizedBox(width: 44),
              ],
            ),
          ),
          
          SizedBox(height: 20,),
          Center(
            
            child: Text('5.0', style: text40Bold.copyWith(color: AppGrey.lightMain),),
          ),
          SizedBox(height: 24,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 48, color: AppOthers.lightYellowMain),
              Icon(Icons.star, size: 48, color: AppOthers.lightYellowMain),
              Icon(Icons.star, size: 48, color: AppOthers.lightYellowMain),
              Icon(Icons.star, size: 48, color: AppOthers.lightYellowMain),
              Icon(Icons.star, size: 48, color: AppOthers.lightYellowMain),
            ],
          ),

          SizedBox(height: 16,),
          Center(

            child: Text('Outstanding 🤩', style: text14Regular.copyWith(color: AppGrey.light500),),
          ),

          SizedBox(height: 20,),
          
          Container(
            padding: EdgeInsets.all(20),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Write Your Review', style: text12Regular.copyWith(color: AppGrey.light600),),

                TextField(
                  decoration: InputDecoration(
                    hintText: 'Share your thoughts about the course here. What did you find most helpful?',
                    hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                    filled: true,
                    fillColor:AppGrey.lightInputBg,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppGrey.light200),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppGrey.light300),
                    ),
                    contentPadding: EdgeInsets.all(16),
                  ),
                  maxLines: 5,    // 👈 Makes it a textbox
                  minLines: 3,    // 👈 Minimum height
                ),
                
              ],
            ),
            
          ),

          

        ],
      ),

    );
  }
  
  
}