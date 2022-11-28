import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lab3/detailedInfo.dart';

import 'local.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $TOKEN',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(App(
    client: client,
  ));
}

class App extends StatelessWidget {
  const App({super.key, required this.client});

  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: 'Lab3',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "Python";
  String date = "2022-01-01";

  final List<String> language_dropdown = [
    'C',
    'C++',
    'C#',
    'CSS',
    'HTML',
    'JAVA',
    'JavaScript',
    'Kotlin',
    'PHP',
    'Python',
    'Ruby',
    'TypeScript'
  ];

  String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!, \$queryString: String!) {
    search(query: \$queryString, type: REPOSITORY, first: \$nRepositories) {
      nodes {
        ... on Repository {
          url
          description
          languages(first: 5) {
            nodes {
              name
            }
          }
          forkCount
          name
          stargazerCount
          createdAt
        }
      }
      repositoryCount
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Lab3"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Query(
              options: QueryOptions(
                document: gql(
                    readRepositories), // this is the query string you just created
                variables: {
                  'nRepositories': 15,
                  'queryString':
                      "sort:forks-desc language: $selectedLanguage created:>$date",
                },
                // pollInterval: const Duration(seconds: 10),
              ),
              // Just like in apollo refetch() could be used to manually trigger a refetch
              // while fetchMore() can be used for pagination purpose
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return const Text('Loading');
                }

                List? repositories = result.data?['search']['nodes'];

                if (repositories == null) {
                  return const Text('No repositories');
                }

                return ListView.builder(
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      final repository = repositories[index];
                      final languages = repository['languages']['nodes'];
                      List<String> languageList = [];
                      for (var i = 0; i < languages.length; i++) {
                        languageList.add(languages[i]['name']);
                      }
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Color.fromARGB(255, 180, 141, 252),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailedInfo(
                                    repoName: repository['name'] ?? '',
                                    description:
                                        repository['description'] ?? '',
                                    createdAt: repository['createdAt'] ?? '',
                                    forkCount:
                                        repository['forkCount'].toString(),
                                    link: repository['url'] ?? '',
                                    languages: languageList,
                                    numberStars:
                                        repository['stargazerCount'].toString(),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Created at: ${repository['createdAt'].toString().substring(0, 10)}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Fork counts: ${repository['forkCount'].toString()}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  Dropdown(
      {super.key,
      required this.drowDownList,
      required this.textHint,
      required this.callback});

  final List<String> drowDownList;
  final String textHint;
  final Function callback;
  String? selectedValue;

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(widget.textHint),
      icon: const Icon(Icons.keyboard_arrow_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      value: widget.selectedValue,
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.callback(value);
          widget.selectedValue = value!;
        });
      },
      items: widget.drowDownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      menuMaxHeight: 400,
    );
  }
}
