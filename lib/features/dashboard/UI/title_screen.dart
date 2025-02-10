import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/routes/routes.dart';

import '../model/photo_api_model.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key, required this.item});

  final PhotoApiModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            RouteConstants.imageScreen,
            arguments: item,
          ),
          child: ListTile(
            title: Text('${item.title}'),
          ),
        ),
      ),
    );
  }
}
