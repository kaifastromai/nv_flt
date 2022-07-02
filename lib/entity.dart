//Represents an view of an Entity.
import 'dart:convert';

import 'package:flutter/material.dart';

import 'component.dart';

class EntityComponent extends StatelessWidget {
  final String entityClass;
  final List<Widget> componentList;
  const EntityComponent({
    super.key,
    required this.entityClass,
    required this.componentList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.white10)),
        child: Column(
          children: [
            Text(entityClass),
            //add horizontal divider
            const Divider(
              color: Colors.white10,
              thickness: 1,
            ),
            //add components
            components(componentList),
          ],
        ));
  }
}

Widget components(List<Widget> components) {
  return Column(
    children: components,
  );
}

class EntityModel {
  late final String entityClass;
  late final List<ComponentModel> componentList;
  late final String id;
  EntityModel(
      {required this.entityClass,
      required this.componentList,
      required this.id});
  /*Serialize an entity from a json string. The Json will be in the format:
  {
    "id":...,
    "signature":[{
      "id":...,
      },
      {
      "id":..
      }..
    }],
    "components":[
      {
      "id":{
        "id":..
      },
      "owning_entity":1234567890...,
      "COMPONENTTYPE":{
        ...
      }
      },
      ...
      ]

    }
  }
*/

  EntityModel.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    entityClass = "DEFAULT";
    var id = map["id"];
    //ignore signature for now
    componentList = [];
    map["components"].forEach((component) {
      //check if key
      if (component.containsKey("NameComponent")) {
        componentList
            .add(NameModel.fromJson(component["NameComponent"].toString()));
      } else if (component.containsKey("StringFieldComponent")) {
        componentList.add(StringFieldModel.fromJson(
            component["StringFieldComponent"].toString()));
      } else if (component.containsKey("NumericalFieldComponent")) {
        componentList.add(NumericFieldModel.fromJson(
            component["NumericalFieldComponent"].toString()));
      }
    });
    this.id = id;
    componentList = componentList;
  }
}
