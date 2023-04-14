import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app.dart';
import '/configs/analytics.dart';
import '/configs/database.dart';
import '/configs/performance_monitoring.dart';
import '/configs/remote_config.dart';
import '/configs/settings.dart';
import '/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await Future.wait([
    Settings.instance.initialize(),
    Database.open(table: 'Lista de compras'),

    //Setup Remote Config & AB Tests
    RemoteConfig.instance.getConfigs(),
    RemoteConfig.instance.loadExperiments(),

    //Setup Crash & Performance Monitoring
    PerformanceMonitoring.instance.start(env: Enviroment.production),
    //Setup App Analytics
    Analytics.instance.initialize(),
  ]);

  runApp(const ProviderScope(
    child: App(),
  ));
}
