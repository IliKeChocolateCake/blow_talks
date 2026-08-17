import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';


class RoleColor extends StatefulWidget{

  const RoleColor ({super.key});


  @override
  State<RoleColor> createState() => RoleColorPage();

}


class RoleColorPage extends State<RoleColor>{
  Color _selectedColor = AppOthers.lightRedMain; // 👈 Track selected

  final List<Color> _colors = [
    AppOthers.lightRedMain,
    AppOthers.lightOrangeMain,
    AppOthers.lightYellowMain,
    AppOthers.lightNeonGreenMain,
    AppOthers.lightBlueMain,
    AppOthers.lightPurpleMain,
    AppOthers.lightPinkMain,

  ];

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

            children: [
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // if (Navigator.canPop(context)) {
                        //   Navigator.pop(context);
                        // }
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: const Center(
                          child: Icon(Icons.chevron_left,
                              color: Colors.transparent, size: 24),
                        ),
                      ),
                    ),
                    Expanded(child: Center(

                      child: Text('Role Color', style: text16Bold.copyWith(color: AppGrey.lightMain),),

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




              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 12,
                children: _colors.map((color) {
                  final isSelected = _selectedColor == color;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedColor = color),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: isSelected
                          ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 20),
                      )
                          : null,
                    ),
                  );
                }).toList(),
              ),











            ],
          ),
        ),
    );
            }


}