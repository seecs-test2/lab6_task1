import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SavedSuggestionsScreen()),
            );
          },
          child: Text("Go to Saved Suggestions"),
        ),
      ),
    );
  }
}

class SavedSuggestionsScreen extends StatefulWidget {
  @override
  _SavedSuggestionsScreenState createState() => _SavedSuggestionsScreenState();
}

class _SavedSuggestionsScreenState extends State<SavedSuggestionsScreen> {
  List<String> savedSuggestions = [
    "Mango",
    "Apple",
    "Banana",
    "Orange",
    "Gaddapes",
    "Grapes",
    "Pineapple",
    "Papaya",
    "Watermelon",
    "Kiwi",
    "DragonFruit",
    "Jammun",
    "Loocat",
    "Pomegranate",
    "Guava",
    "Cherry",
    "Strawberry",
    "Blueberry",
    "Raspberry",
    "Blackberry",
    "Cranberry",
    "Gooseberry",
    "Apricot",
    "Peach",
    "Plum",
    "Pear",
    "Lychee",
    "Lemon",
    "Lime",
    "Coconut",
    "Pineapple",
    "Papaya"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Suggestions"),
      ),
      body: ListView.builder(
        itemCount: savedSuggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedSuggestions[index]),
            onTap: () {
              _showConfirmationDialog(savedSuggestions[index]);
            },
          );
        },
      ),
    );
  }

  Future<void> _showConfirmationDialog(String selectedItem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Item?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to remove $selectedItem from the list?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Remove the selected item from the list
                setState(() {
                  savedSuggestions.remove(selectedItem);
                });

                // Set the state of the removed item to "unselected" in the Startup Name Generator list
                // Add your logic here to update the state in the Startup Name Generator list

                // Dismiss the dialog and navigate back to the home screen
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pop(); // Pop twice to go back to the home screen
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
