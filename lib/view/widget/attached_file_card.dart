import 'package:flutter/material.dart';
import 'dart:io';

class AttachedFileCard extends StatelessWidget {
  const AttachedFileCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border(
              top: BorderSide(color: Colors.grey[600]!),
              bottom: BorderSide(color: Colors.grey[600]!),
              left: BorderSide(color: Colors.grey[600]!),
              right: BorderSide(color: Colors.grey[600]!)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.attach_file_outlined,
              size: 20,
              color: Colors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
