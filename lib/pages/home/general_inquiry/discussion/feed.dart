import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/discussion/feed_detail.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



class Feed extends StatefulWidget{
  const Feed ({super.key});


  @override
  State<Feed> createState() => FeedPage();

}

class FeedPage extends State<Feed>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: brandColor,
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
            child: Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.push_pin_outlined, size: 14, color: isDarkMode(context)?AppGrey.dark300: AppGrey.light300,),
                  SizedBox(width: 4,),
                  Text('PINNED', style: text12Bold.copyWith(color: isDarkMode(context)?AppGrey.dark300: AppGrey.light300),),
                ],
              ),

              SizedBox(height: 16,),

              InkWell(

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FeedDetail()),
                  );


                },

                child: Column(


                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('asset/chat/evelyn.png'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Evelyn Hayes', style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),
                                  SizedBox(width: 8),
                                  _buildBadge('EXPERT', Icons.diamond, AppOthers.lightBlueTransparent, AppOthers.lightBlueMain,AppOthers.lightBlueMain, AppOthers.lightBlueMain),
                                  SizedBox(width: 8),
                                  _buildBadge('ADMIN', Icons.brightness_1,AppGrey.light200,AppOthers.lightBlueMain, AppGrey.lightMain,AppGrey.light300),
                                  Spacer(),
                                  Text('25 Mar', style: text12Regular.copyWith(color: isDarkMode(context)?AppGrey.dark400:AppGrey.light400),),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'AI-related 🤖',
                                style: text12Medium.copyWith(color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16,),

                    Text('The Alignment Problem: Steering AI Towards Human Values 🚀', style: text14Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
                    Text('In the realm of AI ethics, ensuring fairness stands as a critical challenge. Algorithmic bias, stemming from prejudiced data or flawed design, can perpetuate societal inequalities. ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600),
                    ),

                    SizedBox(height: 16,),


                    Center(

                      child: Image.asset('asset/discussion/discussion.png'),
                    ),

                    SizedBox(height: 16,),

                    Row(

                      children: [

                        Icon(Icons.favorite, size: 20, color: isDarkMode(context)?AppOthers.darkRedMain:AppOthers.lightRedMain,),
                        SizedBox(width: 8,),
                        Text('22', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),
                        SizedBox(width: 8,),
                        Icon(Icons.chat_bubble_outline, size: 20,color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500,),
                        SizedBox(width: 8,),
                        Text('10', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),

                        Spacer(),

                        Icon(Icons.more_horiz_outlined, color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500, size: 20,)
                      ],

                    ),
                  ],


                ),

              ),

              SizedBox(height: 16,),

              Divider(
                color:isDarkMode(context)?AppGrey.dark200: AppGrey.light200,
                thickness: 1,
              ),

              SizedBox(height: 16,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/discussion/carlos.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Carlos Lin', style: text14Medium.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
                            SizedBox(width: 8),
                            _buildBadge('EXPLORER', Icons.diamond, AppOthers.lightPurpleTransparent, AppOthers.lightPurpleMain,AppOthers.lightPurpleMain, AppOthers.lightPurpleMain),

                            Spacer(),
                            Text('18 Apr', style: text12Regular.copyWith(color:isDarkMode(context)?AppGrey.dark400: AppGrey.light400),),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'AI-related 🤖',
                          style: text12Medium.copyWith(color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 16,),

              Text('What are the latest advancements in neural networks? 🤔', style: text14Bold.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
              Text('I\'m curious about the future of AI. What are some potential breakthroughs on the horizon?',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600),
              ),
              SizedBox(height: 16,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppGrey.light200, // your border color here
                    width: 1,
                  ),
                ),

                child: Text('Reinforcement Learning', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
              ),

              SizedBox(height: 8,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppGrey.light200, // your border color here
                    width: 1,
                  ),
                ),

                child: Text('Generative AI', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
              ),

              SizedBox(height: 8,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppGrey.light200, // your border color here
                    width: 1,
                  ),
                ),

                child: Text('Quantum Computing', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
              ),

              SizedBox(height: 8,),
              
              Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),

                child: Text('14 Votes', style: text12Regular.copyWith(color:isDarkMode(context)?AppGrey.dark200: AppGrey.light200),),
              ),
              SizedBox(height: 16,),
              Row(

                children: [

                  Icon(Icons.favorite_border_outlined, size: 20, color:isDarkMode(context)?AppGrey.dark500: AppGrey.light500,),
                  SizedBox(width: 8,),
                  Text('18', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),
                  SizedBox(width: 8,),
                  Icon(Icons.chat_bubble_outline, size: 20,color: isDarkMode(context)? AppGrey.dark500:AppGrey.light500,),
                  SizedBox(width: 8,),
                  Text('19', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),

                  Spacer(),

                  Icon(Icons.more_horiz_outlined, color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500, size: 20,)
                ],

              ),

              SizedBox(height: 16,),

              Divider(
                color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                thickness: 1,
              ),

              SizedBox(height: 16,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/discussion/zara.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('ZARA KHAN', style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),
                            SizedBox(width: 8),
                            _buildBadge('BEGINNER', Icons.diamond, brandTransparentLight, brandColor,brandColor, brandColor),

                            Spacer(),
                            Text('17 Apr', style: text12Regular.copyWith(color:isDarkMode(context)?AppGrey.dark400: AppGrey.light400),),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'General Discussion 💬',
                          style: text12Medium.copyWith(color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16,),

              Text('TensorFlow: A Guide to Building and Training Models', style: text14Bold.copyWith(color:isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
              Text('Streamlit: Building Interactive AI Apps with Ease',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600),
              ),
              SizedBox(height: 16,),

              Row(

                children: [

                  Icon(Icons.favorite_border_outlined, size: 20, color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500,),
                  SizedBox(width: 8,),
                  Text('29', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),
                  SizedBox(width: 8,),
                  Icon(Icons.chat_bubble_outline, size: 20,color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500,),
                  SizedBox(width: 8,),
                  Text('34', style: text14Regular.copyWith(color:isDarkMode(context)?AppGrey.dark600:AppGrey.light600)),

                  Spacer(),

                  Icon(Icons.more_horiz_outlined, color: isDarkMode(context)?AppGrey.dark500:AppGrey.light500, size: 20,)
                ],

              ),

              SizedBox(height: 16,),
            ],
          ),
        ),


      ),

    );
  }

  Widget _buildBadge(String label, IconData icon, Color backgroundColor, Color iconColor, Color textColor, Color borderColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: borderColor, // your border color here
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: iconColor),
          SizedBox(width: 4),
          Text(label, style: text10Medium.copyWith(color: textColor)),
        ],
      ),
    );
  }


}