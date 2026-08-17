import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_payment/payment_history_detail.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



class PaymentHistory extends StatefulWidget{

  const PaymentHistory ({super.key});

  @override
  State<PaymentHistory> createState() => PaymentHistoryPage();

}


class PaymentHistoryPage extends State<PaymentHistory>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(child: Container(

        padding: EdgeInsets.all(20),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: isDarkMode(context)? AppGradients.darkBackground: AppGradients.lightBackground,
        ),

        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfileSetting()),
                      );
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
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
                      child: Center(
                        child: Icon(Icons.chevron_left,
                            color: isDarkMode(context) ? Colors.white :Colors.black, size: 24),
                      ),
                    ),
                  ),
                  Expanded(child: Center(

                    child: Text('Payment History', style: text16Bold.copyWith(color: isDarkMode(context)? AppGrey.darkMain: AppGrey.lightMain),),

                  ),),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => AddNewPrice()),
                      // );
                    },
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: const Center(
                        child: Icon(Icons.check,
                            color: Colors.transparent, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            paymentList('asset/leaderboard/member.png', 'AI Hubs Membership', 'Membership', '9', 'May 14 at 10:09PM'),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            paymentList('asset/leaderboard/member.png', 'School of Socrates Membership', 'Membership', '45', 'Apr 12 at 8:19PM'),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            paymentList('asset/leaderboard/book.png', 'Think Like A Philosopher', 'Course', '99', 'Apr 09 at 5:13PM'),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            paymentList('asset/leaderboard/hashtag.png', 'Other Philosophical Discussion', 'Channel', '10', 'Apr 01 at 10:35PM'),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            paymentList('asset/leaderboard/book.png', 'The Republic Explained', 'Course', '15', 'Mar 15 at 8:22PM'),

            Divider(
              color: isDarkMode(context)? AppGrey.dark200: AppGrey.light200,
              thickness: 1,
            ),

            paymentList('asset/leaderboard/book.png', '30D Content Creator Training', 'Course', '225', 'Mar 08 at 7:10PM'),

          ],
        ),
      )),
    );

  }

  InkWell paymentList (String image, String title, String type, String price, String timeStamp){

    return InkWell(

      onTap: (){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  PaymentHistoryDetail(title: title, itemType: type, price: price)),
        );

      },

      child: ListTile(

        leading: Container(
          height: 60,
          width: 60,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [
              isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
              isDarkMode(context)?AppGrey.dark300: AppGrey.light300

            ])
          ),
          
          child: Image.asset(height: 40, width: 40,image),
        ),

        title: Row(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(title, style: text14Medium.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
                Text('$type\n', style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark500: AppGrey.light500),)

              ],
            ),
            
            Spacer(),
            
            
            Text('-\$$price', style: text14Regular.copyWith(color: isDarkMode(context)? AppGrey.darkMain : AppGrey.lightMain),)

          ],
        ),


        subtitle: Text(timeStamp, style: text12Regular.copyWith(color: isDarkMode(context)? AppGrey.dark400 : AppGrey.light400),),

      ),
    );

  }

}