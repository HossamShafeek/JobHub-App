import 'package:flutter/material.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: RegisterViewBody(),
    );
  }
}
