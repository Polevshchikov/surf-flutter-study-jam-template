import 'package:flutter/material.dart';

Widget makeTestableWidget(Widget wigetForWrapping)=>
    MaterialApp(home: Scaffold(body: Stack(children:[wigetForWrapping])));