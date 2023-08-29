import 'package:app/bloc/auth_state.dart';
import 'package:app/widgets/image_widget.dart';
import 'package:app/widgets/text_message_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final AuthState state;

  const ResultWidget({super.key, required this.state});

  Widget _resultWidget(AuthState state) {
    final Widget widget = switch (state) {
      AuthInitState() => const SizedBox.shrink(),
      AuthorizationState() => const CircularProgressIndicator(),
      AuthorizedState() => ImageWidget(base64String: state.imageData),
      AuthErrorState() => TextMessageWidget(textMessage: state.errorMessage),
    };
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return _resultWidget(state);
  }
}
