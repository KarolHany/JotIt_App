import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:hive/hive.dart';
import 'package:jotit_app/helper/constants.dart';

class NoteDetailsPage extends StatefulWidget {
  final NoteModel note;

  const NoteDetailsPage({super.key, required this.note});

  @override
  _NoteDetailsPageState createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
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
    final noteBox = Hive.box<NoteModel>(kNotesBox);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _updateNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                  )),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                  labelText: 'Content',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                  )),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
