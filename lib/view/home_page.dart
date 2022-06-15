import 'dart:math';

import 'package:api_integration/services/remote_services.dart';
import 'package:api_integration/view/read_more.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum?>? datums;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }
      getData() async {
    datums = await RemoteService().getData();
    if (datums != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        centerTitle: true,
        title: const Text(
          "NEWS",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),

        ),

      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: datums?.length,
          itemBuilder: ((context, index) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: 60,
                          alignment: AlignmentDirectional.center,
                          height: 200,
                          child: Image.network(datums![index]!.imageUrl!),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[300],
                          ),
                        ),
                        Text(
                          datums![index]!.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Text(
                          datums![index]!.content,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle:FontStyle.italic,
                          ),
                          overflow: TextOverflow.ellipsis,

                        ),
                        FlatButton(
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadMore(index, datums),
                              ),
                            );


                          },


                          child: Text(
                            'DETAIL',

                            style: TextStyle(backgroundColor: Colors.red,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}
