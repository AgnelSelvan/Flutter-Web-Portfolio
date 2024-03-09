extension Helper on List<(String, String)> {
  String getConstructor(String className) {
    return "\t\t$className({${map((e) => 'this.${e.$2}').toList().join(', ')}});\n";
  }

  String get getRawAttributes {
    String attributes = "";
    for (var element in this) {
      String type = element.$1;
      final attribute = element.$2;
      // if (element.$1 == Map<String, dynamic>) {
      //   type = attribute.capitalize();
      // }
      attributes += "\t\t$type? $attribute;\n";
    }
    return attributes;
  }

  String get getFromJson {
    String fromJson = "";
    for (var element in this) {
      final attribute = element.$2;
      final type = element.$1;
      if (type == 'int') {
        fromJson +=
            "\t\t\t\t$attribute = int.tryParse(json['$attribute'].toString());\n";
      } else if (type == 'double') {
        fromJson +=
            "\t\t\t\t$attribute = double.tryParse(json['$attribute'].toString());\n";
      } else {
        fromJson += "\t\t\t\t$attribute = json['$attribute'];\n";
      }
    }
    return fromJson;
  }

  String get getToJson {
    String toJson =
        "\t\t\t\tfinal Map<String, dynamic> data = <String, dynamic>{};\n";
    for (var element in this) {
      final attribute = element.$2;
      toJson += "\t\t\t\tdata['$attribute'] = this.$attribute;\n";
    }
    toJson += "\t\t\t\treturn data;\n";
    return toJson;
  }
}
