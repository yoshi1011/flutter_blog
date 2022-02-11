import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/blog_screen.dart';
import 'package:flutter_blog/screens/search_screen.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final DateTime publishedAt;

  const BlogCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BlogScreen(),
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
              title,
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
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(description),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(publishedAt.toString()),
          )
        ],
      ),
    );
  }
}
