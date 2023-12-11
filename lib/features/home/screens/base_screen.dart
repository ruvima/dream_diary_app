import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

import '../blocs/navigation/bloc.dart' as nav;

part '../widgets/bottom_navigation_bar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => nav.NavigationBloc(),
      child: const Scaffold(
        body: RouterOutlet(),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}
