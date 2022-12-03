import 'package:brgain/models/store.dart';
import 'package:flutter/material.dart';


class StorePicker extends StatefulWidget {
  @override
  State<StorePicker> createState() => _StorePickerState();
}

class _StorePickerState extends State<StorePicker> {
  List<Store> itemList = [];
  List<Store> selectedList = [] ;

  @override
  void initState() {
    super.initState();
    Map data =  ModalRoute.of(context)!.settings.arguments as Map;
    // itemList = data['store'];
    // selectedList = data['stores'];

  }
  @override
  Widget build(BuildContext context) {

    // Map data = ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);
    // itemList =  data['stores'];
    // // List<Store> preSelected =  data['stores'];
    // // selectedList = data['stores'];
    List<int> preSelectedIds = [1, 2 , 3];
    // selectedList = data['stores'];
    // for (Store store in data['store']) {
    //   preSelectedIds.add(store.storeId);
    // }

    return Scaffold(
      appBar: getAppBar(),
      body: GridView.builder(
        itemCount: itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GridItem(
              item: itemList[index],
              isSelected: (bool value) {
                setState(() {
                  if (value) {
                    selectedList.add(itemList[index]);
                  } else {
                    selectedList.remove(itemList[index]);
                  }
                });
                print("$index : $value");
              },
            isSel: preSelectedIds.contains(itemList[index].storeId),
               );
        }),

    );
  }


  getAppBar() {
    return AppBar(
      title: Text(selectedList.length < 1
          ? "Select Favourite Stores"
          : "${selectedList.length} item selected"),
      // actions: <Widget>[
      //   selectedList.length < 1
      //       ? Container()
      //       : InkWell(
      //       onTap: () {
      //         setState(() {
      //           for (int i = 0; i < selectedList.length; i++) {
      //             itemList.remove(selectedList[i]);
      //           }
      //           selectedList = [];
      //         });
      //       },
      //       child: const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Icon(Icons.delete),
      //       ))
      // ],
    );
  }



}


class GridItem extends StatefulWidget {
  final Store item;
  final ValueChanged<bool> isSelected ;
  final bool isSel;

  GridItem({required this.item, required this.isSelected, required this.isSel});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {


  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSel;
  }


  @override
  Widget build(BuildContext context) {
    // isSelected = widget.isSel;
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            widget.item.storeImageUrl,
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            colorBlendMode: BlendMode.color,
          ),
          isSelected
              ? const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            ),
          )
              : Container()
        ],
      ),
    );
  }
}
