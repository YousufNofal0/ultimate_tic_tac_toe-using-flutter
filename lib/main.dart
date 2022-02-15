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
  List<List<String>> ultimateBoard = [['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
                                      ['','','','','','','','',''],
  ];

  List<String> ultimateParentBoard =  ['','','','','','','','',''];

  List<bool> availableBlock = [true, true, true, true, true, true, true, true, true];
  List<bool> completeBlock = [false, false, false, false, false, false, false, false, false];

  String playerWin = '';

  void setAvailable(int index){
    for(int i = 0; i < 9; i++){
      if(i==index) {
        if(completeBlock[i]) {
          setAllAvailable();
          break;
        }
        else {
          setState(() => availableBlock[i] = true);
          continue;
        }
      }
      setState(() => availableBlock[i] = false);
    }
  }

  void setAllAvailable() {
    for (int i = 0; i < 9; i++) {
      if (!completeBlock[i]) {
        setState(() => availableBlock[i] = true);
      }
    }
  }

  void makeSpot(int parent, int index){

    if(player1){
      player1 = false;
      setState(() => ultimateBoard[parent][index] = 'X');
    }

    else{
      player1 = true;
      setState(() => ultimateBoard[parent][index] = 'O');
    }

    if(ifSmallWin(parent)){
      completeBlock[parent] = true;
      player1?ultimateParentBoard[parent] = 'O':ultimateParentBoard[parent] = 'X';
      if(ifUltimateWin()){
        setState(() {
          player1?playerWin = 'Congrats player 2!':playerWin = 'Congrats player 1!';
          availableBlock = [false, false, false, false, false, false, false, false, false];
          print(playerWin);
        });
      }
    }

    if(playerWin == '')
      setAvailable(index);

  }

  bool ifSmallWin(int index){
    bool winSmallBlock = true;

    //first loop to check for the winning horizontally.
    for(int i = 0; i<9; i+=3){
      for(int j = i+1; j < i+3; j++)
        if(ultimateBoard[index][j] != ultimateBoard[index][j-1] || ultimateBoard[index][j-1] == '' || ultimateBoard[index][j] == ''){
          winSmallBlock = false;
          break;
        }
      if(winSmallBlock)
        return true;
      else
        winSmallBlock = true;
    }

    //Second loop to check for the winning vertically.
    for(int i = 0; i<3; i++){
      for(int j = i+3; j < i+7; j+=3)
        if(ultimateBoard[index][j] != ultimateBoard[index][j-3] || ultimateBoard[index][j-3] == '' || ultimateBoard[index][j] == ''){
          winSmallBlock = false;
          break;
        }
      if(winSmallBlock)
        return true;
      else
        winSmallBlock = true;
    }

    //Third loop to check across the main diagonal.
    for(int i = 4; i < 9; i+=4){
      if(ultimateBoard[index][i] != ultimateBoard[index][i-4] || ultimateBoard[index][i-4] == '' || ultimateBoard[index][i] == ''){
        winSmallBlock = false;
        break;
      }
      if(winSmallBlock)
        return true;
      else
        winSmallBlock = true;

    }

    //Fourth loop to check across the secondary diagonal.
    for(int i = 4; i < 7; i+=2){
      if(ultimateBoard[index][i] != ultimateBoard[index][i-2] || ultimateBoard[index][i-2] == '' || ultimateBoard[index][2] == ''){
        winSmallBlock = false;
        break;
      }
      if(winSmallBlock)
        return true;
      else
        winSmallBlock = true;

    }

    return false;
  }

  bool ifUltimateWin(){
    bool ultimateWin = true;

    //first loop to check for the winning horizontally.
    for(int i = 0; i<9; i+=3){
      for(int j = i+1; j < i+3; j++)
        if(ultimateParentBoard[j] != ultimateParentBoard[j-1] || ultimateParentBoard[j-1] == '' || ultimateParentBoard[j] == ''){
          ultimateWin = false;
          break;
        }
      if(ultimateWin)
        return true;
      else
        ultimateWin = true;
    }

    //Second loop to check for the winning vertically.
    for(int i = 0; i<3; i++){
      for(int j = i+3; j < i+7; j+=3)
        if(ultimateParentBoard[j] != ultimateParentBoard[j-3] || ultimateParentBoard[j-3] == '' || ultimateParentBoard[j] == ''){
          ultimateWin = false;
          break;
        }
      if(ultimateWin)
        return true;
      else
        ultimateWin = true;
    }

    //Third loop to check across the main diagonal.
    for(int i = 4; i < 9; i+=4){
      if(ultimateParentBoard[i] != ultimateParentBoard[i-4] || ultimateParentBoard[i-4] == '' || ultimateParentBoard[i] == ''){
        ultimateWin = false;
        break;
      }
      if(ultimateWin)
        return true;
      else
        ultimateWin = true;
    }

    //Fourth loop to check across the secondary diagonal.
    for(int i = 4; i < 7; i+=2){
      if(ultimateParentBoard[i] != ultimateParentBoard[i-2] || ultimateParentBoard[i-2] == '' || ultimateParentBoard[i] == ''){
        ultimateWin = false;
        break;
      }
      if(ultimateWin)
        return true;
      else
        ultimateWin = true;
    }

    return false;
  }

  bool player1 = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: Text('Ultimate Game'),
        centerTitle: true,
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
                    color: availableBlock[0]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][0] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,0);
                                }
                                else {
                                  print('Invalid');
                                }
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color:  availableBlock[0]? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[0]? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][1] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][2] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][3] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][4] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][5] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][6] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][7] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[0][8] == '')
                              {
                                if(availableBlock[0]){
                                  makeSpot(0,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[0] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[0] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[0][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: availableBlock[1]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][0] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][1] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][2] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][3] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][4] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][5] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][6] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][7] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[1][8] == '')
                              {
                                if(availableBlock[1]){
                                  makeSpot(1,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[1] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[1] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[1][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: availableBlock[2]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][0] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][1] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][2] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][3] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][4] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][5] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][6] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][7] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[2][8] == '')
                              {
                                if(availableBlock[2]){
                                  makeSpot(2,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[2] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[2] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[2][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: availableBlock[3]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][0] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][1] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][2] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][3] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][4] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][5] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][6] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][7] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[3][8] == '')
                              {
                                if(availableBlock[3]){
                                  makeSpot(3,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[3] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[3] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[3][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: availableBlock[4]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][0] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][1] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][2] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][3] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][4] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][5] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][6] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][7] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[4][8] == '')
                              {
                                if(availableBlock[4]){
                                  makeSpot(4,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[4] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[4] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[4][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: !completeBlock[5] || availableBlock[5]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][0] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][1] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][2] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][3] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][4] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][5] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][6] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][7] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[5][8] == '')
                              {
                                if(availableBlock[5]){
                                  makeSpot(5,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[5] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[5] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[5][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: !completeBlock[6] || availableBlock[6]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][0] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][1] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][2] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][3] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][4] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][5] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][6] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][7] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[6][8] == '')
                              {
                                if(availableBlock[6]){
                                  makeSpot(6,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[6] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[6] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[6][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: !completeBlock[7] || availableBlock[7]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][0] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][1] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][2] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][3] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][4] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][5] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][6] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][7] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[7][8] == '')
                              {
                                if(availableBlock[7]){
                                  makeSpot(7,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[7] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[7] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[7][8]),
                            ),
                          ),

                        ]
                    )
                ),
                Container(
                    margin: EdgeInsets.all(5.0),
                    color: !completeBlock[8] || availableBlock[8]? null: Colors.grey,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][0] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,0);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent: Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][0]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][1] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,1);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][1]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][2] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,2);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][2]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][3] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,3);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][3]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][4] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,4);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][4]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][5] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,5);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][5]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][6] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,6);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][6]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][7] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,7);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][7]),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(ultimateBoard[8][8] == '')
                              {
                                if(availableBlock[8]){
                                  makeSpot(8,8);
                                }
                                else
                                  print('Invalid');
                              }
                              else
                              {
                                print('Invalid');
                              }
                            },
                            child: Container(
                              color: availableBlock[8] ? Colors.cyanAccent : Colors.grey[300],
                              margin: availableBlock[8] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
                              child: Text(ultimateBoard[8][8]),
                            ),
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
