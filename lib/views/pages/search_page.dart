// import 'package:ecommerce_app/utils/app_colors.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       children: [
//         SizedBox(
//           height: 8,
//         ),
//         TextField(
//           decoration: InputDecoration(
//             helperStyle: TextStyle(
//               color: AppColors.grey,
//             ),
//             labelText: 'Find your donut!',
//             prefixIcon: Icon(Icons.search_rounded),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  void _performSearch(String query) {
    // Replace this with your actual search logic
    // Here, a simple case-insensitive search is performed on a list of strings
    List<String> results = [];

    if (query.isNotEmpty) {
      results = _data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _performSearch,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter your search query',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Replace this with your actual data or fetch data from an API
List<String> _data = [
  'Rolex',
  'Omega',
  'Tag Heuer',
  'Seiko',
  'Casio',
  'Timex',
  'Citizen',
  'Fossil',
  'Bulova',
  'Patek Philippe',
  'Audemars Piguet',
  'Cartier',
  'Breitling',
  'Tissot',
  'Swatch',
  'Hamilton',
  'Michael Kors',
  'Nixon',
  'Orient',
  'Invicta',
];
