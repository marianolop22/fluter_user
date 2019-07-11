import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_user/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = new TextEditingController(
      text: _name
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: ( value ){
              _gender = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: ( value ){
              _gender = value;
              setState(() {});
            },
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
                
              },
            ),
          )
        ],
      )
    );

  }
}