import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/exports/app_cubit.dart';
import 'package:todolist/common/models/route_provider.dart';
import 'package:todolist/common/utils/string_utils.dart';

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
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('Settings'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text('Theme'),
                            trailing: DropdownButton<AppTheme>(
                              value: context.read<AppCubit>().state.theme,
                              onChanged: (theme) {
                                context.read<AppCubit>().onThemeChanged(theme!);
                              },
                              items: AppTheme.values
                                  .map(
                                    (theme) => DropdownMenuItem<AppTheme>(
                                      value: theme,
                                      child: Text(theme.name.toUpperCaseAt(0)),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          ListTile(
                            title: const Text('Language'),
                            trailing: DropdownButton<AppLocale>(
                              value: context.read<AppCubit>().state.locale,
                              onChanged: (locale) {
                                context
                                    .read<AppCubit>()
                                    .onLocaleChanged(locale!);
                              },
                              items: AppLocale.values
                                  .map(
                                    (locale) => DropdownMenuItem<AppLocale>(
                                      value: locale,
                                      child: Text(locale.toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              tooltip: 'Settings',
              icon: const Icon(Icons.settings),
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
