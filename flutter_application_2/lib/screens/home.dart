import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/thegrinch.jpg'),
                      fit: BoxFit.cover)),
            )),
            Expanded(
                child: Container(
              color: Colors.blueGrey,
              child: (Center(
                  child: Text(
                "JB's Project",
                style: Theme.of(context).textTheme.headlineLarge,
              ))),
            ))
          ],
        ),
      ),
    );
  }
}
