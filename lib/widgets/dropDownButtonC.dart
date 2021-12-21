import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class DropDownButtonC extends StatefulWidget {
  final List<String> items;
  final String label;
  String selectedKey;
  Function onItemSelected;

  DropDownButtonC(
      {this.items, this.label, this.selectedKey = '', this.onItemSelected});
  @override
  _DropDownButtonCState createState() => _DropDownButtonCState();
}

class _DropDownButtonCState extends State<DropDownButtonC> {
  @override
  Widget build(BuildContext context) {
    return MenuButton<String>(
      showSelectedItemOnList: true,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      popupHeight: MediaQuery.of(context).size.height / 2,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 11, top: 8, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  child: Text(widget.selectedKey,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(
                width: 12,
                height: 17,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      label: Text(
        widget.label,
        style: TextStyle(color: Colors.black54),
      ),
      labelDecoration: LabelDecoration(
        leftPosition: 8,
        background: Theme.of(context).primaryColor,
      ),
      scrollPhysics: AlwaysScrollableScrollPhysics(),
      items: widget.items,
      // _speciality.map((e) => e.title).toList(),
      itemBuilder: (String value) => Container(
        height: MediaQuery.of(context).size.height * 0.09,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).accentColor, width: 1)),
        child: SizedBox(
          // width: 93,
          height: MediaQuery.of(context).size.height * 0.09,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: Text(widget.selectedKey,
                        overflow: TextOverflow.ellipsis)),
                const SizedBox(
                  width: 12,
                  height: 17,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onItemSelected: widget.onItemSelected,
    );
  }
}
