import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  getAllNotes() {
    emit(NotesLoading());
    var notesBox = Hive.box<NoteModel>(AppString.noteBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
