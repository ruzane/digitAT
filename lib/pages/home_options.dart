import 'package:digitAT/models/user.dart';
import 'package:flutter/material.dart';

class HomeOptions extends StatefulWidget {
  
  const HomeOptions( {Key key}) : super(key: key);
 
  @override
  _HomeOptionsState createState() => _HomeOptionsState();
}
  User currentUser=new User.init().getCurrentUser();
class _HomeOptionsState extends State<HomeOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                image: DecorationImage(
                  image:AssetImage('images/image-home.jpeg'),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
                  color: Theme.of(context).accentColor.withOpacity(0.8),
                  ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0,right:50.0,left: 50.0 ),
              height: 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.10), offset: Offset(0,4), blurRadius: 10)
                ],
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                  RaisedButton(child: Text("Doctors"),
                onPressed: (){
               Navigator.of(context).pushNamed('/home',arguments: [currentUser.name,currentUser.phoneNumber]);

                },
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),
                color:Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              ),
                   RaisedButton(child: Text("PharmaHub"),
                onPressed: (){
               Navigator.of(context).pushNamed('/medecines');

                },
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),
                color:Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              )
                 ],   
              ),
                       Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                  RaisedButton(child: Text("ScaniT"),
                onPressed: (){
               Navigator.of(context).pushNamed('/home',arguments: [currentUser.name,currentUser.phoneNumber]);

                },
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              ),
                   RaisedButton(child: Text("MoneyTel"),
                onPressed: (){
               Navigator.of(context).pushNamed('/medecines');

                },
                                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              )
                 ],   
              ),
                       Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                  RaisedButton(child: Text("Hospitals"),
                onPressed: (){
               Navigator.of(context).pushNamed('/home',arguments: [currentUser.name,currentUser.phoneNumber]);

                },
                                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              ),
                   RaisedButton(child: Text("TheLab"),
                onPressed: (){
               Navigator.of(context).pushNamed('/medecines');

                },
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0)
),

                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               
              )
                 ],   
              ),
                /*      ListTile(
            leading: Image(image: AssetImage('images/nurse.png'),),
            title:Text('Doctors'),
           onTap:(){
               Navigator.of(context).pushNamed('/home',arguments: [currentUser.name,currentUser.phoneNumber]);
           }
          ),
           ListTile(
            leading: Image(image: AssetImage('images/pill.png'),),
            title:Text('PharmaHub'),
                onTap:(){
               Navigator.of(context).pushNamed('/medecines');
           }
          ),
           ListTile(
            leading: Icon(Icons.local_hospital),
            title:Text('Hospitals'),

          ),
           ListTile(
            leading: Image(image: AssetImage('images/microscope.png'),),
            title:Text('TheLab'),

          ),
           ListTile(
            leading: Icon(Icons.scanner),
            title:Text('ScaniT'),

          ),
           ListTile(
            leading: Icon(Icons.payment),
            title:Text('MoneyTel'),

          ),*/
      
        ]
        )
     
      );

  }
}