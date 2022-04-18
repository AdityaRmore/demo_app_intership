import 'package:demo_app_intership/class.dart';
import 'package:demo_app_intership/task1/jsonexport.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Export extends StatefulWidget {
  const Export({Key? key}) : super(key: key);

  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  GlobalKey key = GlobalKey();
  List<String> index=[];
  String? text;
  String? date;
  String? url;
  String? role;

  @override
  void initState() {
    // TODO: implement initState
    // var exporter =
    //     key.currentWidget as DynamicWidgetJsonExportor;
    // var exportjsonstring = exporter.exportJsonString();
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(
    //         "json string was exported to editor page.")));
    // print(exportjsonstring);
    // for(int i=2;i<data.length;i++){
    //   // if(data[i].widget.compareTo(report_data[i-2])==true){}
    // }
    // data.forEach((i) {
    //   if()
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DynamicWidgetJsonExportor(
              key: key,
              child: Container(
                // height: size.height,
                width: size.width / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Report",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Title :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(child: Text(report_data["Title"])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Description :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(
                                child: Text(report_data["Description"])),
                          ),
                        ],
                      ),
                    ),
                    !report_data.containsKey("Text")? SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Text :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(child: Text(report_data["Text"])),
                          ),
                        ],
                      ),
                    ),
                    !report_data.containsKey("Link")? SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Url :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(child: Text(report_data["Link"])),
                          ),
                        ],
                      ),
                    ),
                    !report_data.containsKey("Date")? SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Date :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(child: Text(report_data["Date"])),
                          ),
                        ],
                      ),
                    ),
                    !report_data.containsKey("User")? SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width: size.width / 4,
                            child: Center(child: Text("Role :")),
                          ),
                          Container(
                            width: size.width / 2.5,
                            child: Center(child: Text(report_data["User"])),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              child: Text("Export"),
              onPressed: () {
                var exporter =
                key.currentWidget as DynamicWidgetJsonExportor;
                var exportjsonstring = exporter.exportJsonString();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "json string was exported to editor page.")));
                print(exportjsonstring);
              },
            ),
          ],
        ),
      ),
    );
  }
}
