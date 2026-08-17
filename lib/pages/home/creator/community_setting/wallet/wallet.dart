import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
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


class Wallet extends StatefulWidget{


  const Wallet ({super.key});

  @override
  State<Wallet> createState() => WalletPage();

}

class WalletPage extends State<Wallet>{

duration? hours = .fifteen;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

     body: Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       width: double.infinity,
       height: double.infinity,
       decoration: BoxDecoration(
         gradient: AppGradients.lightBackground,
       ),


       child: Column(

         children: [

           Padding(padding: EdgeInsets.symmetric(vertical: 20,),


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
                     child: Text('My Wallets', style: text16Bold.copyWith(color: AppGrey.lightMain)),
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



           Container(

             width: double.infinity,

             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(16),

             ),

             child: Column(

               children: [

                 role('Add New'),
                 Divider(
                   color: AppGrey.light200,
                   thickness: 1,
                 ),


                 RadioGroup<duration>(
                   groupValue: hours,
                   onChanged: (duration? value) {

                     setState(() {
                       hours = value;
                     });
                   },


                   child: Column(
                     children: <Widget>[
                       RadioListTile<duration>(
                         title: Text('USDT (TRC20)', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                         subtitle: Text('TYsK79...5xVi', style: text12Regular.copyWith(color: AppGrey.light500),),
                         value: duration.fifteen,
                         controlAffinity: ListTileControlAffinity.trailing,
                         activeColor: brandColor,
                         secondary: CircleAvatar( // 👈 Use secondary for leading in RadioListTile
                           radius: 20,
                           backgroundImage: AssetImage('asset/wallet.png'),
                         ),

                       ),
                       Divider(
                         color: AppGrey.light200,
                         thickness: 1,
                       ),
                       RadioListTile<duration>(
                         title: Text('USDT (TRC20)', style: text14Medium.copyWith(color: AppGrey.lightMain),),
                         subtitle: Text('TC8mEn...ZnEp', style: text12Regular.copyWith(color: AppGrey.light500),),
                         value: duration.third,
                         controlAffinity: ListTileControlAffinity.trailing,
                         activeColor: brandColor,
                         secondary: CircleAvatar( // 👈 Use secondary for leading in RadioListTile
                           radius: 20,
                           backgroundImage: AssetImage('asset/wallet.png'),
                         ),
                       ),
                       Divider(
                         color: AppGrey.light200,
                         thickness: 1,
                       ),
                       RadioListTile<duration>(
                         title: Text('USDT (TRC20)', style: text14Medium.copyWith(color: AppGrey.lightMain)),
                         subtitle: Text('TH9wG7...YDRp', style: text12Regular.copyWith(color: AppGrey.light500)),
                         value: duration.one,
                         controlAffinity: ListTileControlAffinity.trailing,
                         activeColor: brandColor,
                         secondary: CircleAvatar( // 👈 Use secondary for leading in RadioListTile
                           radius: 20,
                           backgroundImage: AssetImage('asset/wallet.png'),
                         ),
                       ),


                     ],
                   ),

                 ),


               ],

             ),


           ),
         ],

       ),


     ),

    );
  }


  InkWell role ( String title ){


    return InkWell(

      onTap: (){



        // showModalBottomSheet(
        //   context: context,
        //   isScrollControlled: true,
        //   barrierColor: Colors.black.withValues(alpha: 0.5),
        //   backgroundColor: Colors.transparent,
        //   builder: (context) => FractionallySizedBox(
        //     heightFactor: 0.9,
        //     child: AddMembers(),  // 👈 Pass label
        //   ),
        // );


      },

      child: ListTile(

        leading: Icon(Icons.add, size: 16, color: AppGrey.lightMain,),

        title: Text(title, style: text14Medium.copyWith(color: AppGrey.lightMain),),

      ),

    );

  }





}