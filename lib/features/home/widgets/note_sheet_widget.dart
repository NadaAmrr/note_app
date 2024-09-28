import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/core/widgets/custom_button.dart';

class NoteSheetWidget extends StatelessWidget {
  final String buttonNote;
  final VoidCallback onTap;
  const NoteSheetWidget({super.key, required this.buttonNote, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(buttonNote,style: AppStyle.styleBold20.copyWith(color: AppColors.grey, letterSpacing: 14), ), trailing: GestureDetector(
              onTap: onTap,
              child: Icon(Icons.check_circle, size: 40, color: AppColors.green,))),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppString.hintTitle,
                hintStyle: AppStyle.styleBold20),
            style: AppStyle.styleBold20,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppString.hintDescription,
                hintStyle: AppStyle.styleBold16),
            style: AppStyle.styleBold16,
          ),
          Spacer(),
          // SizedBox(
          //     width: double.infinity,
          //     child: CustomButton(text: buttonNote, onPressed: () {  },)),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
