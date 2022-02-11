import 'package:flutter/material.dart';
import 'package:flutter_blog/firestore_methods.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlogScreen extends HookConsumerWidget {
  final String postId;
  const BlogScreen({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = useMemoized(() => FirestoreMethods().getPost(postId));
    final post = useFuture(stream);

    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(post),
        centerTitle: false,
      ),
      body: _buildPost(context, post),
    );
  }
}

Widget _buildTitle(snapshot) {
  if (snapshot.hasError) {
    return const Text('error');
  }
  if (snapshot.hasData && snapshot.data != null) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return Text(data['title']);
  }
  return const CircularProgressIndicator();
}

Widget _buildPost(context, snapshot) {
  if (snapshot.hasError) {
    return const Text('error');
  }
  if (snapshot.hasData && snapshot.data != null) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return Column(
      children: [
        Container(
          child: Image(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            image: NetworkImage(data['imageUrl']),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Text(data['description']),
        )
      ],
    );
  }
  return const CircularProgressIndicator();
}
