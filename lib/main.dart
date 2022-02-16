import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main()  => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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

  bool invalid = false, ultimateWinning = false;

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
      setState(() {
        completeBlock[parent] = true;
        availableBlock[parent] = false;
      });

      player1?ultimateParentBoard[parent] = 'O':ultimateParentBoard[parent] = 'X';
      if(ifUltimateWin()){
        setState(() {
          ultimateWinning = true;
          availableBlock = [false, false, false, false, false, false, false, false, false];
        });
      }
    }

    if(ifCompleteBlock(parent)){
      setState(() => completeBlock[parent] = true);
    }

    if(!ultimateWinning) {
      setAvailable(index);
    }

  }

  void _tapping(int parent, int index){
    if(ultimateBoard[parent][index] == '')
    {
      if(availableBlock[parent]){
        makeSpot(parent,index);
      }
      else {
        setState((){
          invalid = true;
          Future.delayed(const Duration(milliseconds: 600), () {
            setState(() {
              invalid = false;
            });

          });
        });
      }
    }
    else
    {
      setState((){
        invalid = true;
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          invalid = false;
        });

      });
    }
  }

  Widget getSmallBoard(int parent){
    if(!completeBlock[parent] || ultimateParentBoard[parent] == ''){return GridView (
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: <Widget>[
          GestureDetector(
            onTap: (){
              _tapping(parent,0);
            },
            child: Container(
              color:  !availableBlock[parent]? Color(0xFFB388FF): Colors.grey[300],
              margin: availableBlock[parent]? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][0],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,1);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][1],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,2);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][2],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,3);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][3],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,4);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][4],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,5);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][5],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,6);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][6],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,7);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][7],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              _tapping(parent,8);
            },
            child: Container(
              color: !availableBlock[parent] ? Color(0xFFB388FF) : Colors.grey[300],
              margin: availableBlock[parent] ? EdgeInsets.all(1.0): EdgeInsets.all(2.0),
              child: Center(
                child: Text(ultimateBoard[parent][8],
                  style: TextStyle(fontSize: 30.0,
                    fontFamily: 'Redressed',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ]
    );}
    else{
      return Center(
        child: Text(
          ultimateParentBoard[parent],
          style: TextStyle(fontSize: 100.0,
            fontFamily: 'Redressed',
          ),
        ),
      );
    }
  }

  Widget makeContainer(int parent){
    return Container(
      margin: EdgeInsets.all(5.0),
      color:  completeBlock[parent]?
      ultimateParentBoard[parent] == ''? Colors.grey: Color(0xFFD500F9):
      availableBlock[parent]? null:Color(0xFFBE88FF),
      child: getSmallBoard(parent),
    );
  }

  Widget orInvalid(){
    if(invalid){
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('INVALID MOVE',
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'RobotoSerif',
                color: Colors.white,
              ),),
          ],
        ),
      );
    }

    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(' ',
            style: TextStyle(
              fontSize: 38.0,
              fontFamily: 'RobotoSerif',
            ),
          ),
        ],
      );
    }

  }

  Widget whoseTurn(){
    if(ultimateWinning){
      if(player1 && ultimateWinning){
        return Text('Player 2 is the Winner!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Redressed',
            color: Colors.white,
          ),
        );
      }
      else if(ultimateWinning){
        return Text('Player 1 is the winner!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Redressed',
            color: Colors.white,
          ),
        );
      }
      else{
        return Text('A draw!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Redressed',
            color: Colors.white,
          ),
        );
      }

    }

    if(player1){
      return Text('Player 1 to play',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Redressed',
          color: Colors.white,
        ),
      );
    }
    else{
      return Text('Player 2 to play',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Redressed',
          color: Colors.white,
        ),
      );

    }
  }

  void newGame(){
    setState((){
      ultimateBoard = [['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
        ['','','','','','','','',''],
      ];
      ultimateParentBoard =  ['','','','','','','','',''];
      availableBlock = [true, true, true, true, true, true, true, true, true];
      completeBlock = [false, false, false, false, false, false, false, false, false];
      invalid = false;
      ultimateWinning = false;
      player1 = true;
    });
  }

  bool ifCompleteBlock (int index){
    for(int i = 0; i < 9; i++){
      if(ultimateBoard[index][i] == '') {
        return false;
      }
    }
    return true;
  }

  bool ifSmallWin(int index){
    bool winSmallBlock = true;

    //first loop to check for the winning horizontally.
    for(int i = 0; i<9; i+=3){
      for(int j = i+1; j < i+3; j++) {
        if (ultimateBoard[index][j] != ultimateBoard[index][j - 1] || ultimateBoard[index][j - 1] == '' ||
            ultimateBoard[index][j] == '') {
          winSmallBlock = false;
          break;
        }
      }
      if(winSmallBlock) {
        return true;
      }
      else {
        winSmallBlock = true;
      }
    }

    //Second loop to check for the winning vertically.
    for(int i = 0; i<3; i++){
      for(int j = i+3; j < i+7; j+=3) {
        if (ultimateBoard[index][j] != ultimateBoard[index][j - 3] ||
            ultimateBoard[index][j - 3] == '' ||
            ultimateBoard[index][j] == '') {
          winSmallBlock = false;
          break;
        }
      }
      if(winSmallBlock) {
        return true;
      }
      else {
        winSmallBlock = true;
      }
    }

    //Third loop to check across the main diagonal.
    for(int i = 4; i < 9; i+=4) {
      if (ultimateBoard[index][i] != ultimateBoard[index][i - 4] ||
          ultimateBoard[index][i - 4] == '' || ultimateBoard[index][i] == '') {
        winSmallBlock = false;
        break;
      }
    }
    if(winSmallBlock) {
      return true;
    }
    else {
      winSmallBlock = true;
    }


    //Fourth loop to check across the secondary diagonal.
    for(int i = 4; i < 7; i+=2){
      if(ultimateBoard[index][i] != ultimateBoard[index][i-2] || ultimateBoard[index][i-2] == '' || ultimateBoard[index][2] == ''){
        winSmallBlock = false;
        break;
      }
    }

    if(winSmallBlock){
      return true;
    }

    return false;
  }

  bool ifUltimateWin(){
    bool ultimateWin = true;

    //first loop to check for the winning horizontally.
    for(int i = 0; i<9; i+=3){
      for(int j = i+1; j < i+3; j++) {
        if (ultimateParentBoard[j] != ultimateParentBoard[j - 1] ||
            ultimateParentBoard[j - 1] == '' || ultimateParentBoard[j] == '') {
          ultimateWin = false;
          break;
        }
      }
      if(ultimateWin) {
        return true;
      }
      else {
        ultimateWin = true;
      }

    }

    //Second loop to check for the winning vertically.
    for(int i = 0; i<3; i++){
      for(int j = i+3; j < i+7; j+=3) {
        if (ultimateParentBoard[j] != ultimateParentBoard[j - 3] ||
            ultimateParentBoard[j - 3] == '' || ultimateParentBoard[j] == '') {
          ultimateWin = false;
          break;
        }
      }
      if(ultimateWin) {
        return true;
      }
      else {
        ultimateWin = true;
      }
    }

    //Third loop to check across the main diagonal.
    for(int i = 4; i < 9; i+=4){
      if(ultimateParentBoard[i] != ultimateParentBoard[i-4] || ultimateParentBoard[i-4] == '' || ultimateParentBoard[i] == ''){
        ultimateWin = false;
        break;
      }
    }
    if(ultimateWin) {
      return true;
    }
    else {
      ultimateWin = true;
    }

    //Fourth loop to check across the secondary diagonal.
    for(int i = 4; i < 7; i+=2) {
      if (ultimateParentBoard[i] != ultimateParentBoard[i - 2] ||
          ultimateParentBoard[i - 2] == '' || ultimateParentBoard[i] == '') {
        ultimateWin = false;
        break;
      }
    }
    if(ultimateWin) {
      return true;
    }

    return false;
  }

  bool player1 = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        title: Text('Ultimate Game'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body:
      Column(
        children: <Widget>[
          orInvalid(),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: <Widget>[
                makeContainer(0),
                makeContainer(1),
                makeContainer(2),
                makeContainer(3),
                makeContainer(4),
                makeContainer(5),
                makeContainer(6),
                makeContainer(7),
                makeContainer(8),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          ElevatedButton(onPressed: () => newGame(),
              child: Text('New Game'),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo[300]),)),
          SizedBox(height: 20.0),
          whoseTurn(),
          SizedBox(height: 50.0),
        ],
      )
  );
}



