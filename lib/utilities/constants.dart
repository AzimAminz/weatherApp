import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'SpartanMB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
 fontFamily: 'SpartanMB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
 fontSize: 30.0,
  fontFamily: 'SpartanMB',
);

const kConditionTextStyle = TextStyle(
 fontSize: 100.0,
);

const kInputTextFieldDecoration = InputDecoration(
                    
                    icon: Icon(Icons.location_city),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter city name",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide.none,
                    ),
                    
                  );
                
