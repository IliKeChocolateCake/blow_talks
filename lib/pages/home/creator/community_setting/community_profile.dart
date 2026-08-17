import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';

class CommunityProfile extends StatefulWidget {
  const CommunityProfile({super.key});

  @override
  State<CommunityProfile> createState() => CommunityProfilePage();
}

class CommunityProfilePage extends State<CommunityProfile> {
  final TextEditingController _nameController =
  TextEditingController(text: 'AI Hub by Gordon');
  final TextEditingController _bioController = TextEditingController(
    text:
    'Welcome to AI Hub! This is a space for AI enthusiasts to connect, share ideas, and explore the latest advancements in artificial intelligence.',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrey.light50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Banner + Avatar + Buttons ──
            Stack(
              clipBehavior: Clip.none,
              children: [

                // Banner
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.asset(
                    'asset/banner.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                // Back button
                Positioned(
                  top: 48,
                  left: 20,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.26),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(Icons.chevron_left, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ),

                // Save button
                Positioned(
                  top: 48,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: brandColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ),

                // Avatar
                Positioned(
                  bottom: -36,
                  left: 20,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('asset/profile/profile.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(Icons.edit, size: 12, color: AppGrey.lightMain),
                        ),
                      ),
                    ],
                  ),
                ),

                // Banner edit button
                Positioned(
                  bottom: -18,
                  right: 20,
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.edit, size: 14, color: AppGrey.lightMain),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 48),

            // ── Name + Members ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AI Hub by Gordon', style: text20Bold.copyWith(color: AppGrey.lightMain)),
                  const SizedBox(height: 4),
                  Text('423 members', style: text14Regular.copyWith(color: AppGrey.light500)),

                  const SizedBox(height: 24),

                  // Display Name field
                  Text('Display Name', style: text12Regular.copyWith(color: AppGrey.light600)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _nameController,
                    style: text14Regular.copyWith(color: AppGrey.lightMain),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.check, color: brandColor, size: 20),
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

                  const SizedBox(height: 16),

                  // Bio field
                  Text('Bio', style: text12Regular.copyWith(color: AppGrey.light600)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _bioController,
                    maxLines: 5,
                    minLines: 4,
                    maxLength: 80,
                    style: text14Regular.copyWith(color: AppGrey.lightMain),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppGrey.light200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: brandColor),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text('Max 80 characters', style: text12Regular.copyWith(color: AppGrey.light400)),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}