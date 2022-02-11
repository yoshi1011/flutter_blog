import 'package:flutter/material.dart';
import 'package:flutter_blog/widgets/blog_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          BlogCard(
            title: 'test',
            imageUrl:
                'https://images.unsplash.com/photo-1643381437268-537f8d018c34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
            description: 'description',
            publishedAt: DateTime(2021),
          ),
        ],
      ),
    );
  }
}
