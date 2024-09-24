import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotit_app/constants.dart';
import 'package:jotit_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:jotit_app/simple_bloc_observer.dart';
import 'package:jotit_app/views/note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Bloc.observer = SimpleBlocObserver(); // can hook into lifecycle events of your Blocs/Cubits
  Hive.registerAdapter(
      NoteModelAdapter()); // guide app to use hive with NoteModel (i choose the udapter that i want to hive use it in my app)
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        title: 'JOTIT',
        home: const NoteView(),
      ),
    );
  }
}
