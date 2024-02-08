import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/auth/presentation/view-models/sign-in.view-model.dart';
import 'package:material_loading_buttons/material_loading_buttons.dart';

class SignInView extends ConsumerStatefulWidget {
  static const String route = '/sign-in';

  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<void> state = ref.watch(signInViewModelProvider);

    return SizedBox.expand(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            constraints: const BoxConstraints(maxWidth: 366),
            child: 
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: 
            Text("My Local Band", style: Theme.of(context).textTheme.titleLarge),),
            Form(
              child: Column(children: [
                TextField(
                    decoration: const InputDecoration(label: Text("Email")),
                    controller: emailController),
                TextField(
                  decoration: const InputDecoration(label: Text("Password")),
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgotten password?"))),
                SizedBox.fromSize(
                  size: const Size.fromHeight(32),
                ),
                ElevatedLoadingButton(
                    isLoading: state.isLoading,
                    onPressed: _onLoginPressed,
                    loadingLabel: const Text("Logging you in..."),
                    child: const Text("Login"))
              ]),
            )
            ],)));
  }

  Future<void> _onLoginPressed() => ref
      .read(signInViewModelProvider.notifier)
      .signIn(emailController.text, passwordController.text);
}
