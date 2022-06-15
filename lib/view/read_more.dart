import 'package:api_integration/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReadMore extends StatefulWidget {
  final int index;
  List<Datum?>? datums = [];

  ReadMore(this.index, this.datums);
  // const ReadMore({Key? key},this.index) : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Text(
          widget.datums![widget.index]!.content,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
