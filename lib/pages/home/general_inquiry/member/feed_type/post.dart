import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';





class Post extends StatefulWidget{


  const Post ({super.key,});

  @override
    State<Post> createState() => PostPage();

}


class PostPage extends State<Post>{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          posting('General Inquiry', 'AI-related', '20 Apr', 'Ensuring Fair Outcomes in ML Models', 'Explore the critical need to address bias and discrimination in algorithms. This discussion dives into'),
          Divider(
            color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
            thickness: 1,
          ),

          posting('Ethics', 'AI Ethics', '14 Apr', 'AI-Powered Diagnostics: Benefits and Risks', 'To ensure patient trust in AI solutions, healthcare providers must prioritize transparency, data privacy, and ethical considerations. Clear communication about how AI tools work, along with robust data protection measures, can foster confidence. Addressing biases in algorithms and ensuring equitable outcomes are also crucial for building trust and acceptance.'),

          Divider(
            color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
            thickness: 1,
          ),

          posting('General Inquiry', 'AI & Economics', '10 Mar', 'What do you think the impact of AI will be on the job market?', 'I believe AI will augment jobs, not eliminate them entirely. New roles will emerge.'),
        ],
      ),


    );
  }

  Widget posting(String group, String subGroup, String date, String title, String subtitle){

    return Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.language, size: 14, color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400,),
              SizedBox(width: 4,),
              Text(group, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500),),
              SizedBox(width: 8,),
              Icon(Icons.brightness_1, size: 4, color:isDarkMode(context)?AppGrey.dark300: AppGrey.light300,),
              SizedBox(width: 8,),
              Text(subGroup, style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500)),

              Spacer(),

              Text(date, style: text12Regular.copyWith(color: AppGrey.light400),),

            ],
          ),


          SizedBox(height: 16,),

          Text(title, style: text14Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),

          Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark600:AppGrey.light600),),

          SizedBox(height: 16,),

          Row(

            children: [

              Icon(Icons.favorite, size: 20, color:isDarkMode(context)?AppOthers.darkRedMain: AppOthers.lightRedMain,),
              SizedBox(width: 8,),
              Text('22', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),
              SizedBox(width: 8,),
              Icon(Icons.chat_bubble_outline, size: 20,color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500,),
              SizedBox(width: 8,),
              Text('10', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),

              Spacer(),

              Icon(Icons.more_horiz_outlined, color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500, size: 20,)
            ],

          ),


        ],

      ),
    );

  }


}