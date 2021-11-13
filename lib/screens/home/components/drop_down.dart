import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/home/components/expanded_list_widget.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

List<String> _list = ['Giá: Thấp đến cao', 'Giá: Cao đến thấp'];

class _DropDownState extends State<DropDown> {
  bool isStrechedDropDown = false;
  late int groupValue;
  String title = 'Giá';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: 200,
        height: double.infinity,
        // width: getProportionateScreenWidth(150),
        // height: getProportionateScreenHeight(43),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffbbbbbb)),
                        borderRadius: BorderRadius.all(Radius.circular(27))),
                    child: Column(
                      children: [
                        Container(
                            // height: 45,
                            // width: double.infinity,
                            width: 200,
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffbbbbbb),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            constraints: BoxConstraints(
                              minHeight: 45,
                              minWidth: 200,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      title,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isStrechedDropDown =
                                            !isStrechedDropDown;
                                      });
                                    },
                                    child: Icon(isStrechedDropDown
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward))
                              ],
                            )),
                        ExpandedSection(
                          expand: isStrechedDropDown,
                          height: 100,
                          child: Text("Giá: Cao đến thấp"),
                          //   child: MyScrollbar(
                          //     builder: (context, scrollController2) =>
                          //         ListView.builder(
                          //             padding: EdgeInsets.all(0),
                          //             controller: scrollController2,
                          //             shrinkWrap: true,
                          //             itemCount: _list.length,
                          //             itemBuilder: (context, index) {
                          //               return RadioListTile(
                          //                 title: Text(_list.elementAt(index)),
                          //                   value: index,
                          //                   groupValue: groupValue,
                          //                   onChanged: (int? val) {
                          //                    setState(() {
                          //                    groupValue = val!;
                          //                    title = _list.elementAt(index);
                          //                    });
                          //                   });
                          //             }),
                          //   ),
                        )
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
