import '../domain.dart';

class GetActions {
  final DreamRepository repository;

  GetActions(this.repository);

  Future<List<Action>> call(String dreamId) async {
    return await repository.getActions(dreamId);
  }
}
