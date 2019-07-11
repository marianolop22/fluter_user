import 'package:flutter/material.dart';
import 'package:flutter_user/src/pages/home_page.dart';
import 'package:flutter_user/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  //const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(

            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/menu-img.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
            leading: Icon (Icons.pages, color: Colors.blue),
            title: Text('Pages'),
            onTap: ()=> Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon (Icons.party_mode, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon (Icons.people, color: Colors.blue),
            title: Text('Gente'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon (Icons.settings, color: Colors.blue),
            title: Text('Ajustes'),
            onTap: (){
              //Navigator.pop(context); //esto es para cerrar el menú lateral
              Navigator.pushReplacementNamed(context, SettingPage.routeName);
            },
          )
        ],
      ),
    );
  }
}