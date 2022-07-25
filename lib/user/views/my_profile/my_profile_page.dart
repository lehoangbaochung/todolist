import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app/models/app_routes.dart';
import '../../../app/models/app_localization.dart';
import '/app/utils/context_utils.dart';
import '/task/views/task_list/task_list_model.dart';
import '/user/models/user.dart';
import '/user/views/change_name/change_name_model.dart';
import '/user/views/change_password/change_password_model.dart';
import '/user/views/edit_profile/edit_profile_model.dart';
import '/user/views/my_profile/my_profile_model.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.get(43),
        ),
        actions: [
          IconButton(
            tooltip: AppLocalizations.get(31),
            icon: const Icon(Icons.logout),
            onPressed: () {
              UserProvider.signOut();
              Navigator.pushNamed(
                context,
                AppRoutes.signIn,
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => MyProfileCubit(),
        child: BlocBuilder<MyProfileCubit, MyProfileState>(
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FlutterLogo(size: 120),
                    const SizedBox(height: 8),
                    // Greeting
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppLocalizations.get(53)}, ${state.userName}!',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: context.read<MyProfileCubit>(),
                                child: ChangeNameDialog(),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                          tooltip: AppLocalizations.get(74),
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                    // Email
                    Text(
                      '${UserProvider.instance?.email}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 16),
                    // All tasks
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(54),
                        ),
                        leading: const Icon(
                          Icons.task_alt,
                          color: Colors.teal,
                        ),
                        trailing: Text(
                          '${UserProvider.getTasks().length}',
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Completed tasks
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(55),
                        ),
                        leading: const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                        trailing: Text(
                          '${UserProvider.getTasks(TaskListFilter.completed).length}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Uncompleted tasks
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(56),
                        ),
                        leading: const Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.red,
                        ),
                        trailing: Text(
                          '${UserProvider.getTasks(TaskListFilter.uncompleted).length}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Change password button
                        OutlinedButton(
                          child: Text(
                            AppLocalizations.get(57),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (_) => BlocProvider(
                                create: (_) => ChangePasswordCubit(),
                                child: ChangePasswordDialog(),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        // Edit profile button
                        ElevatedButton(
                          child: Text(
                            AppLocalizations.get(58),
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (_) => BlocProvider(
                                create: (_) => EditProfileCubit(),
                                child: const EditProfileDialog(),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        // Delete account button
                        TextButton(
                          child: Text(
                            AppLocalizations.get(59),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    AppLocalizations.get(59),
                                  ),
                                  content: Text(
                                    AppLocalizations.get(60),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.get(23),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.get(48),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.signIn,
                                        );
                                        UserProvider.signOut();
                                        context.showSnackBar(
                                          AppLocalizations.get(66),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
