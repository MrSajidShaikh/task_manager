import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Const/colors.dart';
import '../Widgets/stream_note.dart';
import 'add_note_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tasks"),
        backgroundColor: custom_green,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.search_sharp),
          SizedBox(width: 20,)
        ],
      ),
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Add_Screen(),
            ));
          },
          backgroundColor: custom_green,
          child: const Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: Column(
            children: [
              Stream_note(false),
              const Text(
                'isDone',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Stream_note(true),
            ],
          ),
        ),
      ),
    );
  }
}
