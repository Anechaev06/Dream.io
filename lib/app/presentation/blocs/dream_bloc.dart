import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class DreamBloc extends Bloc<DreamEvent, DreamState> {
  final GetDreams getDreams;
  final AddDream addDream;
  final UpdateDream updateDream;
  final DeleteDream deleteDream;

  DreamBloc({
    required this.getDreams,
    required this.addDream,
    required this.updateDream,
    required this.deleteDream,
  }) : super(DreamInitial()) {
    on<LoadDreamsEvent>((event, emit) async {
      emit(DreamLoading());
      final dreams = await getDreams();
      emit(DreamsLoaded(dreams));
    });

    on<AddDreamEvent>((event, emit) async {
      await addDream(event.dream);
      add(LoadDreamsEvent());
    });

    on<UpdateDreamEvent>((event, emit) async {
      await updateDream(event.dream);
      add(LoadDreamsEvent());
    });

    on<DeleteDreamEvent>((event, emit) async {
      await deleteDream(event.dreamId);
      add(LoadDreamsEvent());
    });
  }
}
