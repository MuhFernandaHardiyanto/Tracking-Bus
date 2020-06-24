import 'package:flutter/material.dart';

class Beranda1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState()
  {
    return _Beranda1State();
  } 
  // _Beranda1State createState() => _Beranda1State();
}

class _Beranda1State extends State<Beranda1> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:1,
        title: Text('Bottom App'),
      ),
      bottomNavigationBar: BottomNavyBar(),
    );
  }
}

class BottomNavyBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState()
  {
    return _BottomNavyBarState();
  } 
  // _BottomNavyBarState createState() => _BottomNavyBarState();
}

class _BottomNavyBarState extends State<BottomNavyBar> {

  int selectedIndex = 0;
  Color backgroundColor = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.location_on), Text('Maps', style: TextStyle(color: Colors.red)), Colors.red[400]),
    NavigationItem(Icon(Icons.departure_board), Text('Schedule'), Colors.purple),
    NavigationItem(Icon(Icons.face), Text('Profile'), Colors.green),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected){
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: double.maxFinite,
        width: isSelected ? 125 : 50 ,
        padding: isSelected ?
        EdgeInsets.only(left: 16, right: 16)
        : EdgeInsets.only(left: 8, right: 8),
        decoration: isSelected ? BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(Radius.circular(10))
          // shape: 
        ) : null,
        child: ListView(
          
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              IconTheme(
              data: IconThemeData(
                size: 26,
                color: isSelected ? backgroundColor : Colors.black
              ),
              child: item.icon,
            ), Padding(
              padding: const EdgeInsets.only(left: 8),
              child: isSelected ? 
              DefaultTextStyle.merge(
                style: TextStyle(
                  color: backgroundColor
                ),
                child: item.title
              )
               : Container(),
            )
            ],)
          ],
        ),
      );
    }
  
    @override
    Widget build(BuildContext context) {
      return Container(
        // color: Colors.amber,
        height: 56,
        padding: EdgeInsets.all(7),
        // padding: EdgeInsets.only(left:8, top:4, bottom:4, right:8),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow:[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5
            )
          ]
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item){
            var itemIndex = items.indexOf(item);

            return GestureDetector(
              onTap:(){
                setState(() {
                  selectedIndex = itemIndex;
                });
              },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList(),
        ),
      );
    }
  }
  
  class NavigationItem {
    final Icon icon;
    final Text title;
    final Color color;

  NavigationItem(this.icon, this.title, this.color);
}