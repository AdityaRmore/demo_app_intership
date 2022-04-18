import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart' as dsa;
import 'package:excel/excel.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                  onPressed: () {
                    createExcel2();
                  },
                  child: Text("Open")),
              ElevatedButton(
                  onPressed: () {
                    print("ssss");
                    // createExcel();
                  },
                  child: Text("View As Excel")),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> createExcel() async{
  //
  //   final dsa.Workbook workbook = dsa.Workbook();
  //   final dsa.Worksheet worksheet= workbook.worksheets[0];
  //   worksheet.getRangeByIndex(2,7).setText("Aditya More");
  //   worksheet.getRangeByIndex(1,1).setText("Aditya 1");
  //   worksheet.getRangeByIndex(2,1).setText("Aditya 2");
  //   worksheet.getRangeByIndex(3,1).setText("Aditya 3");
  //   worksheet.getRangeByIndex(4,1).setText("Aditya 4");
  //   worksheet.getRangeByIndex(5,1).setText("Aditya 5");
  //   worksheet.getRangeByIndex(6,1).setText("Aditya 6");
  //   worksheet.getRangeByIndex(7,1).setText("Aditya 7");
  //   worksheet.getRangeByIndex(8,1).setText("Aditya 8");
  //
  //
  //   final List<int> bytes= workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   final String path =(await getApplicationSupportDirectory()).path;
  //   final String fileName= '$path/Output.xlsx';
  //   final File file = File(fileName);
  //   await file.writeAsBytes(bytes,flush: true);
  //   OpenFile.open(fileName);
  //
  // }

  void createExcel2() {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['SheetName'];

    CellStyle cellStyle = CellStyle(backgroundColorHex: "#1AFF1A", fontFamily : getFontFamily(FontFamily.Calibri));

    cellStyle.underline = Underline.Single; // or Underline.Double


    var cell = sheetObject.cell(CellIndex.indexByString("A1"));
    cell.value = 8; // dynamic values support provided;
    cell.cellStyle = cellStyle;

    // printing cell-type
    print("CellType: "+ cell.cellType.toString());

    ///
    /// Inserting and removing column and rows

    // insert column at index = 8
    sheetObject.insertColumn(8);

    // insert row at index = 82
    sheetObject.removeRow(82);
  }
}
