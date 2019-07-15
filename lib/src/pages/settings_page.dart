import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user/src/shared_prefs/user_preferences.dart';
import 'package:flutter_user/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool _secondaryColor;
  int _gender;
  //String _name;

  TextEditingController _textController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    prefs.lastPage = SettingPage.routeName;

    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;

    _textController = new TextEditingController(
      text: prefs.name
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Color Secundario'),
            onChanged: ( value ){
              _secondaryColor = value;
              prefs.secondaryColor = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField (
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona'
              ),
              onChanged: ( value ) {
                prefs.name = value;
              },
            ),
          )
        ],
      )
    );

  }

  _setSelectedRadio( int value ) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }
}