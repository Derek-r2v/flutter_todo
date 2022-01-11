import 'package:flutter/material.dart';
import 'data/todo.dart';

class TodoWritePage extends StatefulWidget {
  final Todo todo;

  const TodoWritePage({Key key, this.todo}) : super(key: key);

  @override
  _TodoWritePageState createState() => _TodoWritePageState();
}

class _TodoWritePageState extends State<TodoWritePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  int colorIndex = 0;
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                // Todo: 페이지 저장시 사용
                widget.todo.title = nameController.text;
                widget.todo.memo = memoController.text;

                Navigator.of(context).pop(widget.todo);
              },
              child: const Text(
                "저장",
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          switch (idx) {
            case 0:
              return Container(
                child: const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              );
            case 1:
              return Container(
                child: TextField(
                  controller: nameController,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
              );
            case 2:
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '색상',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        color: Color(widget.todo.color),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  List<Color> colors = [
                    const Color(0xFF80d3f4),
                    const Color(0xFFa794fa),
                    const Color(0xFFfb91d1),
                    const Color(0xFFfb8a94),
                    const Color(0xFFfebd9a),
                    const Color(0xFF51e29d),
                    const Color(0xFFffffff),
                  ];

                  widget.todo.color = colors[colorIndex].value;
                  colorIndex++;
                  setState(() {
                    colorIndex %= colors.length;
                  });
                },
              );
            case 3:
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '카테고리',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(widget.todo.category),
                    ],
                  ),
                ),
                onTap: () {
                  List<String> categories = ['공부', '운동', '게임'];

                  widget.todo.category = categories[categoryIndex];
                  categoryIndex++;
                  setState(() {
                    categoryIndex %= categories.length;
                  });
                },
              );
            case 4:
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: const Text(
                  '메모',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            case 5:
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 16,
                ),
                child: TextField(
                  controller: memoController,
                  minLines: 10,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              );
            default:
              return Container();
          }
        },
        itemCount: 6,
      ),
    );
  }
}
