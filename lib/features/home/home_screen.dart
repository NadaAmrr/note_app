import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/widgets/note_item_widget.dart';
import 'package:notes/features/home/widgets/note_sheet_widget.dart';

import '../../core/utils/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      /// floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        showModalBottomSheet(
            backgroundColor: AppColors.greyDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            context: context, builder: (context) {
          return NoteSheetWidget(buttonNote: AppString.addNoteBtn, onTap: () {  },);
        });
      },backgroundColor: AppColors.greyDark, child: const Icon(Icons.add),),
      /// App Bar
      appBar: AppBar(
        title:  Text(AppString.appName,style: AppStyle.styleBold20.copyWith(color: AppColors.white.withOpacity(0.7))),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(12)),
              height: 40,
              width: 40,
              child: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),

      /// Notes
      body: ListView.separated(
        itemBuilder: (context, index) {
          return NoteItemWidget(height: height, width: width,);
        },
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: height * 0.01);
        },
      ),
    );
  }
}
