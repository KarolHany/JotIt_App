import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotit_app/constants.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  // fetch notes from hive 
  fetchAllNotes() {
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = noteBox.values.toList();
      emit(NotesSuccess(notes: notes));
    } catch (e) {
      emit(NotesFailure(errormessage: e.toString()));
    }
  }
}
