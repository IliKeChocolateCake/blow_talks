import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';



class DocumentationDetails extends StatefulWidget{

  const DocumentationDetails ({super.key});

  @override
  State<DocumentationDetails> createState() => DocumentationDetailsPage();

}


class DocumentationDetailsPage extends State<DocumentationDetails>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor: AppGrey.light50,
      body: SingleChildScrollView(

        child: Padding(padding: EdgeInsetsGeometry.all(20),


          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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


                  InkWell(
                    onTap: () {

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
                        child: Icon(Icons.open_in_new, color: Colors.black, size: 24),
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(height: 20,),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('asset/classroom/channel.png'),
              ),

              SizedBox(height: 20,),

              Text('Channel Rules', style: text32Bold.copyWith(color: AppGrey.lightMain),),

              SizedBox(height: 8),
              Row(

                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('asset/classroom/enroll/brian.png'),

                  ),

                  SizedBox(width: 8,),
                  Text('Jason (Creator)', style: text12Medium.copyWith(color: AppGrey.lightMain),),

                  SizedBox(width: 12,),

                  Text('Jun 19, 2025', style: text12Medium.copyWith(color: AppGrey.light500),),

                ],
              ),

              SizedBox(height: 32),
              
              
              Text('1. Always show respect and kindness to every member of our community, as this fosters a welcoming environment for all. ',style: text14Regular.copyWith(color: AppGrey.lightMain),),

              Text('\n2. Please refrain from spamming or promoting your own content excessively, as this can disrupt the flow of conversation and detract from the experience of others. ',style: text14Regular.copyWith(color: AppGrey.lightMain),),

              Text('\n3. Ensure that your discussions remain pertinent to the specific topic of the channel, helping to maintain focus and relevance in our conversations. ',style: text14Regular.copyWith(color: AppGrey.lightMain),),

              Text('\n4. It is important to communicate using language that is appropriate and considerate, as this reflects our values and encourages positive interactions.',style: text14Regular.copyWith(color: AppGrey.lightMain),),

              Text('\n5. If you encounter any problems or issues, do not hesitate to report them to our moderators, who are here to assist and ensure a smooth experience for everyone.',style: text14Regular.copyWith(color: AppGrey.lightMain),),




            ],
          ),
        ),

      ),

    );
  }

}