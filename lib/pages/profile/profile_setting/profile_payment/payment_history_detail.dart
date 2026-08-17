import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_payment/payment_history.dart';
import 'package:blow_talks/utils.dart';
import 'package:flutter/material.dart';



class PaymentHistoryDetail extends StatefulWidget{



  final String title;
  final String itemType;
  final String price;

  const PaymentHistoryDetail ({super.key, required this.title, required this.itemType, required this.price});


  @override
  State<PaymentHistoryDetail> createState() => PaymentHistoryDetailPage();

}


class PaymentHistoryDetailPage extends State<PaymentHistoryDetail>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: isDarkMode(context)?AppGradients.darkBackground: AppGradients.lightBackground,
          ),

          child: Column(

            children: [

              Padding(

                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PaymentHistory()),
                      );

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
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
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.chevron_left, color: isDarkMode(context) ?Colors.white:Colors.black, size: 24),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Center( // 👈 Add this
                        child: Text('Details', style: text16Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain)),
                      ),
                    ),

                    InkWell(
                      onTap: () {



                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color:Colors.transparent,
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: const Center(
                          child: Icon(Icons.add, color: Colors.transparent, size: 24),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 62.5,),

              Center(child: Text('-\$${widget.price}', style: text40Bold.copyWith(color: isDarkMode(context)?AppGrey.darkMain:AppGrey.lightMain),),),


              SizedBox(height: 62.5,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(

                  children: [

                    itemList('Item Type',widget.itemType),
                    Divider(
                      color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                      thickness: 1,
                    ),

                    itemList('Item Name',widget.title),
                    Divider(
                      color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                      thickness: 1,
                    ),

                    itemList('Community','School of Socrates'),



                  ],

                ),

              ),


              SizedBox(height: 16,),

              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode(context)?AppGrey.dark50:AppGrey.light50,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(

                  children: [

                    itemList('Payment Method', 'Apple Pay'),

                    Divider(
                      color: isDarkMode(context)?AppGrey.dark200:AppGrey.light200,
                      thickness: 1,
                    ),

                    itemList('Date',''),

                  ],

                ),

              ),

            ],

          ),



      ),
      ),

    );
  }

  ListTile itemList(String itemTitle, String itemSub){

    return ListTile(

      leading: Text(itemTitle, style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.dark500: AppGrey.light500),),

      trailing: Text(itemSub, style: text14Regular.copyWith(color: isDarkMode(context)?AppGrey.darkMain: AppGrey.lightMain),),
    );
  }

}