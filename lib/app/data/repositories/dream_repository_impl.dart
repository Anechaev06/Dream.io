import '../../domain/domain.dart';
import '../data.dart';

class DreamRepositoryImpl implements DreamRepository {
  final DreamLocalDataSource localDataSource;

  DreamRepositoryImpl(this.localDataSource);

  @override
  Future<List<Dream>> getDreams() async {
    final dreamModels = await localDataSource.getDreams();
    return dreamModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addDream(Dream dream) async {
    final dreamModel = DreamModel.fromEntity(dream);
    await localDataSource.addDream(dreamModel);
  }

  @override
  Future<void> updateDream(Dream dream) async {
    final dreamModel = DreamModel.fromEntity(dream);
    await localDataSource.updateDream(dreamModel);
  }

  @override
  Future<void> deleteDream(String dreamId) async {
    await localDataSource.deleteDream(dreamId);
  }

  @override
  Future<List<Action>> getActions(String dreamId) async {
    final actionModels = await localDataSource.getActions(dreamId);
    return actionModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addAction(Action action) async {
    final actionModel = ActionModel.fromEntity(action);
    await localDataSource.addAction(actionModel);
  }

  @override
  Future<void> updateAction(Action action) async {
    final actionModel = ActionModel.fromEntity(action);
    await localDataSource.updateAction(actionModel);
  }

  @override
  Future<void> deleteAction(String actionId) async {
    await localDataSource.deleteAction(actionId);
  }
}
