import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/general_inquiry/content_type_bottomsheet.dart';
import 'package:blow_talks/pages/home/general_inquiry/documentation/documentation_details.dart';
import 'package:flutter/material.dart';






class Documentation extends StatefulWidget{

  const Documentation ({super.key});


  @override
  State<Documentation> createState() => DocumentationPage();

}

class DocumentationPage extends State<Documentation>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
                                child: const ContentTypeBottomsheet(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Documentation', style: text12Regular.copyWith(color: Colors.grey)),
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


            document('asset/classroom/channel.png', 'Channel Rooms', 'Jason (Creator)', 'asset/classroom/enroll/brian.png', onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DocumentationDetails()),
              );

            }),


            document('asset/classroom/evolution.png', 'The Evolution of Ideas: How it has changed', 'Jason (Creator)', 'asset/classroom/enroll/brian.png'),
          ],
        ),
      ),
    );
  }


  InkWell document(String image, String docTitle, String sub , String avatar,  {VoidCallback? onTap}){
    
    return InkWell(
      
      onTap: onTap,
      
      child: ListTile(

        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(image),
        ),
        
        title: Text(docTitle, style: text14Regular.copyWith(color: AppGrey.lightMain),),
        
        
        subtitle: Row(

          children: [
            CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage(avatar),

            ),

            SizedBox(width: 8,),
            Text(sub, style: text12Medium.copyWith(color: AppGrey.light500),),

          ],
        ),
        
        
      ),
      
      
    );
  }
  
  
  
}