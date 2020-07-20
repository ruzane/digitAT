import 'package:digitAT/models/user.dart';
import 'package:flutter/material.dart';

class HomeOptions extends StatefulWidget {
  final String value;
  const HomeOptions( {Key key, this.value}) : super(key: key);
 
  @override
  _HomeOptionsState createState() => _HomeOptionsState();
}
  User currentUser=new User.init().getCurrentUser();
class _HomeOptionsState extends State<HomeOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
        children: <Widget>[
          ListTile(
            
            title:Text('Doctors'),
           onTap:(){
               Navigator.of(context).pushNamed('/home',arguments: [currentUser.name,currentUser.phoneNumber]);
           }
          ),
           ListTile(
            
            title:Text('PharmaHub'),
                onTap:(){
               Navigator.of(context).pushNamed('/medecines');
           }
          ),
           ListTile(
            
            title:Text('Hospitals'),

          ),
           ListTile(
            
            title:Text('TheLab'),

          ),
           ListTile(
            
            title:Text('ScaniT'),

          ),
           ListTile(
            
            title:Text('MoneyTel'),

          ),
      
        ]
        )
      )
      );

  }
}