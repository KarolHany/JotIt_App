import 'package:flutter/material.dart';
import 'package:jotit_app/views/note_view.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'JOTIT',
      home: const NoteView(),
    );
  }
}
