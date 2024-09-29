import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class EditScreen extends StatefulWidget {
  final NoteModel note;
  const EditScreen({super.key, required this.note});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    descriptionController = TextEditingController(text: widget.note.subtitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void saveNote() {
    widget.note.title = titleController.text;
    widget.note.subtitle = descriptionController.text;
    widget.note.save();
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appName, style: AppStyle.styleBold20),
        actions: [
          IconButton(
            onPressed: saveNote,
            icon:
            const Icon(Icons.done_outline_outlined, color: AppColors.green),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            /// Title
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: AppString.hintTitle,
                hintStyle: AppStyle.styleBold20,
              ),
              style: AppStyle.styleBold20,
            ),

            /// Description
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: AppString.hintDescription,
                hintStyle: AppStyle.styleBold16,
              ),
              style: AppStyle.styleBold16,
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
