import 'package:collectiverse/screens/homescreen/components/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../providers/wallet_provider.dart';
import '../../services/wallet_service.dart';

class AuthenticateWallet extends StatefulWidget {
  const AuthenticateWallet({super.key});

  @override
  State<AuthenticateWallet> createState() => _AuthenticateWalletState();
}

class _AuthenticateWalletState extends State<AuthenticateWallet> {
  TextEditingController keyController = TextEditingController();
  WalletService walletService = WalletService();
  bool isLoading = false;
  handleLogin() async {
    setState(() {
      isLoading = true;
    });
    bool isValid = await WalletProvider().initializeFromKey(keyController.text);

    if (isValid) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Fluttertoast.showToast(msg: "Enter a valid private key");
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1579547944212-c4f4961a8dd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3039&q=80"),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                        Text("Enter your wallet credentials.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width / 7,
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text("Don't have a wallet?",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.5),
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text("Create one",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: keyController,
                          decoration: InputDecoration(
                            hintText:
                                "39bc2eb50999a396fa6ab7ff615bef86fb4cfe9bbd5d6c42bb0668c297a2eaa6",
                            labelText: "Private key",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            child: Text("Verify"), onPressed: handleLogin),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                )));
  }
}
