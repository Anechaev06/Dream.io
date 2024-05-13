import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/core.dart';
import 'injection_container.dart' as di;
import 'presentation/presentation.dart';

class DreamioApp extends StatelessWidget {
  const DreamioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<DreamBloc>()..add(LoadDreamsEvent())),
        BlocProvider(create: (_) => di.sl<ActionBloc>()),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.dreamPage,
        onGenerateRoute: AppRoutes.generateRoute,
        theme: ThemeData.dark(),
      ),
    );
  }
}
