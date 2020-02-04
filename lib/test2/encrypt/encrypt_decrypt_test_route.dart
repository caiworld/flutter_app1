import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class EncryptDecryptTestRoute extends StatefulWidget {
  @override
  _EncryptDecryptTestRouteState createState() {
    return _EncryptDecryptTestRouteState();
  }
}

class _EncryptDecryptTestRouteState extends State<EncryptDecryptTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加解密"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _encrypt,
              child: Text("加密"),
            ),
            RaisedButton(
              onPressed: _decrypt,
              child: Text("解密"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  final cryptor = new PlatformStringCryptor();

  // 密语
  String encrypted;

  // 密钥
  String key;

  _encrypt() async {
    String password = "123456";
    String salt = await cryptor.generateSalt();
    print("salt:$salt");
    key = await cryptor.generateKeyFromPassword(password, salt);
    print("key:$key");
    // 加密
    String content = "hello";
    encrypted = await cryptor.encrypt(content, key);
    print("encrypted:$encrypted");

    // 1000次MD5加密
    var digest;
    var contentStr;
    for (int i = 0; i < 1000; i++) {
      contentStr = new Utf8Encoder().convert(content);
      digest = md5.convert(contentStr);
      content = hex.encode(digest.bytes);
    }
    print("MD5加密：" + hex.encode(digest.bytes));
    // 这里其实就是 digest.toString()
  }

  _decrypt() async {
    if (encrypted.isEmpty) {
      print("请先加密");
      return;
    }
    // 解密
    try {
      String decrypted = await cryptor.decrypt(encrypted, key);
      print("decrypted:$decrypted");
    } catch (e) {
      print(e);
    }

    String generateRandomKey = await cryptor.generateRandomKey();
    print(generateRandomKey);
  }
}
