import 'package:flutter/material.dart';

class RoomItems extends StatefulWidget {
  @override
  _RoomItemsState createState() => _RoomItemsState();
}

class _RoomItemsState extends State<RoomItems> {

  GlobalKey<AnimatedListState> _globalKey = GlobalKey();

  List<String> _data = ["0"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _listHeight(),
      child: AnimatedList(
        key: _globalKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation){
          return _buildItem(_data[index], animation);
        },
      ),
    );
  }

  Widget _buildItem(String data, Animation animation){
    var _circleRadius = 13.5;
    double _occupiedWidth = MediaQuery.of(context).size.width - (20 + (_circleRadius * 4 + 25));
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 30.0,
                  width: _occupiedWidth/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xff6a84c8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 3.5
                        )
                      ]
                  ),
                  child: Center(
                    child: Text("ROOM TYPE", style: TextStyle(color: Colors.white.withOpacity(0.5))),
                  )
              ),
              SizedBox(width: 10.0),
              Container(
                  height: 30.0,
                  width: _occupiedWidth/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xff6a84c8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Center(
                      child: Text("PRICE", style: TextStyle(color: Colors.white.withOpacity(0.5)))
                  )
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  if(_data.indexOf(data) == 0){
                    _clearText();
                  } else {
                    _removeItem(data: data);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff6a84c8),
                    radius: _circleRadius,
                    child: Icon(Icons.remove, color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: (){
                  _insertItem(data: data);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 5),
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff6a84c8),
                    radius: _circleRadius,
                    child: Icon(Icons.add, color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _listHeight(){

    double height;
    double _listSize = _data.length.toDouble();

    setState(() {
      height = 50.0 * _listSize;
    });

    return height;
  }

  void _clearText(){

  }

  void _insertItem({String data}){
    int itemInteger = int.parse(data);
    String item = (++itemInteger).toString();
    int insertIndex = int.parse(item);

    _data.insert(insertIndex, item);
    _globalKey.currentState.insertItem(insertIndex);
    _listHeight();
  }

  void _removeItem({String data}){
    int removeIndex = _data.indexOf(data);
    String removedItem = _data.removeAt(removeIndex);

    AnimatedListRemovedItemBuilder builder = (context, animation){
      return _buildItem(removedItem, animation);
    };

    _globalKey.currentState.removeItem(removeIndex, builder);
    _listHeight();
  }


}