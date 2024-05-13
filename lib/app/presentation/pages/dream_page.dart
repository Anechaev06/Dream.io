import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class DreamPage extends StatelessWidget {
  const DreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dreams')),
      body: BlocBuilder<DreamBloc, DreamState>(
        builder: (context, state) {
          if (state is DreamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DreamsLoaded) {
            return ListView.builder(
              itemCount: state.dreams.length,
              itemBuilder: (context, index) {
                final dream = state.dreams[index];
                return Slidable(
                  key: Key(dream.id),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          // Handle edit
                        },
                        backgroundColor: Colors.blue,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          context
                              .read<DreamBloc>()
                              .add(DeleteDreamEvent(dream.id));
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: DreamItem(
                    dream: dream,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.planPage,
                        arguments: {'dreamId': dream.id},
                      );
                    },
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to add new dream
          showDialog(
            context: context,
            builder: (context) {
              String dreamTitle = '';
              String dreamDescription = '';
              return AlertDialog(
                title: const Text('Add New Dream'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        dreamTitle = value;
                      },
                      decoration:
                          const InputDecoration(hintText: "Dream Title"),
                    ),
                    TextField(
                      onChanged: (value) {
                        dreamDescription = value;
                      },
                      decoration:
                          const InputDecoration(hintText: "Dream Description"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      final newDream = Dream(
                        id: DateTime.now().toString(),
                        title: dreamTitle,
                        description: dreamDescription,
                        date: DateTime.now(),
                      );
                      context.read<DreamBloc>().add(AddDreamEvent(newDream));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
