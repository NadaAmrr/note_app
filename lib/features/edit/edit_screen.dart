import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/widgets/note_sheet_widget.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.appName, style: AppStyle.styleBold20,),),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: NoteSheetWidget(
          buttonNote: AppString.editNoteBtn, onTap: () {  },
        ),
      ),
    );
  }
}
