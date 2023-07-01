import 'package:flutter/material.dart';
import 'package:snake_button_animation/presentation/widgets/snake_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _info,
            _buttonStyleOne,
            _buttonStyleTwo,
            _buttonStyleTree,
          ],
        ),
      )
    );
  }

  Widget get _info {
    return const Text(
      'Hello!, this is a demonstration app for the snackButton component',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15
      ),
    );
  }

  Widget get _buttonStyleOne {
    return SnakeButton(
      text: 'BUTTON SAMPLE ONE',
      color: Colors.blueAccent,
      onTap: () {},
    );
  }
  
  Widget get _buttonStyleTwo {
    return SnakeButton(
      text: 'BUTTON SAMPLE TWO',
      color: Colors.red,
      borderColor: Colors.grey,
      borderWidth: 3,
      focusLvL: 1.5,
      styleBorder: BlurStyle.solid,
      onTap: () {},
    );
  }
  
  Widget get _buttonStyleTree {
    return SnakeButton(
      onTap: () {},
      borderWidth: 5,
      text: 'BUTTON SAMPLE TREE',
      color: Colors.greenAccent,
      styleBorder: BlurStyle.normal,
      borderColor: Colors.grey,
    );
  }

}
