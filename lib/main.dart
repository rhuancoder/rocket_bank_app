import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            'Main Column - First Text',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Main Column - Second Text',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Main Column - Third Text',
            textDirection: TextDirection.ltr,
          ),
          Column(
            children: <Widget>[
              Text(
                'Secondary Column - First Text',
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ],
      ),
    );
