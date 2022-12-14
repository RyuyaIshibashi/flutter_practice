import 'package:flutter/material.dart';
import 'package:flutter_practice/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

// StatelessWidgetからStatefulWidgetに変換します
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // buildメソッドにあった変数を移動します
  final todos = List.generate(
    10,
    (index) => ToDo(title: 'ToDo ${index + 1}'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: ListView.builder(
        // ListTileからCheckboxListTileに変更します
        itemBuilder: (context, index) => CheckboxListTile(
          onChanged: (checked) {
            setState(() {
              //完了状態を反転させます
              todos[index].archived = !todos[index].archived;
            });
          },
          value: todos[index].archived,
          title: Text(todos[index].title),
        ),
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 変更します
          setState(() {
            // ToDoインスタンスを追加するように変更します
            todos.add(
              ToDo(title: "ToDo ${todos.length + 1}")
            );
          });
        },
      ),
    );
  }
}
