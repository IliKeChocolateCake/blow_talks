import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';



class DetailCategory extends StatefulWidget{

  final String name;

  const DetailCategory  ({super.key, required this.name});


  @override
  State<DetailCategory > createState() => DetailCategoryPage();

}

class DetailCategoryPage extends State<DetailCategory >{

  TextEditingController get _nameController => TextEditingController(text: widget.name);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 20,),
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

                    child: Text('Category Detail', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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

            Text('Category Name', style: text12Regular.copyWith(color: AppGrey.light600)),
            const SizedBox(height: 6),
            TextField(
              controller: _nameController,
              style: text14Regular.copyWith(color: AppGrey.lightMain),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppGrey.light200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: brandColor),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),

            const SizedBox(height: 12),



            InkWell(

              onTap: (){

                debugPrint('n');
              },

              child: Container(

                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),

                ),

                child: Text(
                  'Delete Plan',
                  style: text14Regular.copyWith(color: AppAlert.lightError500),
                ),


              ),

            ),





          ],
        ),
      ),

    );
  }


}