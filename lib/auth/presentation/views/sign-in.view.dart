import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_bands_client/auth/presentation/view-models/sign-in.view-model.dart';

class SignInView extends ConsumerStatefulWidget {
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
  
    return Center(
        child: state.isLoading
            ? const LinearProgressIndicator()
            : Form(
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
                  SizedBox.fromSize(
                    size: const Size.fromHeight(20),
                  ),
                  ElevatedButton(
                      onPressed: () => ref
                          .read(signInViewModelProvider.notifier)
                          .signIn(emailController.text, passwordController.text),
                      child: const Text("Login"))
                ]),
              ));
  }
}
