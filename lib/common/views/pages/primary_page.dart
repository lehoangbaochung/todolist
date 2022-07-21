import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/common/exports/app_cubit.dart';
import 'package:todolist/common/exports/localization.dart';
import 'package:todolist/common/models/route_provider.dart';

import '/task/views/task_list/task_list_model.dart';

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = {
      Tab(
        text: AppLocalizations.get(
          AppLocalizations.notes,
        ),
        icon: const Icon(Icons.note_alt),
      ): Center(
        child: Text(
          AppLocalizations.get(
            AppLocalizations.empty,
          ),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      Tab(
        text: AppLocalizations.get(
          AppLocalizations.tasks,
        ),
        icon: const Icon(Icons.task),
      ): const TaskListPage(),
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
              AppLocalizations.get(AppLocalizations.appName),
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
                        AppLocalizations.get(AppLocalizations.settings),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              AppLocalizations.get(
                                AppLocalizations.theme,
                              ),
                            ),
                            trailing: DropdownButton<AppTheme>(
                              value: context.read<AppCubit>().state.theme,
                              onChanged: (theme) {
                                Navigator.pop(context);
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
                              AppLocalizations.get(
                                AppLocalizations.language,
                              ),
                            ),
                            trailing: DropdownButton<AppLocale>(
                              value: context.read<AppCubit>().state.locale,
                              onChanged: (locale) {
                                Navigator.pop(context);
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
              tooltip: AppLocalizations.get(
                AppLocalizations.settings,
              ),
              icon: const Icon(Icons.settings),
            ),
            actions: [
              IconButton(
                tooltip: AppLocalizations.get(
                  AppLocalizations.myProfile,
                ),
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
