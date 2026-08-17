import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/cupertino.dart';
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

class Discoverability extends StatefulWidget{


  const Discoverability ({super.key});

  @override
  State<Discoverability> createState() =>   DiscoverabilityPage();

}


class DiscoverabilityPage extends State<Discoverability>{

  bool discoverAbility = true;
  duration? hours = .fifteen;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20),


              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () { Navigator.pop(context); },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
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

                  Expanded(
                    child: Center( // 👈 Add this
                      child: Text('Discoverability', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                    ),
                  ),

                  SizedBox(width: 64,),

                ],
              ),
            ),

            Text('Discoverability Settings', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(
              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),


              ),

              child: _toggleTile(
                title: 'Discoverable',
                subtitle: 'People will discover and join your community from Community Discovery page.',
                value: discoverAbility,
                onChanged: (v) => setState(() => discoverAbility = v),
              ),

            ),


            SizedBox(height: 15,),
            Text('Join Requests and Approval', style: text12Medium.copyWith(color: AppGrey.light400),),

            SizedBox(height: 12,),

            Container(
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
                      title: Text('Manual Approval', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                      subtitle: Text('New members must be reviewed and approved by a community admin before they can join. You\'ll receive a notification for each pending request.', style: text12Regular.copyWith(color: AppGrey.light500),),
                      value: duration.fifteen,
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: brandColor,

                    ),
                    Divider(
                      color: AppGrey.light200,
                      thickness: 1,
                    ),
                    RadioListTile<duration>(
                      title: Text('Auto-Approval', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                      subtitle: Text('New members are automatically approved and can join the community instantly without admin review.', style: text12Regular.copyWith(color: AppGrey.light500),),
                      value: duration.third,
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: brandColor,
                    ),

                  ],
                ),

              ),


            ),


            SizedBox(height: 15,),

            Text('This setting applies only to free communities. For paid communities, requests are automatically approved after payment is completed.', style: text12Regular.copyWith(color: AppGrey.light400),)
          ],
        ),

      ),
    );
  }

  Widget _toggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: text12Regular.copyWith(color: AppGrey.light500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,

            // ── Thumb ──

            inactiveThumbColor: Colors.white,

            // ── Track ──
            activeTrackColor: const Color(0xff0AAB83),
            inactiveTrackColor: AppFixed.lightGrey,

            // ── Track border ──
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return brandColor; // no border when active
              }
              return AppFixed.lightGrey; // border color when inactive
            }),




          ),
        ],
      ),
    );
  }
}