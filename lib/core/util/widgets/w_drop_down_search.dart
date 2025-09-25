
import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class WDropDownSearch extends StatelessWidget {
  final gKey;
  final String label;
  final String hintText;
  final List<String> list;
  final List<String> disableList;
  final Function(String?) onChanged;
  const WDropDownSearch({super.key, this.gKey, required this.label, required this.hintText, required this.list, required this.disableList, required this.onChanged, });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      enabled: true,
      key: key, // Needed for reset
      // asyncItems: (String filter) => _getAllMemberData(),
      items: (filter, y) async {
        await Future.delayed(Duration(milliseconds: 400));
        return list;
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),

      dropdownBuilder: (context, selectedItem) {
        return Text(selectedItem ?? "");
      },

      popupProps: PopupProps.menu(
        showSearchBox: true,
        disabledItemFn: (item) {
          return disableList.contains(item);
        },
        showSelectedItems: true,
        itemBuilder: (context, item, isDisabled, isSelected) {
          //to check isSelected required "showSelectedItems == true"
          // Disable specific item visually and functionally
          return ListTile(
            title: Text(
              item,
              style: TextStyle(
                color: isDisabled ? Colors.grey : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
      // always use this function it's tested
      // otherwise we get error because there are few bug here
      onChanged: onChanged,
    );
  }
}