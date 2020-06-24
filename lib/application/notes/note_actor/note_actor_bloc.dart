import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ddd/domain/notes/i_note_repository.dart';
import 'package:ddd/domain/notes/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../domain/notes/note_failure.dart';

part 'note_actor_bloc.freezed.dart';
part 'note_actor_event.dart';
part 'note_actor_state.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(this._noteRepository);

  @override
  NoteActorState get initialState => const NoteActorState.initial();

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}
