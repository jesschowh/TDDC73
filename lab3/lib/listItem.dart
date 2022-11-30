import 'package:flutter/material.dart';
import 'detailedInfo.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.repository});

  final repository;

  @override
  Widget build(BuildContext context) {
    final languages = repository['languages']['nodes'];
    List<String> languageList = [];
    for (var i = 0; i < languages.length; i++) {
      languageList.add(languages[i]['name']);
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: const Color.fromARGB(255, 238, 89, 134),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailedInfo(
                  repoName: repository['name'] ?? '',
                  description: repository['description'] ?? '',
                  createdAt: repository['createdAt'] ?? '',
                  forkCount: repository['forkCount'].toString(),
                  link: repository['url'] ?? '',
                  languages: languageList,
                  numberStars: repository['stargazerCount'].toString(),
                );
              }),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  repository['name'] ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Created at: ${repository['createdAt'].toString().substring(0, 10)}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Stars: ${repository['stargazerCount'].toString()}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
