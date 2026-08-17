import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';


enum duration {fifteen, third, one, eight, forever }


class MuteDuration extends StatefulWidget{

  const MuteDuration ({super.key});

  @override
  State<MuteDuration> createState() => MuteDurationPage();



}


class MuteDurationPage extends State<MuteDuration>{

  duration? hours = .fifteen;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppGrey.light100,

      appBar: AppBar(
        title: Text('Mute Duration', style: text16Bold.copyWith(color: AppGrey.lightMain),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
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

      ),

      body: Padding(padding: EdgeInsets.all(20),


        child: IntrinsicHeight(

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
                    title: Text('15 Minutes', style: text14Regular.copyWith(color: AppGrey.lightMain),),
                    value: duration.fifteen,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: brandColor,
                  ),
                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),
                  RadioListTile<duration>(
                    title: Text('30 Minutes', style: text14Regular.copyWith(color: AppGrey.lightMain),),
                    value: duration.third,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: brandColor,
                  ),
                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),
                  RadioListTile<duration>(
                    title: Text('1 hour', style: text14Regular.copyWith(color: AppGrey.lightMain),),
                    value: duration.one,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: brandColor,
                  ),
                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),
                  RadioListTile<duration>(
                    title: Text('8 hour', style: text14Regular.copyWith(color: AppGrey.lightMain),),
                    value: duration.eight,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: brandColor,
                  ),
                  Divider(
                    color: AppGrey.light200,
                    thickness: 1,
                  ),

                  RadioListTile<duration>(
                    title: Text('Forever', style: text14Regular.copyWith(color: AppGrey.lightMain),),
                    value: duration.forever,
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: brandColor,
                  ),
                ],
              ),

            ),


          ),

        ),



      ),
    );
  }

}