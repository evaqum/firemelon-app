import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/provide.dart';
import '../application/cubit/password_manager_cubit.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  static Route route() {
    return CupertinoPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          provide((PasswordManagerCubit cubit) {
            cubit.subscribeToSavedPasswordsBox();
          }),
        ],
        child: const PasswordManagerScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('password manager'),
      ),
      body: const _PasswordManagerScreenBody(),
    );
  }
}

class _PasswordManagerScreenBody extends StatelessWidget {
  const _PasswordManagerScreenBody();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PasswordManagerCubit>();

    return BlocConsumer<PasswordManagerCubit, PasswordManagerState>(
      listenWhen: (previous, current) {
        return current.lastDeletedPassword != null && //
            previous.lastDeletedPassword != current.lastDeletedPassword;
      },
      listener: (context, state) {
        final deletedPassword = state.lastDeletedPassword!;

        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(
              content: Text('${deletedPassword.title} deleted'),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: cubit.restoreLastDeletedPassword,
              ),
            ),
          );
      },
      builder: (context, state) {
        if (state.savedPasswords.isEmpty) {
          return Center(
            child: Text(
              'no passwords saved',
              style: GoogleFonts.montserrat(
                color: Colors.black54,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: state.savedPasswords.length,
          itemBuilder: (context, index) {
            final password = state.savedPasswords[index];

            return Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (_) => cubit.deletePassword(password),
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
              key: ValueKey(password.key),
              child: ListTile(
                title: Text(password.title),
                subtitle: Text(
                  '•' * password.password.length,
                  maxLines: 1,
                ),
                trailing: IconButton(
                  onPressed: () => cubit.copyPassword(password),
                  icon: const Icon(Icons.copy),
                ),
                isThreeLine: false,
              ),
            );
          },
        );
      },
    );
  }
}
