import '../domain.dart';

class DeleteAction {
  final DreamRepository repository;

  DeleteAction(this.repository);

  Future<void> call(String actionId) async {
    await repository.deleteAction(actionId);
  }
}
