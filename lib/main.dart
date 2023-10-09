import 'package:collectiverse/providers/wallet_provider.dart';
import 'package:collectiverse/screens/BottomNavBar/bottomnavbar.dart';
import 'package:collectiverse/screens/ConnectWallet/newwallet.dart';
import 'package:collectiverse/screens/homescreen/components/homescreen.dart';
import 'package:collectiverse/screens/signinscreen/signinscreen.dart';
import 'package:collectiverse/services/contract_service.dart';
import 'package:collectiverse/services/wallet_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for plugin initialization
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isLoggedin = false;

  @override
  void initState() {
    checkLogged();
    super.initState();
  }

  String privatekey = "";
  WalletService walletService = WalletService();
  checkLogged() async {
    privatekey = await walletService.getPrivateKey();
    if (privatekey != "") {
      setState(() {
        isLoggedin = true;
      });
    } else {
      setState(() {
        isLoggedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WalletService>(create: (_) => WalletService()),
        ChangeNotifierProvider<WalletProvider>(create: (_) => WalletProvider()),
        ChangeNotifierProvider<ContractService>(
            create: (_) => ContractService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoggedin ? BottomNavBar() : SigninScreen(),
      ),
    );
  }
}




/*import 'package:collectiverse/routes.dart';
import 'package:collectiverse/screens/signinscreen/signinscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await FilePicker.platform.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SigninScreen(),
      routes: routes,
      // home: DetailScreen(),
    );
  }
}
*/