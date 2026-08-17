import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';


class PaymentMethod extends StatefulWidget{

  const PaymentMethod ({super.key});


  @override
  State<PaymentMethod> createState() => PaymentMethodPage();

}


class PaymentMethodPage extends State<PaymentMethod>{
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        width: double.infinity,

       color: AppGrey.light300,
        child: SingleChildScrollView(

          child: Padding(padding: EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Select Payment Method', style: text16Bold,),

                SizedBox(height: 51,),
                
                Text('\$45', style: text40Bold.copyWith(color: AppGrey.lightMain),),
                SizedBox(height: 10,),
                Text('lifetime', style: text14Regular.copyWith(color: AppGrey.light500),),
                SizedBox(height: 50,),


                payment('asset/classroom/apple_pay.png', 'Apple Pay', 'Complete your payment effortlessly using Apple Pay with just a single click.'),
                SizedBox(height: 12,),

                payment('asset/classroom/crypto.png', 'Cryptocurrency', 'You\'ll be directed to our secure crypto gateway to complete your transaction.'),
                SizedBox(height: 32,),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: (){
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => const Navigation()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandColor, // brandColor 500
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Continue',
                      style: text14Regular,
                    ),
                  ),
                ),

                SizedBox(height: 32,),
                    ],
            ),
          ),

        ),
      ),
    );

  }


  InkWell payment (String image, String paymentTitle, String description){

    return InkWell(

      child: Container(
        padding: EdgeInsets.all(16),

        decoration: BoxDecoration(

          color: AppGrey.light50,
          borderRadius: BorderRadius.circular(16),


        ),

        child: ListTile(
          
          leading: Container(
            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(12),
              border: BoxBorder.all(

                color: AppGrey.light300
                    
              )
            ),
            child: Image.asset(image, width: 44, height: 30,),
          ),


          title: Text(paymentTitle, style: text14Medium.copyWith(color: AppGrey.lightMain),),
          subtitle: Text(description, style: text12Regular.copyWith(color: AppGrey.light500),),
        ),


      ),

    );
  }

}