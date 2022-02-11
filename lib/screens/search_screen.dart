import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchInputController = useTextEditingController();
    return Container(
      child: TextField(
        controller: searchInputController,
        keyboardType: TextInputType.text,
        onChanged: (text) => print(searchInputController.text),
        decoration: const InputDecoration(labelText: 'aaa'),
      ),
    );
  }
}
