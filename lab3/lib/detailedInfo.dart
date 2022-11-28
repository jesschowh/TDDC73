import 'dart:io';

import 'package:flutter/material.dart';

class DetailedInfo extends StatelessWidget {
  const DetailedInfo(
      {super.key,
      required this.repoName,
      required this.description,
      required this.createdAt,
      required this.forkCount,
      required this.languages,
      required this.link,
      required this.numberStars});

  final String repoName;
  final String description;
  final String link;
  final String forkCount;
  final String numberStars;
  final String createdAt;
  final List<String> languages;

  Text setTitle(String input) {
    return Text(
      input,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Padding setText(String input) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Color.fromARGB(255, 130, 248, 148),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              setTitle(repoName),
              setText(description),
              setText(link),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  setText("Created at: ${createdAt.substring(0, 10)}"),
                  setText("Fork count: $forkCount")
                ],
              ),
              setText("Languages: "),
              Column(children: languages.map((item) => Text(item)).toList()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 238, 89, 134),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
