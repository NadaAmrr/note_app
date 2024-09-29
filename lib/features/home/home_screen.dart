import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_styles.dart';
import 'package:notes/features/home/cubit/notes_cubit.dart';
import 'package:notes/features/home/widgets/note_item_widget.dart';
import 'package:notes/features/home/widgets/note_sheet_widget.dart';
import 'package:notes/models/note_model.dart';

import '../../core/utils/app_strings.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.greyDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return NoteSheetWidget();
            },
          );
        },
        backgroundColor: AppColors.greyDark,
        child: const Icon(Icons.add),
      ),

      /// App Bar
      appBar: AppBar(
        title: Text(
          AppString.appName,
          style: AppStyle.styleBold20.copyWith(
            color: AppColors.white.withOpacity(0.7),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 40,
              width: 40,
              child: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),

      /// Notes
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.grey,));
          } else if (state is NotesSuccess) {
            List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return NoteItemWidget(
                  height: height,
                  width: width,
                  noteModel: notes[index],
                );
              },
              itemCount: notes.length,
            );
          } else if (state is NotesFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text('No notes found.'));
          }
        },
      ),
    );
  }
}
