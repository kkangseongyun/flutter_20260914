import 'package:flutter/material.dart';

import '../../myinfo/MyInfoScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.percent, size: 40, color: Colors.blue,),
                ),
                SizedBox(height: 10,),
                Text(
                  'a@a.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,),
            title: Text('My Info'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfoScreen())),
          )
        ],
      ),
    );
  }
}