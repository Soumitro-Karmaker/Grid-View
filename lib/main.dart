import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "GridView",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _items=List.generate(200, (index) =>{
    "id":index,
    "title": "Item $index",
    "height": Random().nextInt(120)+70
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        centerTitle: true,
      ),
      body: MasonryGridView.count(crossAxisCount: 3, mainAxisSpacing: 4,
          itemCount: _items.length,itemBuilder: (context, index){
            return Card(
              color: Color.fromARGB(
                Random().nextInt(256),
                Random().nextInt(256),
                Random().nextInt(256),
                Random().nextInt(256),
              ),
              key: ValueKey(_items[index]["id"]),
              child: SizedBox(
                height: _items[index]["height"],
                child: Center(
                  child: Text(_items[index]["title"]),
                ),
              ),
            );
          }
      ),
    );
  }
}


