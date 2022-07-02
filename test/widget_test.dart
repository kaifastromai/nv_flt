// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nv_flt/component.dart';
import 'package:nv_flt/entity.dart';

import 'package:nv_flt/main.dart';

void main() {
  //test ability to serialize component from json
  test('Test component deserialize', () {
    //load json file from test_comps.json
    //print current directory
    print(Directory.current.path);
    File jsonFile = File('./test/test_comps.json');
    //convert to json object
    final json = jsonDecode(jsonFile.readAsStringSync());
    var emodel = EntityModel.fromJson(jsonFile.readAsStringSync());
    print(emodel);
    expect(emodel.entityClass, "DEFAULT");
    //deserialize json into component model
    //assert that the component model is correct
  });
}
