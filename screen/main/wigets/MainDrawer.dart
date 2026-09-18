import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              onTap: () {
                //navigation 1.0 방식..
                // Navigator.push(context,MaterialPageRoute(builder: (context) => MyInfoScreen()));
                //go_router
                context.push('/myinfo/10?q=flutter&page=2', extra: {
                  'item': 'hello',
                  'no': 10
                });
              }
          ),
          ListTile(
              leading: Icon(Icons.home,),
              title: Text('dio'),
              onTap: () {
                context.push('/dio');
              }
          ),
          ListTile(
              leading: Icon(Icons.home,),
              title: Text('provider'),
              onTap: () {
                context.push('/provider-home');
              }
          ),
          ListTile(
              leading: Icon(Icons.home,),
              title: Text('riverpod'),
              onTap: () {
                context.push('/riverpod-home');
              }
          ),
          ListTile(
              leading: Icon(Icons.home,),
              title: Text('bloc'),
              onTap: () {
                context.push('/bloc-home');
              }
          ),
          ListTile(
              leading: Icon(Icons.home,),
              title: Text('platform'),
              onTap: () {
                context.push('/platform');
              }
          ),
        ],
      ),
    );
  }
}