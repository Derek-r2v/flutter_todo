import 'package:flutter/material.dart';
import 'package:flutter_todo/data/todo.dart';
import 'package:flutter_todo/data/util.dart';
import 'package:flutter_todo/write.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [
    Todo(
      title: '패스트캠퍼스 강의 듣기',
      memo: '앱 개발 입문 강의 듣기',
      color: Colors.redAccent.value,
      done: 0,
      category: '공부',
      date: 20220110,
    ),
    Todo(
      title: '패스트캠퍼스 강의 듣기',
      memo: '앱 개발 입문 강의 듣기',
      color: Colors.blueAccent.value,
      done: 1,
      category: '공부',
      date: 20220110,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: const Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          Todo todo = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => TodoWritePage(
                todo: Todo(
                  title: "",
                  color: 0,
                  memo: "",
                  done: 0,
                  category: "",
                  date: Utils.getFormatTime(DateTime.now()),
                ),
              ),
            ),
          );
          setState(() {
            todos.add(todo);
          });
        },
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          switch (idx) {
            case 0:
              return Container(
                child: const Text(
                  '오늘하루',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              );
            case 1:
              List<Todo> undone = todos.where((t) => t.done == 0).toList();

              return Column(
                  children: List.generate(undone.length, (_idx) {
                Todo t = undone[_idx];
                return Container(
                  decoration: BoxDecoration(
                      color: Color(
                        t.color,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            t.done == 0 ? '미완료' : '완료',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(height: 4),
                      Text(
                        t.memo,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }));
            case 2:
              return Container(
                child: const Text(
                  '완료된 하루',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              );
            case 3:
              List<Todo> done = todos.where((t) => t.done == 1).toList();

              return Column(
                  children: List.generate(done.length, (_idx) {
                Todo t = done[_idx];
                return Container(
                  decoration: BoxDecoration(
                      color: Color(
                        t.color,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            t.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            t.done == 0 ? '미완료' : '완료',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(height: 4),
                      Text(
                        t.memo,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }));
            default:
              return Container();
          }
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.today_outlined,
          ),
          label: '오늘',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_ind_outlined,
          ),
          label: '기록',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.more_horiz,
          ),
          label: '더보기',
        ),
      ]),
    );
  }
}
