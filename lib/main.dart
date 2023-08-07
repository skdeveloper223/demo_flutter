import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'api_repository/loading.dart';
import 'commons/all.dart';
import 'commons/get_storage_data.dart';
import 'languages/app_localizations_delegate.dart';
import 'languages/locale_constant.dart';
import 'routes/app_pages.dart';
import 'screens/splashscreen/splash_binding.dart';
import 'screens/splashscreen/splash_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  printOkStatus('Handling a background message -----1----->>>>>${message.data}');
  printOkStatus('Handling a background message ------2---->>>>> ${message.messageId}');
}

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  // final context = SecurityContext.defaultContext;
  // context.allowLegacyUnsafeRenegotiation = true;
  //-=-=-=-=-=-=- this fir camera =-=-=-=-=-=-=-
  WidgetsFlutterBinding.ensureInitialized();

  //-=-=-=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=
  await GetStorage.init();
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      playSound: true,
      importance: Importance.high,
      showBadge: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);
  }

  var isDenied = await Permission.notification.isDenied;
  if (isDenied) {
    var status = await Permission.notification.request();
  }
  // if (Platform.isAndroid) {
  //   var autoStart = await isAutoStartAvailable;
  //   if (autoStart == false) {
  //     getAutoStartPermission();
  //   } else {
  //     printAction("permission allow......");
  //   }
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocal(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    printAction("test_newLocale: ${newLocale.languageCode} - ${newLocale.countryCode}");
    state?.setLocal(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? local;
  final notifications = FlutterLocalNotificationsPlugin();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  GetStorageData getStorage = GetStorageData();

  StreamSubscription? sub;
  var initialUriIsHandled = false.obs;

  firebaseInit() async {
    if (Platform.isIOS)
      final bool? result = await flutterLocalNotificationsPlugin
          ?.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    _firebaseMessaging.requestPermission();
    if (Platform.isIOS) iOSPermission();
    printAction("going to take token");
    _firebaseMessaging.getToken().then((value) {
      printError("then value calling");
      tokenReceived(value!);
    });
    String? t = await _firebaseMessaging.getAPNSToken();
    printAction("getAPNSToken-->${t}");
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        printOkStatus("message -- main -- initState ---------->>>>> ${message.messageType}");
      }
    });
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        // if (Platform.isIOS) {
        //   print("objectobjectobjectobjectobjectobjectobject");
        //   return;
        // }

        // printAction("test_message: ${message}");
        // printAction("test_message_message: ${message.data}");

        RemoteNotification? notification = message.notification;
        printOkStatus("notification--${notification!.title}");
        AppleNotification? ios = message.notification?.apple;
        if (/*notification != null &&*/ ios != null) {
          print('NOTIFICATION INIT IOS');
        }

        var jsonData = json.decode(message.data["data"].toString());

        if (jsonData != null && jsonData["data"] != null) {
          var data = jsonData["data"];
          print(data);
        }

        if (Platform.isAndroid) {
          // RemoteNotification? notification = message.notification;
          flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              iOS: const DarwinNotificationDetails(
                presentSound: true,
                presentBadge: true,
                presentAlert: true,
              ),
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                channelDescription: channel!.description,
                icon: 'ic_notifications',
                importance: Importance.max,
                priority: Priority.high,
                enableLights: true,
                playSound: true,
                enableVibration: true,
                channelShowBadge: true,
              ),
            ),
          );
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      printAction("test_message_message_data: ${message.data}");
      printAction("test_message_message_length: ${message.data.length}");
    });

    _firebaseMessaging.getInitialMessage();
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void tokenReceived(String pushToken) async {
    printOkStatus("main push token ---------->>>>> $pushToken");
    getStorage.saveString(getStorage.fcmToken, pushToken);
  }

  void iOSPermission() async {
    printOkStatus("<<<<<-------------- User granted permission -------------->>>>>");
    await _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
  }

  void setLocal(Locale locale) {
    setState(() {
      local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getLocale().then((locale) {
      setState(() {
        local = locale;
      });
    });
  }

  @override
  void initState() {
    changeLanguage(context, Constants.languageCodeEn);
    firebaseInit();
    super.initState();
  }

  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  @override
  Widget build(BuildContext context) {
    Loading();
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }

    // FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    Utils.screenPortrait();
    return ResponsiveSizer(
      builder: (p0, p1, p2) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.list,
        supportedLocales: const [
          Locale(Constants.languageCodeEn, ''),
          Locale(Constants.languageCodeAr, ''),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        locale: local,
        theme: ThemeData(
          primarySwatch: AppColors.primerColor,
          fontFamily: fontFamilyBold,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              // TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
            },
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors().appColor, // button text color
            ),
          ),
        ),
        initialBinding: SplashBinding(),
        home: const SplashScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
