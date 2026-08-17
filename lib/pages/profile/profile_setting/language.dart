import 'package:blow_talks/const/constant.dart';
import 'package:blow_talks/const/text_style.dart';
import 'package:flutter/material.dart';

// ── How to trigger this bottom sheet ──────────────────────────────────────
//
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent,
//     builder: (_) => const LanguageBottomSheet(),
//   );
//
// ─────────────────────────────────────────────────────────────────────────

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String _selected = 'English';

  final List<String> _languages = [
    'English',
    '中文（繁體）',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppGrey.light100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: AppGrey.light300,
              borderRadius: BorderRadius.circular(100),
            ),
          ),

          const SizedBox(height: 16),

          // title
          Text(
            'Language',
            style: text16Bold.copyWith(color: AppGrey.lightMain),
          ),

          const SizedBox(height: 16),

          // language list
          ..._languages.map((lang) => _languageItem(lang)),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _languageItem(String language) {
    final bool isSelected = _selected == language;

    return InkWell(
      onTap: () {
        setState(() => _selected = language);
        // slight delay so user sees the selection before sheet closes
        Future.delayed(const Duration(milliseconds: 150), () {
          Navigator.pop(context, language);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Text(
              language,
              style: text14Regular.copyWith(
                color: isSelected ? AppGrey.lightMain : AppGrey.light500,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(Icons.check, size: 18, color: brandColor),
          ],
        ),
      ),
    );
  }
}