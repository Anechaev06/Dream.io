import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final box = await Hive.openBox('dreamBox');
  sl.registerLazySingleton(() => box);

  // Data sources
  sl.registerLazySingleton(() => DreamLocalDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<DreamRepository>(() => DreamRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDreams(sl()));
  sl.registerLazySingleton(() => AddDream(sl()));
  sl.registerLazySingleton(() => DeleteDream(sl()));
  sl.registerLazySingleton(() => UpdateDream(sl()));
  sl.registerLazySingleton(() => AddAction(sl()));
  sl.registerLazySingleton(() => DeleteAction(sl()));
  sl.registerLazySingleton(() => UpdateAction(sl()));
  sl.registerLazySingleton(() => GetActions(sl()));

  // Blocs
  sl.registerFactory(() => DreamBloc(
      getDreams: sl(), addDream: sl(), updateDream: sl(), deleteDream: sl()));
  sl.registerFactory(() => ActionBloc(
      getActions: sl(),
      addAction: sl(),
      updateAction: sl(),
      deleteAction: sl()));
}
