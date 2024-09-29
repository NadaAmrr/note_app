import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/edit/edit_screen.dart';
import 'package:notes/features/home/cubit/notes_cubit.dart';
import 'package:notes/features/home/widgets/note_sheet_widget.dart';
import 'package:notes/models/note_model.dart';

class NoteItemWidget extends StatelessWidget {
  final double height;
  final double width;
  final NoteModel noteModel;
  const NoteItemWidget({super.key, required this.height, required this.width, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: height * 0.02, vertical: width * 0.019),
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
            title: Text(noteModel.title ?? ""),
            subtitle: Text(noteModel.subtitle ?? ""),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == AppString.archive) {
                  // Navigator.pop(context);
                } else if (value == AppString.delete) {
                 noteModel.delete();
                 BlocProvider.of<NotesCubit>(context).getAllNotes();
                } else if (value == AppString.edit) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditScreen(note: noteModel,)),
                  );
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: AppString.archive,
                    child: Text(AppString.archive),
                  ),
                  const PopupMenuItem(
                    value: AppString.delete,
                    child: Text(AppString.delete),
                  ),
                  const PopupMenuItem(
                    value: AppString.edit,
                    child: Text(AppString.edit),
                  ),
                ];
              },
              icon: const Icon(Icons.more_vert, color: AppColors.black),
            ),
          ),
          Text(
            noteModel.date ?? "",
            style: AppStyle.styleBold16.copyWith(color: AppColors.black),
          ),
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
