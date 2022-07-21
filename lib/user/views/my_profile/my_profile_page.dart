import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/exports/localization.dart';
import '/common/exports/utils.dart';
import '/common/models/route_provider.dart';
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
          AppLocalizations.get(
            AppLocalizations.myProfile,
          ),
        ),
        actions: [
          IconButton(
            tooltip: AppLocalizations.get(
              AppLocalizations.signOut,
            ),
            icon: const Icon(Icons.logout),
            onPressed: () {
              UserProvider.signOut();
              RouteProvider.show(
                context,
                RouteProvider.signIn,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${AppLocalizations.get(
                            AppLocalizations.myProfileGreeting,
                          )}, ${state.userName}!',
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
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(
                            AppLocalizations.allTask,
                          ),
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
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(
                            AppLocalizations.completedTask,
                          ),
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
                    Card(
                      child: ListTile(
                        title: Text(
                          AppLocalizations.get(
                            AppLocalizations.uncompletedTask,
                          ),
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
                        OutlinedButton(
                          child: Text(
                            AppLocalizations.get(
                              AppLocalizations.changePassword,
                            ),
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
                        ElevatedButton(
                          child: Text(
                            AppLocalizations.get(
                              AppLocalizations.editProfile,
                            ),
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
                        TextButton(
                          child: Text(
                            AppLocalizations.get(
                              AppLocalizations.deleteAccount,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    AppLocalizations.get(
                                      AppLocalizations.deleteAccount,
                                    ),
                                  ),
                                  content: Text(
                                    AppLocalizations.get(
                                      AppLocalizations.deleteAccountQuestion,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.get(
                                          AppLocalizations.cancel,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.get(
                                          AppLocalizations.delete,
                                        ),
                                      ),
                                      onPressed: () {
                                        RouteProvider.hide(context);
                                        RouteProvider.show(
                                          context,
                                          RouteProvider.signIn,
                                        );
                                        UserProvider.signOut();
                                        context.showSnackBar(
                                          AppLocalizations.get(
                                            AppLocalizations
                                                .deleteAccountSuccessfully,
                                          ),
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
