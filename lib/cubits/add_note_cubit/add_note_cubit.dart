import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:meta/meta.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note){
    
  }
}

