import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/firestore_methods.dart';
import 'package:flutter_blog/widgets/blog_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = useMemoized(() => FirestoreMethods().getPosts());
    final snapshot = useStream(stream);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: _buildFeedList(snapshot),
    );
  }
}

Widget _buildFeedList(snapshot) {
  if (snapshot.hasError) {
    return const Text('error');
  }
  if (snapshot.hasData && snapshot.data != null) {
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
        return BlogCard(
          snapshot: snapshot.data!.docs[index],
        );
      },
    );
  }
  return const CircularProgressIndicator();
}
