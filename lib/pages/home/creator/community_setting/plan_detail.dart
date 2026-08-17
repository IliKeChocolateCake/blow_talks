import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum duration {fifteen, third, one, eight, forever }


class PlanDetail extends StatefulWidget{

  final String value;

  const PlanDetail ({super.key, required this.value});


  @override
  State<PlanDetail> createState() => PlanDetailPage();

}


class PlanDetailPage extends State<PlanDetail>{

  duration? hours = .fifteen;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),

      child: Container(
        width: double.infinity,

        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
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
                        child: Icon(Icons.close,
                            color: Colors.black, size: 24),
                      ),
                    ),
                  ),
                  Expanded(child: Center(

                    child: Text('Plan Detail', style: text16Bold.copyWith(color: AppGrey.lightMain),),

                  ),),
                  InkWell(
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
                        child: Icon(Icons.check,
                            color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(

              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

              ),

              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Amount (\$)',
                    style: text14Medium.copyWith(color: AppGrey.lightMain),
                  ),
                  Spacer(),
                  Text(
                   widget.value,
                    style: text14Regular.copyWith(color: AppGrey.light600),
                  ),
                ],
              ),


            ),

            SizedBox(height: 12,),

            Text('Billing cycle', style: text12Medium.copyWith(color: AppGrey.light300),),

            SizedBox(height: 12,),


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
                    setState(() {
                      hours = value;
                    });
                  },


                  child: Column(
                    children: <Widget>[
                      RadioListTile<duration>(
                        title: Text('Lifetime', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                        subtitle: Text('Non-member need to make a one-time payment to join this community', style: text12Regular.copyWith(color: AppGrey.light500),),
                        value: duration.fifteen,
                        controlAffinity: ListTileControlAffinity.trailing,
                        activeColor: brandColor,
                      ),

                    ],
                  ),

                ),


              ),

            ),

            SizedBox(height: 12,),


            InkWell(

              onTap: (){

                debugPrint('n');
              },

              child: Container(

                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),

                child: Text(
                  'Delete Plan',
                  style: text14Regular.copyWith(color: AppAlert.lightError500),
                ),


              ),

            ),


          ],

        ),
      ),
    );
  }


}