import 'package:hive/hive.dart';
import '../data.dart';

class DreamLocalDataSource {
  final Box dreamBox;

  DreamLocalDataSource(this.dreamBox);

  Future<List<DreamModel>> getDreams() async {
    return dreamBox.values.toList().cast<DreamModel>();
  }

  Future<void> addDream(DreamModel dream) async {
    await dreamBox.put(dream.id, dream);
  }

  Future<void> updateDream(DreamModel dream) async {
    await dreamBox.put(dream.id, dream);
  }

  Future<void> deleteDream(String dreamId) async {
    await dreamBox.delete(dreamId);
  }

  Future<List<ActionModel>> getActions(String dreamId) async {
    final dream = dreamBox.get(dreamId) as DreamModel?;
    return dream?.actions ?? [];
  }

  Future<void> addAction(ActionModel action) async {
    final dream = dreamBox.get(action.dreamId) as DreamModel?;
    if (dream != null) {
      dream.actions.add(action);
      await dreamBox.put(dream.id, dream);
    }
  }

  Future<void> updateAction(ActionModel action) async {
    final dream = dreamBox.get(action.dreamId) as DreamModel?;
    if (dream != null) {
      dream.actions =
          dream.actions.map((a) => a.id == action.id ? action : a).toList();
      await dreamBox.put(dream.id, dream);
    }
  }

  Future<void> deleteAction(String actionId) async {
    // Find the dream containing the action and delete it from the list
    final allDreams = dreamBox.values.toList().cast<DreamModel>();
    for (var dream in allDreams) {
      dream.actions.removeWhere((action) => action.id == actionId);
      await dreamBox.put(dream.id, dream);
    }
  }
}
