import '../domain.dart';

abstract class DreamRepository {
  Future<List<Dream>> getDreams();
  Future<void> addDream(Dream dream);
  Future<void> updateDream(Dream dream);
  Future<void> deleteDream(String dreamId);
  Future<List<Action>> getActions(String dreamId);
  Future<void> addAction(Action action);
  Future<void> updateAction(Action action);
  Future<void> deleteAction(String actionId);
}
