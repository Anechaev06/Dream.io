import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/presentation.dart';
import '../../injection_container.dart' as di;

class AppRoutes {
  static const String dreamPage = '/';
  static const String planPage = '/plan';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dreamPage:
        return MaterialPageRoute(builder: (_) => const DreamPage());
      case planPage:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) =>
                    di.sl<ActionBloc>()..add(LoadActionsEvent(args['dreamId'])),
              ),
            ],
            child: PlanPage(dreamId: args['dreamId']),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
