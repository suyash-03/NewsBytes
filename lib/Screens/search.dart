import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_bytes/Screens/search_results.dart';
import 'package:page_transition/page_transition.dart';
import 'package:news_bytes/singeltons/searchkeyword.dart';
class Search extends StatefulWidget {


  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final _formKey = GlobalKey<FormState>();
  String keyword ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                child: Text('Search the Web\n'
                    'for News Articles',style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Playfair',
                ),),
              ),
              SizedBox(height: 60,),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50,0,50,0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white,
                    fontFamily: 'Montserrat',
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Keyword is empty';
                      }
                      else {
                        setState(() {
                          keyword = text;
                        });
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Keyword',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                  ),
                ),
              ),),
              SizedBox(height: 20,),
              ZoomIn(
                child: FlatButton.icon(
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        keyData.text = keyword;
                        print(keyData.text);
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: SearchResults()));
                      }
                    },
                    icon: Icon(Icons.send_rounded,color: Colors.white,),
                    label: Text("Search",style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat'
                    ),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
