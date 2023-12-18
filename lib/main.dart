import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FruitSortingPage(),
    );
  }
}

class FruitSortingPage extends StatefulWidget {
  @override
  _FruitSortingPageState createState() => _FruitSortingPageState();
}

class _FruitSortingPageState extends State<FruitSortingPage> {
  List<Map<String, dynamic>> fruits = [
    {'name': 'Apple', 'image': 'https://pngfre.com/wp-content/uploads/apple-98.png'},
    {'name': 'Orange', 'image': 'https://www.pngwing.com/en/free-png-bxanw'},
    {'name': 'Banana', 'image': 'https://www.freepik.com/free-photo/single-banana-isolated-white-background_47770123.htm#query=banana%20png&position=1&from_view=keyword&track=ais&uuid=f52ada5e-2980-4750-8ae1-6c6b42950d09'},
    {'name': 'Grapes', 'image': 'https://www.pngwing.com/en/free-png-bzsnb'},
    {'name': 'Pear', 'image': 'https://gallery.yopriceville.com/Free-Clipart-Pictures/Fruit-PNG/Green_Pear_PNG_Clipart'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Sorting App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'Drag (Long press) To reorder the fruits.\nClick the sort button to alphabetically sort them.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final fruit = fruits.removeAt(oldIndex);
                  fruits.insert(newIndex, fruit);
                });
              },
              children: fruits
                  .map(
                    (fruit) => ListTile(
                      key: ValueKey(fruit['name']),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(fruit['image']),
                      ),
                      title: Text(fruit['name']),
                      onTap: () {
                        print('Tapped ${fruit['name']}');
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'Click me to sort!',
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              fruits.sort((a, b) => a['name'].compareTo(b['name']));
            });
          },
          child: Icon(Icons.sort),
        ),
      ),
    );
  }
}
