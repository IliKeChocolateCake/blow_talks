import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_category/create_category.dart';
import 'package:blow_talks/pages/home/creator/community_setting/manage_category/detail_category.dart';
import 'package:flutter/material.dart';


class ManageCategories extends StatefulWidget{
  
  const ManageCategories ({super.key});
  
  
  @override
  State<ManageCategories> createState() => ManageCategoriesPage();
  
}

class ManageCategoriesPage extends State<ManageCategories> {

  final List<String> _categories = [ // 👈 Simple string list
    'General',
    'Self Care 🧘',
    'Finance 💰',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: AppGradients.lightBackground,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
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
                          child: Icon(Icons.chevron_left, color: Colors.black, size: 24),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('Manage Categories', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CreateCategory()),
                        );
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
                          child: Icon(Icons.add, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ Single flat ReorderableListView
              Expanded(
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      final item = _categories.removeAt(oldIndex);
                      _categories.insert(newIndex, item);
                    });
                  },
                  children: _categories.asMap().entries.map((e) {
                    return _categoryTile(
                      key: ValueKey(e.key),
                      name: e.value,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryTile({required Key key, required String name}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            barrierColor: Colors.black.withValues(alpha: 0.5),
            backgroundColor: Colors.transparent,
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.9,
              child: DetailCategory(name: name),  // 👈 Pass label
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: text14Regular.copyWith(color: AppGrey.lightMain),
              ),
            ),
            Icon(Icons.drag_indicator, size: 20, color: AppGrey.light300),
          ],
        ),
      ),
    );
  }
}