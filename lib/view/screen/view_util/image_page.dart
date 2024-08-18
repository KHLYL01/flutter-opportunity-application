import 'package:flutter/material.dart';
import 'package:opportunity_app/core/extensions/widget_extension.dart';

import '../../../link_api.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  TransformationController viewController = TransformationController();
  var initialControllerValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: InteractiveViewer(
          transformationController: viewController,
          minScale: 0.3,
          maxScale: 8,
          onInteractionStart: (details) {
            initialControllerValue = viewController.value;
          },
          onInteractionEnd: (details) {
            viewController.value = initialControllerValue;
          },
          child:
              Image.network('${AppLink.images}/image/${widget.image}').center(),
        ),
      ),
    );
  }
}
