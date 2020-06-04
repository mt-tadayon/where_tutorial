import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> countries = ['France', 'Germany', 'India', 'Iran'];
  List<String> visibleCountries;

  @override
  void initState() {
    visibleCountries = countries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Array Methods: .where()'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Country Name',
              ),
              onChanged: (value) {
                visibleCountries = countries
                    .where((country) => country.contains(value))
                    .toList();
                setState(() {});
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(visibleCountries[index]),
                  );
                },
                itemCount: visibleCountries.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
