import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:jotit_app/views/widgets/note_view_body.dart';

import 'widgets/add_note_buttom_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteButtomSheet();
                });
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: const NoteViewBody(),
      ),
    );
  }
}
