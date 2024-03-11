import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tt_offer/View/ChatScreens/provider_class.dart';
import 'package:tt_offer/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<NotifyProvider>(
              create: (_) => NotifyProvider()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TT Offer',
          home: SplashScreen(),
        ),
      );
    });
  }
}
