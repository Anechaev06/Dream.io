import '../domain.dart';

class UpdateAction {
  final DreamRepository repository;

  UpdateAction(this.repository);

  Future<void> call(Action action) async {
    await repository.updateAction(action);
  }
}
