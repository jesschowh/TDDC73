import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedInfo extends StatelessWidget {
  const DetailedInfo({super.key, required this.repoName});

  final String repoName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(repoName),
        TextButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
