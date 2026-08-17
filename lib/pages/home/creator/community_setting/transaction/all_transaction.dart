import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/transaction/transaction_membership.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';




class AllTransaction extends StatefulWidget{

  const AllTransaction ({super.key});


  @override
  State<AllTransaction> createState() => AllTransactionPage();


}

class AllTransactionPage extends State<AllTransaction>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,

        child: Scaffold(

          body: Container(

            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.lightBackground,
            ),


            child: Column(


            children: [

              Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),


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
                        child: Text('All Transactions', style: text16Bold.copyWith(color: AppGrey.lightMain)),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // date filter pill
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          children: [
                            Text('01 Oct 2025 - 31 Oct 2025',
                                style: text12Medium.copyWith(color: AppGrey.lightMain)),
                            const SizedBox(width: 8),
                            const Icon(Icons.keyboard_arrow_down, size: 14),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // tab bar — remove Expanded since we're in a scroll view now,
                      // let it size to its own content width
                      ButtonsTabBar(
                        backgroundColor: AppGrey.lightMain,
                        radius: 100,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        labelStyle: text12Medium.copyWith(color: AppGrey.light200),
                        unselectedLabelStyle: text12Medium.copyWith(color: AppGrey.lightMain),
                        unselectedBackgroundColor: AppGrey.light200,
                        tabs: const [
                          Tab(text: 'Membership'),
                          Tab(text: 'Channel'),
                          Tab(text: 'Course'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),



              const SizedBox(height: 10),

              // Tab content
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: TransactionMembership()),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                    Center(child: Text('Feature coming soon.', style: text14Regular,)),
                  ],
                ),
              ),


            ],


            ),


          ),

        ),

    );
  }



}