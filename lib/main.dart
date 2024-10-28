import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory/features/add_folders/cubit/folder_cubit.dart';
import 'package:inventory/features/add_items/widgets/add_colors_list_widget.dart';
import 'package:inventory/features/tags/cubit/tags_cubit.dart';
import 'package:inventory/network/api_request_state/api_request_state.dart';
import 'package:inventory/splash/splash_screen.dart';

import 'core/injectors/dependency_injectors.dart';
import 'features/add_items/cubits/add_item_cubit.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'global/widgets/app_text.dart';
import 'home_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FolderCubit>(create: (BuildContext context) => FolderCubit(di())),
        BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit(di())),
        BlocProvider<AddItemCubit>(create: (BuildContext context) => AddItemCubit(di())),
        BlocProvider<TagsCubit>(create: (BuildContext context) => TagsCubit(di()))
      ],
      child: MaterialApp(
          title: 'Inventory',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WelcomeScreen()),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                    'assets/inventory.jpg',
                    height: 150,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Log In",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        customTextField(hintText: 'Username', controller: bloc.userNameController, onTyped: (s) {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: customTextField(
                              hintText: 'Password', controller: bloc.passwordController, onTyped: (s) {}),
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () async {
                                if (bloc.userNameController.text.trim().isNotEmpty &&
                                    bloc.passwordController.text.trim().isNotEmpty) {
                                  BlocProvider.of<AuthCubit>(context).signIn();

                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(builder: (context) => const HomeScreen()),
                                    (route) => false,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      elevation: 10,
                                      backgroundColor: Colors.white,
                                      duration: const Duration(milliseconds: 600),
                                      content: AppText(
                                        'Please enter both username and password',
                                        style: const TextStyle().defaultTextStyle(color: Colors.teal),
                                      )));
                                }
                                /* BlocProvider.of<AuthCubit>(context).signIn();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Navigate to the main screen
                            }*/
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.orangeAccent,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: const StadiumBorder(),
                              ),
                              child: state.status is LoadingState
                                  ? const CircularProgressIndicator(strokeWidth: 1)
                                  : const Text("Sign in"),
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password? Contact to your admin',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.64),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
