import 'package:app/bloc/auth_bloc.dart';
import 'package:app/bloc/auth_event.dart';
import 'package:app/bloc/auth_state.dart';
import 'package:app/utils/constants.dart';
import 'package:app/widgets/divider_widget.dart';
import 'package:app/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(titleApp),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
          child: BlocProvider(
            create: (context) => AuthBloc(),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final AuthBloc authBloc = context.read<AuthBloc>();
                bool isPassHidden = true;
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // LOGIN FIELD
                      TextFormField(
                        key: const Key(loginFieldKey),
                        decoration: InputDecoration(
                          labelText: userName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return enterValidLogin;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          authBloc.login = value ?? '';
                        },
                      ),
                      divider(),
                      // PASS FIELD
                      StatefulBuilder(builder: (context, setState) {
                        return TextFormField(
                          key: const Key(passFieldKey),
                          obscureText: isPassHidden,
                          decoration: InputDecoration(
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  isPassHidden = !isPassHidden;
                                });
                              },
                              child: Icon(
                                isPassHidden ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                            labelText: password,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return enterValidPassword;
                            }
                            return null;
                          },
                          onSaved: (value) {
                            authBloc.password = value ?? '';
                          },
                        );
                      }),
                      divider(),
                      // BUTTON SHOW PICTURE
                      ElevatedButton(
                        key: const Key(showPictureButtonKey),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            authBloc.add(AutorisationEvent());
                          }
                        },
                        child: Text(
                          showPicture.toUpperCase(),
                        ),
                      ),
                      divider(),
                      // RESULT WIDGET
                      ResultWidget(state: state),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
