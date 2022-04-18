import 'dart:ui';
import 'package:demo_app_intership/MainPage.dart';
import 'package:demo_app_intership/task1/export.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../class.dart';
import 'json_retrive.dart';

class JsonExport extends StatefulWidget {
  const JsonExport({Key? key}) : super(key: key);

  @override
  _JsonExportState createState() => _JsonExportState();
}

class _JsonExportState extends State<JsonExport> {
  List<DynamicWidget> listdynamic = [];
  Map d = {};
  var items = {'Text', 'Link', 'Date', 'User'};
  GlobalKey key = GlobalKey();
  String? value;
  TextEditingController _title = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  addDynamic(String s) {
    if (listdynamic.length > 5) return;
    bool check = true;
    listdynamic.forEach((widget) {
      if (widget.s == s) check = false;
    });
    if (check) listdynamic.add(new DynamicWidget(s));
    setState(() {});
  }

  submitData() {
    report_data["Title"] = _title.text;
    report_data["Description"] = _description.text;
    listdynamic.forEach((widget) {
      report_data[widget.s] = widget.data;
    });
    setState(() {});
    print(report_data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hoo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 160,
                padding: EdgeInsets.only(left: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  hint: Text("Choose Item"),
                  isExpanded: true,
                  value: value,
                  items: items.map(buildMenu).toList(),
                  onChanged: (value) {
                    // listdynamic.clear();
                    addDynamic(value!);
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // value != null ? Text(value!) : Text(""),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: TextField(
                  controller: _title,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.person),
                    labelText: 'Title *',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: TextField(
                  controller: _description,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.description),
                    labelText: 'Description *',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // Container(
              //   width: 300,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: Colors.black, width: 2)),
              //   padding: EdgeInsets.only(left: 13),
              //   child: TextField(
              //     decoration: const InputDecoration(
              //       icon: Icon(Icons.person),
              //       labelText: 'Url',
              //     ),
              //     onChanged: (String? value) {
              //       debugPrint('Value for field  saved as ');
              //     },
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: 300,
                  child: DynamicWidgetJsonExportor(
                    key: key,
                    child: ListView.builder(
                        itemCount: listdynamic.length,
                        itemBuilder: (_, index) => listdynamic[index]),
                  ),
                ),
              ),

              // Expanded(
              //   child: DynamicWidgetJsonExportor(
              //     key: key,
              //     child: Container(
              //       child: Text("Aditya More")
              //     ),
              //   ),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Export"),
                    onPressed: () {
                      submitData();
                      // var exporter =
                      //     key.currentWidget as DynamicWidgetJsonExportor;
                      // var exportjsonstring = exporter.exportJsonString();
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //         "json string was exported to editor page.")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Export()));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainPage()));
                    },
                    child: Text("Main Page"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      listdynamic.clear();
                      setState(() {});
                    },
                    child: Text("Reset"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => JsonRetrive()));
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenu(String it) => DropdownMenuItem(
        value: it,
        child: Text(
          it,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );
}

class DynamicWidget extends StatefulWidget {
  final String s;

  DynamicWidget(this.s);

  String data = "";
  TextEditingController textEditingController = new TextEditingController();

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  var items = {'Student', 'Teacher', 'HOD', 'Worker'};
  String s1 = "";
  String date = "";
  DateTime selectedDate = DateTime.now();
  String? value;

  date12(String user) {
    widget.data = user;
  }

  @override
  void initState() {
    s1 = widget.s;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (s1 == "Link") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          padding: EdgeInsets.only(left: 13),
          child: TextField(
            controller: widget.textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.link),
              labelText: 'Url',
            ),
            onChanged: (value) {
              widget.data = value;
            },
          ),
        ),
      );
    } else if (s1 == "Date") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          width: 300,
          padding: EdgeInsets.only(left: 13),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  child: RaisedButton(
                    child: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                      // print(selectedDate.day);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (s1 == "User") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          width: 300,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          child: DropdownButton<String>(
            underline: SizedBox(),
            hint: Text("Choose Role"),
            isExpanded: true,
            value: value,
            items: items.map(buildMenu).toList(),
            onChanged: (value) {
              date12(value!);
              setState(() {
                this.value = value;
              });
            },
          ),
        ),
      );
    } else if (s1 == "Text") {
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          padding: EdgeInsets.only(left: 13),
          child: TextField(
            controller: widget.textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.text_fields),
              labelText: 'Text',
            ),
            onChanged: (value) {
              widget.data = value;
            },
          ),
        ),
      );
    }
    return SizedBox();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
    widget.data =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    // print(widget.date);
  }

  DropdownMenuItem<String> buildMenu(String it) => DropdownMenuItem(
        value: it,
        child: Text(
          it,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );
}
