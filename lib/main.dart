import 'package:flutter/material.dart';
import 'package:uplabs/dependencies.dart';
import 'package:uplabs/screens/profile.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Uplabs',
      home: ProfileScreen(
        nickname: 'ramotion',
      ),
      onGenerateRoute: router.generator,
    ),
  );
}