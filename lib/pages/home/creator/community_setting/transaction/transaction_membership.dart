import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';



class TransactionMembership extends StatefulWidget{


  const TransactionMembership ({super.key});


  @override
  State<TransactionMembership> createState() => TransactionMembershipPage();

}


class TransactionMembershipPage extends State<TransactionMembership>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,

      body: SingleChildScrollView(

        child: Container(

          padding: EdgeInsets.all(20),

          child: Column(

            children: [


              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),


              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),


              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),


              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),


              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),


              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),


              Divider(
                color: AppGrey.light200,
                thickness: 1,
              ),

              transactionItem(
                title: 'Membership',
                amount: '+ \$9',
                name: 'Tan Mei Mei',
                avatarAsset: 'asset/classroom/enroll/emily.png',
                date: 'Oct 22 at 10:09PM',
              ),




            ],

          ),
        ),

      ),

    );
  }


  Widget transactionItem({
    required String title,
    required String amount,
    required String name,
    required String date,
    String avatarAsset = 'asset/avatar/default.png',
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // left side — title, avatar+name, date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text14Bold.copyWith(color: AppGrey.lightMain)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        avatarAsset,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(name, style: text12Regular.copyWith(color: AppGrey.lightMain)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(date, style: text12Regular.copyWith(color: AppGrey.light400)),
              ],
            ),
          ),
          // right side — amount
          Text(
            amount,
            style: text14Medium.copyWith(color: AppGrey.lightMain),
          ),
        ],
      ),
    );
  }

}