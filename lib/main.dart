import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()  => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> xxx = ['X', 'X', 'O', 'X', 'O','X','X','X','O'];

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('MyApp'),

      ),
      body:
      Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          GestureDetector(
                            onTap: (){
                              print('Done!');
                            },
                            child: Container(
                              color: Colors.cyanAccent,
                              margin: EdgeInsets.all(1.0),
                            ),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[Container(
                          color: Colors.cyanAccent,
                          margin: EdgeInsets.all(1.0),
                        ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),
                          Container(
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.all(1.0),
                          ),

                        ]
                    )
                ),
              ],
            ),
          ),
        ],
      )
  );
}
