import 'dart:convert';

import 'package:collectiverse/services/wallet_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../Keys/keys.dart';

class ContractService extends ChangeNotifier {
  String? _privateKey;

  final Web3Client _web3client = Web3Client(rpcUrl, Client());
  WalletService walletService = WalletService();
  String? _abiCode;
  EthereumAddress? _contractAddress;
  Credentials? _credentials;
  DeployedContract? _deployedContract;

  ContractFunction? storeNFT;
  ContractFunction? retrieveNFT;

  ContractService() {
    setup();
  }
  Future setup() async {
    await getData();
    await getAbi();
    getCredentials();
    getDeployedContract();
  }

  Future getData() async {
    _privateKey = await walletService.getPrivateKey();
    print("------------------");
    print(_privateKey);
    notifyListeners();
  }

  Future getAbi() async {
    String abiStringFile = await rootBundle.loadString(
        "src/abis/NFTs.json");

    final jsonAbi = jsonDecode(abiStringFile);

    _abiCode = jsonEncode(jsonAbi['abi']);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']['80001']['address']);
    print("Got the abi");
    notifyListeners();
  }

  void getCredentials() {
    print(_privateKey);
    print("-----------------------------------");
    _credentials = EthPrivateKey.fromHex(_privateKey!);
    print(_credentials!.address.toString());
    print("got the creds");
    notifyListeners();
  }

  void getDeployedContract() {
    _deployedContract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "NFTs"), _contractAddress!);

    storeNFT = _deployedContract!.function("storeNFT");
    retrieveNFT = _deployedContract!.function("retrieveNFT");

    print("Got the contract");
    notifyListeners();
  }

  Future storeFunction(String imageURL, String owner, BigInt value) async {
    print("Inside store function");
    await _web3client.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _deployedContract!,
            function: storeNFT!,
            parameters: [imageURL, owner, value]),
        chainId: chainId);

    print("Event generated");
    notifyListeners();
  }

  Future retrieveFunction(BigInt index) async {
    var events = await _web3client.call(
      contract: _deployedContract!,
      function: retrieveNFT!,
      params: [index],
    );
    notifyListeners();
    return events;
  }
}
