import 'package:flutter/material.dart';
import 'package:jotit_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: CustomNoteItem(),
          );
        },
      ),
    );
  }
}
