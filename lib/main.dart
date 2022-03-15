import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  double contentWidth  = 0.0;
  double contentHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    contentWidth  = MediaQuery.of( context ).size.width;
    contentHeight = MediaQuery.of( context ).size.height - MediaQuery.of( context ).padding.top - MediaQuery.of( context ).padding.bottom;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            child: Text(
              'ListTile',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              int? result = await showModalBottomSheet<int>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyListTile('assets/icon1.png', 'Cat', onTap: () => Navigator.of(context).pop(1)),
                      MyListTile('assets/icon4.png', 'Frog', onTap: () => Navigator.of(context).pop(2)),
                      MyListTile('assets/icon5.png', 'Dog', onTap: () => Navigator.of(context).pop(3)),
                    ],
                  );
                },
              );
              if( result == null ){
                debugPrint("cancel");
              } else {
                debugPrint("onTap $result");
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            child: Text(
              'Container',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              int? result = await showModalBottomSheet<int>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyContainer('hoge', width: contentWidth, style: TextStyle(fontSize: 20, color: Colors.red), onTap: () => Navigator.of(context).pop(1)),
                      MyContainer('hogera', width: contentWidth, style: TextStyle(fontSize: 20), onTap: () => Navigator.of(context).pop(2)),
                      MyContainer('fuga', width: contentWidth, style: TextStyle(fontSize: 20), onTap: () => Navigator.of(context).pop(3)),
                    ],
                  );
                },
              );
              if( result == null ){
                debugPrint("cancel");
              } else {
                debugPrint("onTap $result");
              }
            },
          ),
        ),
      ] ),
    );
  }
}

class MyListTile extends ListTile {
  MyListTile(String image, String text, {Key? key, void Function()? onTap}) : super(
    key: key,
    leading: SizedBox(
        width: 32,
        height: 32,
        child: Image.asset(image, fit: BoxFit.fill)
    ),
    title: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
    onTap: onTap,
  );
}

class MyContainer extends InkWell {
  MyContainer(String text, {Key? key, required double width, TextStyle? style, void Function()? onTap}) : super(
    key: key,
    child: Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        text,
        style: style,
      ),
    ),
    onTap: onTap,
  );
}
