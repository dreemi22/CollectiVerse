import 'package:collectiverse/screens/homescreen/components/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../Keys/keys.dart';
import '../../providers/wallet_provider.dart';

class NewWallet extends StatefulWidget {
  const NewWallet({super.key});

  @override
  State<NewWallet> createState() => NewWalletState();
}

class NewWalletState extends State<NewWallet> {
  WalletProvider walletProvider = WalletProvider();
  @override
  void initState() {
    super.initState();
    walletProvider.createWallet();
    walletFun();
  }

  void getBalance() async {}
  double ammount = 0;
  Future<void> walletFun() async {
    EtherAmount etherAmount = await Web3Client(rpcUrl, Client()).getBalance(
        EthereumAddress.fromHex(walletProvider.ethereumAddress!.hex));

    setState(() {
      ammount = etherAmount.getInEther.toDouble();
    });
    print(ammount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1579547944212-c4f4961a8dd8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3039&q=80"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Congratulations',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('Account created',
                style: TextStyle(
                  color: Colors.white.withOpacity(.5),
                  fontSize: 20,
                )),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Public address',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 20,
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(walletProvider.ethereumAddress.toString(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: walletProvider.ethereumAddress.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Copied to clipboard'),
                      ));
                    },
                    icon: Icon(
                      Icons.content_copy_rounded,
                      color: Colors.white.withOpacity(.6),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Wallet Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 20,
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Text("$ammount ETH",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                    IconButton(
                        onPressed: () {
                          walletFun();
                        },
                        icon: const Icon(
                          Icons.refresh_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text('Get some fresh matic'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen())),
                child: const Text(
                  "Skip for now!!",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    ));
  }
}
