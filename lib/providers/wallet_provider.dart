import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'package:web3dart/web3dart.dart';

import '../Keys/keys.dart';
import '../services/wallet_service.dart';

class WalletProvider extends ChangeNotifier {
  final WalletService _walletService = WalletService();
  final Web3Client _web3client = Web3Client(rpcUrl, Client());

  double accountBalance = 0.0;
  Credentials? credentials;
  EthereumAddress? ethereumAddress;
  EtherAmount? etherAmount;
  Future getBalance() async {
    etherAmount = await _web3client
        .getBalance(EthereumAddress.fromHex(ethereumAddress!.hex));
    accountBalance =
        etherAmount!.getInWei / BigInt.parse("1000000000000000000");

    return accountBalance;
  }

  initializeWallet() async {
    credentials = await _walletService.initializeWalletAgain();
    ethereumAddress = credentials!.address;
    getBalance();

    notifyListeners();
  }

  initializeFromKey(String privateKey) {
    try {
      credentials = _walletService.initializeWallet(privateKey);
      ethereumAddress = credentials!.address;
      _walletService.setPrivateKey(privateKey);
      getBalance();
      notifyListeners();
      return true;
    } on FormatException catch (e) {
      debugPrint('Error: ${e.message}');
    } catch (e) {
      debugPrint('Error: $e');
    }

    notifyListeners();
    return false;
  }

  void createWallet() {
    credentials = _walletService.generateRandomAccount();
    ethereumAddress = credentials!.address;
    getBalance();
    notifyListeners();
  }
}
