import 'package:flutter/material.dart';
import 'package:flutter_user/src/shared_prefs/user_preferences.dart';
import 'package:flutter_user/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key key}) : super(key: key);

  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {

    prefs.lastPage = HomePage.routeName;

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario: ${prefs.secondaryColor}'),
          Divider(),
          Text('Genero: ${prefs.gender}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.name}'),
          Divider(),
          
        ],
      ),
    );

  }
}