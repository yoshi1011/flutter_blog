import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/blog_screen.dart';
import 'package:flutter_blog/screens/search_screen.dart';

class BlogCard extends StatelessWidget {
  final snapshot;

  const BlogCard({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = snapshot.data();
    final id = snapshot.reference.id;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlogScreen(
            postId: id,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Text(
              data['title'],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 28),
            ),
          ),
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.network(
                data['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(data['description']),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(data['publishedAt'].toDate().toString()),
          )
        ],
      ),
    );
  }
}
