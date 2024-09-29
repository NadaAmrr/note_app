import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/features/home/cubit/notes_cubit.dart';
import 'package:notes/features/home/home_screen.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.addNoteBtn,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) => NotesCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
