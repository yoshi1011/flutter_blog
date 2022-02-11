import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("2021-10-11"),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Container(
              child: Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1643381437268-537f8d018c34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ),
              child: Text('dddddddddddddddddddd'),
            )
          ],
        ));
  }
}
