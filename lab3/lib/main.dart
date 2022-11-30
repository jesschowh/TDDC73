import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'dropdown.dart';
import 'listItem.dart';
import 'local.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $TOKEN',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
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
  final String date = "2022-01-01";
  String selectedNumber = "5";

  final List<String> languageDropdown = [
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

  final List<String> numberResults = ["5", "10", "15", "20"];

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
        title: const Text("Trending repositories based on fork count"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Dropdown(
                drowDownList: languageDropdown,
                textHint: selectedLanguage,
                callback: (value) {
                  setState(() {
                    selectedLanguage = value;
                  });
                },
              ),
              Dropdown(
                drowDownList: numberResults,
                textHint: selectedNumber,
                callback: (value) {
                  setState(() {
                    selectedNumber = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Showing $selectedNumber results from $date - now'),
            ],
          ),
          Expanded(
            child: Query(
              options: QueryOptions(
                document: gql(
                    readRepositories), // this is the query string you just created
                variables: {
                  'nRepositories': int.parse(selectedNumber),
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
                    return ListItem(repository: repository);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
