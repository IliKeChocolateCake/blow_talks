import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum duration {fifteen, third, one, eight, forever }

class AddNewPrice extends StatefulWidget{

  const AddNewPrice ({super.key});

  @override
  State<AddNewPrice> createState() => AddNewPricePage();

}


class AddNewPricePage extends State<AddNewPrice>{

  duration? hours = .fifteen;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(padding: EdgeInsets.all(20),

        child: Container(

          width: double.infinity,

          decoration: BoxDecoration(

            gradient: AppGradients.lightBackground
          ),


          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

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

                      child: Text('Add New Price Plan', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

                padding: EdgeInsets.symmetric(horizontal: 16),
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
                    SizedBox(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                          hintText: '5.00',
                          hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: text14Regular.copyWith(color: AppGrey.light400),
                      ),
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

            ],
          ),

        ),

      ),

    );
  }


}