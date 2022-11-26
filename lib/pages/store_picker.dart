import 'package:brgain/models/store.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class StorePicker extends StatefulWidget {
  const StorePicker({Key? key}) : super(key: key);

  @override
  State<StorePicker> createState() => _StorePickerState();
}

class _StorePickerState extends State<StorePicker> {



  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    List<Store> storeList = data['stores'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Stores"),
        titleSpacing: 2.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: storeList.map((e) => Text(e.storeName)).toList(),
        ),
      ),
    );
  }



}
