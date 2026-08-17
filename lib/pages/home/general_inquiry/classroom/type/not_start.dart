import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/learning/learning_page.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/member/enroll.dart';
import 'package:blow_talks/pages/home/general_inquiry/classroom/member/review_list.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';

class CourseDetailsNotStarted extends StatefulWidget {
  const CourseDetailsNotStarted({super.key});

  @override
  State<CourseDetailsNotStarted> createState() => CourseDetailsNotStartedPage();
}

class CourseDetailsNotStartedPage extends State<CourseDetailsNotStarted> {

  Color _dominantColor = Colors.grey;
  Color _secondaryColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final paletteGenerator = await PaletteGeneratorMaster.fromImageProvider(
      AssetImage('asset/classroom/product_manager.png'),
    );

    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.purple;
      _secondaryColor = paletteGenerator.vibrantColor?.color ?? _dominantColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _secondaryColor,   // vibrant color from image
              _dominantColor,    // dominant color from image
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(

          children: [

            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withValues(alpha: 0.5),
            ),

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () { Navigator.pop(context); },
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.26),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Center(
                                child: Icon(Icons.chevron_left, color: Colors.white, size: 24),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.26),
                                borderRadius: BorderRadius.circular(50),

                              ),
                              child: Center(
                                child: Icon(Icons.open_in_new, color: Colors.white, size: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Image.asset('asset/classroom/product_manager.png'),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AI for Product Manager', style: text24Bold.copyWith(color: Colors.white)),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(

                              color: AppOthers.lightYellowTransparent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: BoxBorder.all(
                                  color: AppOthers.lightYellowMain
                              )

                          ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star, color: AppOthers.lightYellowMain, size: 10,),
                              Text('4.6', style: text10Medium.copyWith(color: AppOthers.lightYellowMain)),
                            ],
                          ),
                        ),

                      ],
                    ),

                    Row(
                      children: [

                        Text('Not Started', style: text14Medium.copyWith(color: Colors.white.withValues(alpha: 0.7)),)

                      ],
                    ),
                    SizedBox(height: 16,),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: (){
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => const Navigation()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // brandColor 500
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Start Learning',
                          style: text14Regular.copyWith(color: AppGrey.lightMain),
                        ),
                      ),
                    ),


                    SizedBox(height: 32,),
                    Text(
                      'COURSE DESCRIPTION',
                      style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4)),
                    ),

                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),


                    Text('Embark on a transformative journey into the world of artificial intelligence with \'AI for Product Pioneers.\' This course delves into how AI is revolutionizing product management, offering insights into leveraging AI tools for comprehensive market analysis, creating intuitive user experiences, and formulating robust product strategies. Discover how to seamlessly integrate AI into your product roadmap, unlocking new opportunities and gaining a decisive competitive advantage in today\'s dynamic tech landscape. Prepare to lead the way in the age of AI-driven product innovation.',style: text14Regular.copyWith(color: Colors.white),),

                    SizedBox(height: 32,),

                    Text(
                      '3 MODULES, 18 LESSONS',
                      style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4)),
                    ),

                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),

                    SizedBox(height: 16,),


                    InkWell(

                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LearningPage()),
                        );
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),

                          SizedBox(width: 12,),

                          Text('AI Concepts: A PM\'s Introduction', style: text14Medium.copyWith(color: Colors.white),),



                          Spacer(),
                          Icon(Icons.add, size: 20, color: Colors.white.withValues(alpha: 0.7),),


                        ],
                      ),

                    ),

                    SizedBox(height: 16,),


                    InkWell(

                      onTap: (){

                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),

                          SizedBox(width: 12,),

                          Text('Data-Driven Decisions with Machine Learning', style: text14Medium.copyWith(color: Colors.white),),



                          Spacer(),
                          Icon(Icons.add, size: 20, color: Colors.white.withValues(alpha: 0.7),),


                        ],
                      ),

                    ),


                    SizedBox(height: 12,),

                    Padding(padding: EdgeInsets.symmetric(horizontal: 28, vertical: 8),

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Wrap(

                            crossAxisAlignment: WrapCrossAlignment.center,

                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              Text('1', style: text14Medium.copyWith(color: Colors.white),),

                              SizedBox(width: 12,),
                              Text('Understanding Regression Models', style: text14Medium.copyWith(color: Colors.white),),

                            ],

                          ),


                          SizedBox(height: 12,),

                          Wrap(

                            crossAxisAlignment: WrapCrossAlignment.center,

                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              Text('2', style: text14Medium.copyWith(color: Colors.white),),

                              SizedBox(width: 12,),
                              Text('AI-Powered Analytics Tools', style: text14Medium.copyWith(color: Colors.white),),

                            ],

                          ),

                          SizedBox(height: 12,),

                          Wrap(

                            crossAxisAlignment: WrapCrossAlignment.center,

                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              Text('3', style: text14Medium.copyWith(color: Colors.white),),

                              SizedBox(width: 12,),
                              Text('NLP for Enhanced User Understanding', style: text14Medium.copyWith(color: Colors.white),),

                            ],

                          ),

                          SizedBox(height: 12,),

                          Wrap(

                            crossAxisAlignment: WrapCrossAlignment.start,

                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              Text('4', style: text14Medium.copyWith(color: Colors.white),),

                              SizedBox(width: 12,),
                              Text('Visual AI: Image Recognition in \nProducts', style: text14Medium.copyWith(color: Colors.white),),

                            ],

                          ),

                          SizedBox(height: 12,),

                          Wrap(

                            crossAxisAlignment: WrapCrossAlignment.center,

                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12,),


                              Text('5', style: text14Medium.copyWith(color: Colors.white),),

                              SizedBox(width: 12,),
                              Text('Future of AI in Product Management', style: text14Medium.copyWith(color: Colors.white),),

                            ],

                          ),

                        ],

                      ),

                    ),



                    SizedBox(height: 12,),
                    InkWell(

                      onTap: (){

                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                          ),

                          SizedBox(width: 12,),

                          Text('Advanced AI Concepts and Applications', style: text14Medium.copyWith(color: Colors.white),),



                          Spacer(),
                          Icon(Icons.add, size: 20, color: Colors.white.withValues(alpha: 0.7),),


                        ],
                      ),

                    ),

                    SizedBox(height: 32,),

                    Text(
                      '123 ENROLLED',
                      style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4)),
                    ),

                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),

                    SizedBox(height: 16,),

                    InkWell(

                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Enroll()),
                        );
                      },
                      child: Image.asset('asset/classroom/avatars.png'),

                    ),
                    SizedBox(height: 16,),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,

                      children: [

                        Text('Tan Jia Mei, Christine Yang, Tan Kelly, Chong Sanna, and', style: text14Medium.copyWith(color: Colors.white),),

                        Text('119 more', style: text14Bold.copyWith(color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2.0,

                        )),

                      ],

                    ),


                    SizedBox(height: 32,),

                    Text(
                      '56 REVIEWS',
                      style: text12Bold.copyWith(color: Colors.white.withValues(alpha: 0.4)),
                    ),
                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),

                    ratingBreakdown(
                      averageRating: 4.2,
                      percentages: [68, 28, 6, 1, 1], // 5★ to 1★
                    ),

                    SizedBox(height: 32,),

                    review(
                      userName: 'Priya Sharma',
                      starCount: 5,
                      timeAgo: '3d ago',
                      description: 'This course helped me understand how AI can boost product strategy. Excellent!',
                    ),

                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),

                    review(
                      userName: 'Ricardo Silva',
                      starCount: 4,
                      timeAgo: '1w ago',
                      description: 'The AI tools section was very insightful. I\'m ready to apply these to my product roadmap.',
                    ),

                    Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),

                    review(
                      userName: 'Seline Yong',
                      starCount: 4,
                      timeAgo: '2w ago',
                      description: 'The AI ethics module was particularly impactful. A crucial aspect for product managers.',
                    ),


                    SizedBox(height: 32,),

                    InkWell(

                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ReviewList()),
                        );
                      },

                      child:       Text('View All',
                          style: text14Bold.copyWith(color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2.0,

                          )),

                    ),

                    SizedBox(height: 16,),
                  ],
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }


  Widget ratingBreakdown({
    required double averageRating,
    required List<double> percentages, // [5star, 4star, 3star, 2star, 1star]
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          averageRating.toString(),
          style: text32Bold.copyWith(color: Colors.white),
        ),
        SizedBox(height: 8),
        ...List.generate(5, (index) {
          int starCount = 5 - index;
          double percentage = percentages[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: LinearProgressIndicator(
                    value: percentage / 100,
                    backgroundColor: Color(0x33F8F8F8),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < starCount ? Icons.star : Icons.star_border,
                      size: 12,
                      color: Colors.white,
                    );
                  }),
                ),
                SizedBox(width: 4),
                SizedBox(
                  width: 32,
                  child: Text(
                    '${percentage.toInt()}%',
                    style: text12Regular.copyWith(color: Colors.white.withValues(alpha: 0.5)),
                  ),
                ),


              ],
            ),
          );
        }),
      ],
    );
  }


  Widget review({
    required String userName,
    required int starCount,
    required String timeAgo,
    required String description,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userName, style: text14Medium.copyWith(color: Colors.white.withValues(alpha: 0.8))),
          Row(
            children: [
              Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    starIndex < starCount ? Icons.star : Icons.star_border,
                    size: 12,
                    color: Colors.white,
                  );
                }),
              ),
              SizedBox(width: 8),
              Text(timeAgo, style: text12Regular.copyWith(color: Colors.white.withValues(alpha: 0.5))),
            ],
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(description, style: text12Regular.copyWith(color: Colors.white)),
      ),
    );
  }
}