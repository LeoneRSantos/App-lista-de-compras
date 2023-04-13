import 'package:flutter/material.dart';

enum NotesViewOptions {
  column(icon: Icon(Icons.grid_view_rounded), tooltip: 'Visualizar em grid'),
  grid(icon: Icon(Icons.view_agenda_rounded), tooltip: 'Visualizar em coluna'),
  inbox(icon: Icon(Icons.archive_rounded), tooltip: 'Itens arquivados'),
  archived(icon: Icon(Icons.inbox_rounded), tooltip: 'Lista de itens');

  const NotesViewOptions({required this.icon, required this.tooltip});

  final Icon icon;
  final String tooltip;
}
