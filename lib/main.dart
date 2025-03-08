import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tsv_count_app/Screens/Home_Screen.dart';
import 'package:tsv_count_app/models/counter_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  //? Initialize hive flutter
  await Hive.initFlutter();

  Hive.registerAdapter(CounterModelAdapter());
  await Hive.openBox<CounterModel>('CounterData');

  bool isDevicePreviewDebugMode = false;

  if (kDebugMode) {
    isDevicePreviewDebugMode = true;
    // isDevicePreviewDebugMode = false;
  }

  runApp(const MyApp());

  runApp(
    DevicePreview(
      enabled: isDevicePreviewDebugMode,
      // enabled: false,

      tools: const [
        ...DevicePreview.defaultTools,
        // CustomPlugin(),
      ],
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff1A1717),

          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.

          // useMaterial3: true,
          // appBarTheme: AppBarTheme(
          //   backgroundColor: Color(0xff1A1717),
          // ),
        ),
        home: HomeScreen());
  }
}
