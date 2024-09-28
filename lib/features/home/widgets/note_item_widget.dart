import 'package:flutter/material.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/edit/edit_screen.dart';
import 'package:notes/features/home/widgets/note_sheet_widget.dart';

class NoteItemWidget extends StatelessWidget {
  final double height;
  final double width;
  const NoteItemWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.02, vertical: width * 0.019),
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text("This is the first note"),
            subtitle: Text("This is the description of the note"),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == AppString.archive) {
                  // Navigator.pop(context);
                } else if (value == AppString.delete) {
                  // Delete action
                } else if (value == AppString.edit) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditScreen()),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: AppString.archive,
                    child: Text(AppString.archive),
                  ),
                  PopupMenuItem(
                    value: AppString.delete,
                    child: Text(AppString.delete),
                  ),
                  PopupMenuItem(
                    value: AppString.edit,
                    child: Text(AppString.edit),
                  ),
                ];
              },
              icon: Icon(Icons.more_vert, color: AppColors.black),
            ),
          ),
          Text(
            "sddddddddxxxxxxxxd",
            style: AppStyle.styleBold16.copyWith(color: AppColors.black),
          )
        ],
      ),
    );
  }
}

// child: const ListTile(
//   title: Text("This is the first note"),
//   subtitle: Text("This is the description of the note"),
//   trailing: IntrinsicHeight(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(Icons.more_vert, color: AppColors.black),
//         SizedBox(height: 4),
//         Text("dasssssssssssta"),
//       ],
//     ),
//   ),
// ),
