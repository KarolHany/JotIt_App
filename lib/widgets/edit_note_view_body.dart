import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:jotit_app/widgets/colors_list_view.dart';
import 'package:jotit_app/widgets/custom_app_bar.dart';
import 'package:jotit_app/widgets/edit_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // Function to update the note and save it to Hive
  void _updateNote() {
    widget.note.title = _titleController.text;
    widget.note.subTitle = _contentController.text;

    widget.note.save();

    // Go back to the previous screen and refresh the notes list
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(
        context, true); // Return true to indicate the note was updated
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              onPressed: () {
                _updateNote();
              },
              text: 'Edit Note',
              icon: const Icon(Icons.check),
            ),
            const SizedBox(height: 20),
            EditTextField(
              labelText: 'Title',
              controller: _titleController,
            ),
            const SizedBox(height: 16),
            EditTextField(
              labelText: 'Content',
              controller: _contentController,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            EditNoteColorsList(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
