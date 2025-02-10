import 'package:flutter/material.dart';
import 'package:flutter_bloc_application/features/dashboard/model/photo_api_model.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key, required this.item});

  final PhotoApiModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: item.iId!,
              transitionOnUserGestures: true,
              child: Image.network(
                '${item.url}',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              // title: Text('${item.title}'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                iconSize: 30,
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
