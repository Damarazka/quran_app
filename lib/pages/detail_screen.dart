import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final int id;
  const DetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text(id.toString()));
  }
}