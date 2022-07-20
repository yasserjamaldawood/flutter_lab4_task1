import 'package:flutter/material.dart';


class Display extends StatelessWidget{

  var  content;

  Display(this.content, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(
            '$content',
              style: const TextStyle(fontSize: 60)
          ))
          ,

        ],

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pop(context);}, child: const Icon(Icons.arrow_back)),
    );
  }
}