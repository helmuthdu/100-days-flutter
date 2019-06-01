import 'package:contacts_app/app.dart';
import 'package:contacts_app/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(builder: (context) => AppState(), child: App()));
