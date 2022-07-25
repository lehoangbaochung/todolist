import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/app/blocs/cubit.dart';
import 'package:todolist/app/models/app_theme.dart';
import 'package:todolist/app/models/app_localization.dart';
import 'package:todolist/app/models/app_routes.dart';

import '/task/views/task_list/task_list_model.dart';

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = {
      Tab(
        text: AppLocalizations.get(39),
        icon: const Icon(Icons.note_alt),
      ): Center(
        child: Text(
          AppLocalizations.get(63),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      Tab(
        text: AppLocalizations.get(40),
        icon: const Icon(Icons.task),
      ): BlocProvider(
        create: (_) => TaskListCubit(),
        child: const TaskListPage(),
      ),
    };
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            title: Text(
              AppLocalizations.get(0),
            ),
            bottom: TabBar(
              tabs: tabs.keys.toList(),
            ),
            leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text(
                        AppLocalizations.get(32),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              AppLocalizations.get(33),
                            ),
                            trailing: DropdownButton<AppTheme>(
                              value: context.read<AppCubit>().state.theme,
                              onChanged: (theme) {
                                context.read<AppCubit>().onThemeChanged(theme!);
                              },
                              items: AppTheme.values
                                  .map(
                                    (theme) => DropdownMenuItem<AppTheme>(
                                      value: theme,
                                      child: Text(theme.toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              AppLocalizations.get(36),
                            ),
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
              tooltip: AppLocalizations.get(32),
              icon: const Icon(Icons.settings),
            ),
            actions: [
              IconButton(
                tooltip: AppLocalizations.get(43),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.myProfile,
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
