import 'package:flutter/material.dart';

final kotaktext = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final label = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

final txtappbar = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
);

final dekorasiKotak = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0,2),
    ),
  ],
);