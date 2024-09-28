import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/app/my_app.dart';
import 'package:notes/core/utils/app_strings.dart';


void main() async{
  await Hive.initFlutter();

  await Hive.openBox(AppString.noteBox);
  runApp(const NotesApp());
}