import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    required this.title,
    Key? key,
    this.subtitle,
    this.description,
  }) : super(key: key);

  final String? description;
  final String? subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        type: MaterialType.card,
        child: SizedBox(
          width: 300.0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  if (description != null)
                    Text(
                      description!,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 16.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
