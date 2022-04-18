import 'package:demo_app_intership/task2/show.dart';
import 'package:flutter/material.dart';

class AddFields extends StatefulWidget {
  const AddFields({Key? key}) : super(key: key);

  @override
  _AddFieldsState createState() => _AddFieldsState();
}

class _AddFieldsState extends State<AddFields> {
  TextEditingController _controller = TextEditingController();
  String title = " Title";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffddccff),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                textfields(controller: _controller, title: " DD/MM/YY"),
                textfields(controller: _controller, title: " Product Name"),
                textfields(controller: _controller, title: " Brand"),
                textfields(controller: _controller, title: " Flavour"),
                textfields(controller: _controller, title: " Weight(gm)"),
                textfields(controller: _controller, title: " No. of Carton"),
                textfields(controller: _controller, title: " price per caron"),
                textfields(controller: _controller, title: " Distributer Name"),
                textfields(controller: _controller, title: " Sales person"),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ShowData()));
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class textfields extends StatelessWidget {
  const textfields({
    Key? key,
    required TextEditingController controller,
    required this.title,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: 400,
        padding: EdgeInsets.only(left: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: title,
          ),
        ),
      ),
    );
  }
}
