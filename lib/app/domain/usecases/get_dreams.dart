import '../domain.dart';

class GetDreams {
  final DreamRepository repository;

  GetDreams(this.repository);

  Future<List<Dream>> call() async {
    return await repository.getDreams();
  }
}
