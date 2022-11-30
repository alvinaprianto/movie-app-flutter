import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key, required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}