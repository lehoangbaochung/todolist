import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/models/route_provider.dart';

import '/common/exports/utils.dart';
import '/common/views/themes/theme_cubit.dart';
import '/task/views/task_list/task_list_model.dart';

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build tabs
    final Map<Tab, Widget> tabs = {
      const Tab(
        text: 'Notes',
        icon: Icon(Icons.note_alt),
      ): const Center(
        child: Text(
          'Empty',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      const Tab(
        text: 'Tasks',
        icon: Icon(Icons.task),
      ): BlocProvider(
        create: (_) => TaskListCubit(),
        child: const TaskListPage(),
      ),
    };
    // Build root
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            title: const Text('To-do list'),
            bottom: TabBar(
              tabs: tabs.keys.toList(),
            ),
            leading: IconButton(
              onPressed: () {
                final themeCubit = context.read<ThemeCubit>()..toggle();
                context.showSnackBar(
                  '${themeCubit.state.lightMode ? 'Light' : 'Dark'} mode is on.',
                );
              },
              tooltip: 'Toggle themes',
              icon: context.watch<ThemeCubit>().state.lightMode
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
            actions: [
              IconButton(
                tooltip: 'My profile',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteProvider.myProfile,
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          body: TabBarView(
            children: tabs.values.toList(),
          ),
        ),
      ),
    );
  }
}
