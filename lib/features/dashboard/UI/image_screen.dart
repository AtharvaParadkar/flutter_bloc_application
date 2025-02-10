import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/routes/routes.dart';

import '../model/photo_api_model.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.item});

  final PhotoApiModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: item.iId!,
          transitionOnUserGestures: true,
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              RouteConstants.fullscreen,
              arguments: item,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                '${item.thumbnailUrl}',
              ),
              radius: 100,
            ),
          ),
        ),
      ),
    );
  }
}
