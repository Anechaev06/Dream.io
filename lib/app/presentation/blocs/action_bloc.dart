import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  final GetActions getActions;
  final AddAction addAction;
  final UpdateAction updateAction;
  final DeleteAction deleteAction;

  ActionBloc({
    required this.getActions,
    required this.addAction,
    required this.updateAction,
    required this.deleteAction,
  }) : super(ActionInitial()) {
    on<LoadActionsEvent>((event, emit) async {
      emit(ActionLoading());
      final actions = await getActions(event.dreamId);
      emit(ActionsLoaded(actions));
    });

    on<AddActionEvent>((event, emit) async {
      await addAction(event.action);
      add(LoadActionsEvent(event.action.dreamId));
    });

    on<UpdateActionEvent>((event, emit) async {
      await updateAction(event.action);
      add(LoadActionsEvent(event.action.dreamId));
    });

    on<DeleteActionEvent>((event, emit) async {
      await deleteAction(event.actionId);
      final currentState = state;
      if (currentState is ActionsLoaded) {
        final updatedActions = currentState.actions
            .where((action) => action.id != event.actionId)
            .toList();
        emit(ActionsLoaded(updatedActions));
      }
    });
  }
}
