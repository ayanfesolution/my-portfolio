import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageScreen extends StatefulHookConsumerWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: false,
        actions: [
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
