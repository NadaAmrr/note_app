import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/cubit/add_note_cubit.dart';
import 'package:notes/features/home/cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class NoteFormWidget extends StatefulWidget {
  const NoteFormWidget({super.key});

  @override
  State<NoteFormWidget> createState() => _NoteFormWidgetState();
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          BlocProvider.of<NotesCubit>(context).getAllNotes();
          Navigator.pop(context);
        }

        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).getAllNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                AppString.addNoteBtn,
                style: AppStyle.styleBold20
                    .copyWith(color: AppColors.grey, letterSpacing: 14),
              ),
              trailing: GestureDetector(
                onDoubleTap: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formattedCurrentDate =
                        DateFormat('dd-MM-yyyy').format(currentDate);
                    var noteModel = NoteModel(
                      title: titleController.text.isNotEmpty
                          ? titleController.text
                          : "",
                      subtitle: subtitleController.text.isNotEmpty
                          ? subtitleController.text
                          : "",
                      date: formattedCurrentDate,
                      color: Colors.grey.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    BlocProvider.of<NotesCubit>(context).getAllNotes();
                    Navigator.of(context).pop();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: const Icon(
                  Icons.check_circle,
                  size: 40,
                  color: AppColors.green,
                ),
              ),
            ),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  /// title
                  TextFormField(
                    controller: titleController,
                    validator: validator,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: AppString.hintTitle,
                      hintStyle: AppStyle.styleBold20,
                    ),
                    style: AppStyle.styleBold20,
                  ),

                  /// Description
                  TextFormField(
                    controller: subtitleController,
                    validator: validator,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: AppString.hintDescription,
                      hintStyle: AppStyle.styleBold16,
                    ),
                    style: AppStyle.styleBold16,
                  ),
                  const SizedBox(height: 150,)
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    }
    return null;
  }
}
