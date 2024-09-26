import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotit_app/constants.dart';
import 'package:jotit_app/models/note_model.dart';


part 'add_note_state.dart';
// 2-create cubit
class AddNoteCubit extends Cubit<AddNoteState> { 
  AddNoteCubit() : super(AddNoteInitial());
  // 3-Add Method (create functions)
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
