import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:blow_talks/pages/profile/profile_setting/profile_setting.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => EditProfilePage();
}

class EditProfilePage extends State<EditProfile> {
  final TextEditingController _nameController =
  TextEditingController(text: 'Sofia Martinez');
  final TextEditingController _bioController = TextEditingController(
      text: "Hello! I'm Sofia, an adventurous spirit who dives into life with excitement.");

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Green header ──
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.brand,
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // back + checkmark row
                  Padding(

                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ProfileSetting()),
                          );

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.26),
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
                                child: Icon(Icons.chevron_left, color: Colors.white, size: 24),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text('', style: text16Bold.copyWith(color: AppGrey.lightMain)),
                          ),
                        ),

                        InkWell(
                          onTap: () {},
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

                  // avatar row
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // avatar + pencil badge
                        Stack(
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'asset/classroom/enroll/brian.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // pencil badge on avatar
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppGrey.light200, width: 1),
                                ),
                                child: Icon(Icons.edit,
                                    size: 12, color: AppGrey.lightMain),
                              ),
                            ),
                          ],
                        ),

                        // banner edit button (top right of header)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(Icons.edit,
                                size: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Body ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name + username
                  Text('Sofia Martinez',
                      style: text20Bold.copyWith(color: AppGrey.lightMain)),
                  const SizedBox(height: 2),
                  Text('@sofia0912',
                      style: text14Regular.copyWith(color: AppGrey.light500)),

                  const SizedBox(height: 20),

                  // Display Name field
                  Text('Display Name',
                      style: text12Medium.copyWith(color: AppGrey.light500)),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _nameController,
                    style: text14Regular.copyWith(color: AppGrey.lightMain),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppGrey.light200,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(Icons.check,
                          size: 18, color: brandColor),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Bio field
                  Text('Bio',
                      style: text12Medium.copyWith(color: AppGrey.light500)),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _bioController,
                    maxLines: 5,
                    maxLength: 80,
                    style: text14Regular.copyWith(color: AppGrey.lightMain),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppGrey.light200,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      counterStyle:
                      text12Regular.copyWith(color: AppGrey.light400),
                      counterText: 'Max 80 characters',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}