import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/cubit/add_note_cubit.dart';
import 'package:notes/features/home/widgets/note_form_widget.dart';

class NoteSheetWidget extends StatelessWidget {
  const NoteSheetWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddNoteCubit(),
  child: Padding(
      padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: NoteFormWidget(),
      ),
    ),
);
  }
}
