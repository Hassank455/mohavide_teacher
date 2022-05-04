import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customError(){
  ErrorWidget.builder =(FlutterErrorDetails error){
    return Scaffold(
      body: Center(
        child: Text('ناسف لهذا الخطا'),
      ),
    );
  };
}