import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';




class DropSearch extends StatelessWidget {
  final dropDownKey = GlobalKey<DropdownSearchState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('examples mode')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownSearch<String>(
                  key: dropDownKey,
                  selectedItem: "Menu",
                  items: (filter, infiniteScrollProps) =>
                  ["Menu", "Dialog", "Modal", "BottomSheet"],
                  decoratorProps: DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: 'Examples for: ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                      fit: FlexFit.loose, constraints: BoxConstraints()),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 16)),
              FilledButton(
                onPressed: () {
                  // switch (dropDownKey.currentState?.getSelectedItem) {
                  //   case 'Menu':
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => MenuExamplesPage()));
                  //     break;
                  //   case 'Modal':
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ModalsExamplesPage()));
                  //     break;
                  //   case 'BottomSheet':
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => BottomSheetExamplesPage()));
                  //     break;
                  //   case 'Dialog':
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => DialogExamplesPage()));
                  //     break;
                  // }
                },
                child: Text("Go"),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8)),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14.0, color: Colors.black),
              children: [
                TextSpan(text: 'we used '),
                TextSpan(
                    text: 'fit: FlexFit.loose',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' and '),
                TextSpan(
                    text: 'constraints: BoxConstraints() ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                    'to fit the height of menu automatically to the length of items'),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            'DropdownSearch Anatomy',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/anatomy.png',
              alignment: Alignment.topCenter, height: 1024)
        ],
      ),
    );
  }
}
