import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NameComponent extends StatelessWidget {
  final NameModel nameModel;
  const NameComponent({
    Key? key,
    required this.nameModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a container with the name, and a dropdown showing the aliases
    return Container(
      child: Column(
        children: [
          Text("NAME"),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Text(nameModel.name),
        ],
      ),
    );
  }
}

class StringFieldComponent extends StatelessWidget {
  final StringFieldModel stringFieldModel;
  const StringFieldComponent({
    Key? key,
    required this.stringFieldModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return a container with the name, and a dropdown showing the aliases
    return Container(
      child: Column(
        children: [
          Text("stringField:${stringFieldModel.value}"),
        ],
      ),
    );
  }
}

abstract class ComponentModel {
  late final int ordering;
  ComponentModel.fromJson(String json);
  ComponentModel();
}

//Represents the data of a NameComponent.
class NameModel extends ComponentModel {
  late String name;
  List<String>? alias;
  NameModel({
    required this.name,
  }) {
    ordering = 0;
  }
  NameModel.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    name = data["name"];
    alias = data["alias"];
  }
}

class AgeModel extends ComponentModel {
  late int age;
  AgeModel({
    required this.age,
  }) {
    ordering = 1;
  }

  AgeModel.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    age = data["age"];
  }
}

enum Sex { male, female }

class SexModel extends ComponentModel {
  late Sex sex;
  SexModel({required this.sex}) {
    ordering = 2;
  }

  SexModel.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    sex = data['sex'];
  }
}

class StringFieldModel extends ComponentModel {
  late String name;
  late String value;
  StringFieldModel({required this.name, required this.value}) {
    ordering = 3;
  }
  StringFieldModel.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    name = data['name'];
    value = data['value'];
  }
}

class NumericFieldModel extends ComponentModel {
  late String name;
  late double value;
  NumericFieldModel({required this.name, required this.value}) {
    ordering = 3;
  }
  NumericFieldModel.fromJson(String json) {
    final Map<String, dynamic> data = jsonDecode(json);
    name = data['name'];
    value = data['value'];
  }
}
