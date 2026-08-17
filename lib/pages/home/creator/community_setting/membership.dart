import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/add_new_price.dart';
import 'package:blow_talks/pages/home/creator/community_setting/plan_detail.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



enum duration {
  fifteen('5.00'),
  third('15.00'),
  one('25.00'),
  eight('Free'),
  forever('Forever');

  final String label;
  const duration(this.label);
}

class Membership extends StatefulWidget{

  const Membership ({super.key});

  @override
  State<Membership> createState() => MembershipPage();

}


class MembershipPage extends State<Membership>{

  duration? hours = .fifteen;

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Padding(padding: EdgeInsets.all(20),


        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(

            gradient: isDarkMode(context) ? AppGradients.darkBackground :AppGradients.lightBackground,
          ),

          child: Column(

            children: [

              Padding(
                padding: const EdgeInsets.symmetric( vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
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
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(Icons.chevron_left,
                              color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                    Expanded(child: Center(
                      
                      child: Text('Membership', style: text16Bold.copyWith(color: AppGrey.lightMain),),
                      
                    ),),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddNewPrice()),
                        );
                      },
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
                          child: Icon(Icons.add,
                              color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              IntrinsicHeight(

                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),


                  child:  RadioGroup<duration>(
                    groupValue: hours,
                    onChanged: (duration? value) {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withValues(alpha: 0.5),
                        backgroundColor: Colors.transparent,
                        builder: (context) => FractionallySizedBox(
                          heightFactor: 0.75,
                          child: PlanDetail(value: value?.label ?? ''),  // 👈 Pass label
                        ),
                      );
                      setState(() {
                        hours = value;
                      });
                    },


                    child: Column(
                      children: <Widget>[
                        RadioListTile<duration>(
                          title: Text('\$5.00/lifetime', style: text14Medium.copyWith(color: isDarkMode(context) ? AppGrey.darkMain: AppGrey.lightMain),),
                          subtitle: Text('0 Members', style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500 : AppGrey.light500),),
                          value: duration.fifteen,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,

                        ),
                        Divider(
                          color: isDarkMode(context)? AppGrey.dark200 :AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<duration>(
                          title: Text('\$15.00/lifetime', style: text14Medium.copyWith(color: isDarkMode(context) ? AppGrey.darkMain: AppGrey.lightMain),),
                          subtitle: Text('0 Members', style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500 : AppGrey.light500),),
                          value: duration.third,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),
                        Divider(
                          color: isDarkMode(context)? AppGrey.dark200 :AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<duration>(
                          title: Text('\$25.00/lifetime', style: text14Medium.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),),
                          subtitle: Text('0 Members', style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500: AppGrey.light500),),
                          value: duration.one,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),
                        Divider(
                          color: isDarkMode(context)? AppGrey.dark200 :AppGrey.light200,
                          thickness: 1,
                        ),
                        RadioListTile<duration>(
                          title: Text('Free', style: text14Medium.copyWith(color: isDarkMode(context) ? AppGrey.darkMain : AppGrey.lightMain),),
                          subtitle: Text('190 Members', style: text12Regular.copyWith(color: isDarkMode(context) ?AppGrey.dark500 :AppGrey.light500),),
                          value: duration.eight,
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: brandColor,
                        ),

                      ],
                    ),

                  ),


                ),

              ),
              
              SizedBox(height: 15,),

              SizedBox(
                width: double.infinity,
                child: Text(
                  'Any updates to this membership plan will only apply to new subscribers. Existing members will remain on their original price plan.',
                  style: text12Regular.copyWith(color: isDarkMode(context) ? AppGrey.dark400: AppGrey.light400),
                ),
              ),
            ],

          ),
        ),

      ),
    );
  }



}