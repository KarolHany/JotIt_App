import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_note_item.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          CustomNoteItem(),
        ],
      ),
    );
  }
}
