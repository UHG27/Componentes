import 'package:flutter/material.dart';

class IconMapping {
//definir mapa
  final _icons = const <String, IconData>{
    'add_alert': Icons.add_alert,
    'input': Icons.input,
    'folder_open': Icons.folder_open,
    'data': Icons.data_exploration,
    'list': Icons.list,
    'camara': Icons.camera,
  };

  const IconMapping();

  Icon getIcon(String iconName) {
    return Icon(
      _icons[iconName],
      color: Colors.indigoAccent,
    );
  }
}