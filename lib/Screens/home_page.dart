import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> payment() async {
    try {
      String dateandtime = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
      String dexpiredate = DateFormat("yyyyMMddHHmmss")
          .format(DateTime.now().add(Duration(days: 1)));
      String tre = "T" + dateandtime;
      String pp_Amount = "300";
      String pp_BillReference = "billRef";
      String pp_Description = "Description";
      String pp_Language = "EN";
      String pp_MerchantID = "your merchant Id";
      String pp_Password = "your Password";
      String pp_ReturnURL = "your Api Key";
      String pp_ver = "1.1";
      String pp_TxnCurrency = "PKR";
      String pp_TxnDateTime = dateandtime.toString();
      String pp_TxnExpiryDateTime = dexpiredate.toString();
      String pp_TxnRefNo = tre.toString();
      String pp_TxnType = "MWALLET";
      String ppmpf_1 = "4456733833993";
      String IntegritySalt = "your Secret Key ";
      String and = '&';
      String superdata = IntegritySalt +
          and +
          pp_Amount +
          and +
          pp_BillReference +
          and +
          pp_Description +
          and +
          pp_Language +
          and +
          pp_MerchantID +
          and +
          pp_Password +
          and +
          pp_ReturnURL +
          and +
          pp_TxnCurrency +
          and +
          pp_TxnDateTime +
          and +
          pp_TxnExpiryDateTime +
          and +
          pp_TxnRefNo +
          and +
          pp_TxnType +
          and +
          pp_ver +
          and +
          ppmpf_1;

      var key = utf8.encode(IntegritySalt);
      var bytes = utf8.encode(superdata);
      var hmacSha256 = Hmac(sha256, key);
      Digest sha256Result = hmacSha256.convert(bytes);

      var url = Uri.parse('your API Key');

      var response = await http.post(url, body: {
        "pp_Version": pp_ver,
        "pp_TxnType": pp_TxnType,
        "pp_Language": pp_Language,
        "pp_MerchantID": pp_MerchantID,
        "pp_Password": pp_Password,
        "pp_TxnRefNo": tre,
        "pp_Amount": pp_Amount,
        "pp_TxnCurrency": pp_TxnCurrency,
        "pp_TxnDateTime": dateandtime,
        "pp_BillReference": pp_BillReference,
        "pp_Description": pp_Description,
        "pp_TxnExpiryDateTime": dexpiredate,
        "pp_ReturnURL": pp_ReturnURL,
        "pp_SecureHash": sha256Result.toString(),
        "ppmpf_1": ppmpf_1
      });

      if (response.statusCode == 200) {
        print("Response: ${response.body}");
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            payment();
          },
          child: Text(
            "Pay with JazzCash",
            style: TextStyle(
              color: Color(0x024504EB),
            ),
          ),
        ),
      ),
    );
  }
}
