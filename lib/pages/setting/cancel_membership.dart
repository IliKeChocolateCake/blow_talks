import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import'package:flutter/material.dart';

class CancelMembership extends StatelessWidget{

  const CancelMembership ({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),

      child: Container(
        width: double.infinity,
        color: Colors.white,

          child: Padding(padding: EdgeInsets.all(20),


            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    InkWell(
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


                    InkWell(
                      onTap: () { Navigator.pop(context); },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.check, color: Colors.white, size: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12,),
                InkWell(
                  onTap: () { Navigator.pop(context); },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
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
                        child: Icon(Icons.close, color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12,),
                
                Text('Cancel Membership', style: text20Bold.copyWith(color: AppGrey.lightMain)),

                Wrap(

                  crossAxisAlignment: WrapCrossAlignment.start,
                children: [

                  Text('Please be aware that you will permanently lose ', style: text14Regular.copyWith(color: AppGrey.light400),),
                  Text('all data ', style: text14Bold.copyWith(color:  AppGrey.light400),),
                  Text('related to this community, including:', style: text14Regular.copyWith(color: AppGrey.light400),),

                ],
                ),

                Text(''),

                Text('• All courses you’ve access to, including those you’ve purchased.', style: text14Regular.copyWith(color: AppGrey.light400),),
                Text('• All contributions (posts, comments and etc) you’ve made in this community.', style: text14Regular.copyWith(color: AppGrey.light400),),
                Text('• Your progress, achievements and saved materials.', style: text14Regular.copyWith(color: AppGrey.light400),),
                Text(''),
                RichText(
                  text: TextSpan(
                    style: text14Regular.copyWith(color: AppGrey.light400),
                    children: [
                      TextSpan(text: 'Please type '),
                      TextSpan(
                        text: '\'Cancel\'',
                        style: text14Bold.copyWith(color: AppGrey.light400),
                      ),
                      TextSpan(text: ' in the textbox below to confirm your action.'),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                TextField(

                  decoration: InputDecoration(
                    hintText: 'Cancel',
                    filled: true,
                    fillColor: AppGrey.light50,
                    hintStyle: text14Regular.copyWith(color: AppGrey.light300),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: text14Regular,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 15.0,
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