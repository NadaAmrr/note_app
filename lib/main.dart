import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/app/my_app.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/models/note_model.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(AppString.noteBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}
