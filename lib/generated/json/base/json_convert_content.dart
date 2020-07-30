// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_wdkid/pages/bean/home_bean_entity.dart';
import 'package:flutter_wdkid/generated/json/home_bean_entity_helper.dart';
import 'package:flutter_wdkid/pages/bean/word_bean_entity.dart';
import 'package:flutter_wdkid/generated/json/word_bean_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case HomeBeanEntity:
			return homeBeanEntityFromJson(data as HomeBeanEntity, json) as T;			case HomeBeanWord:
			return homeBeanWordFromJson(data as HomeBeanWord, json) as T;			case WordBeanEntity:
			return wordBeanEntityFromJson(data as WordBeanEntity, json) as T;			case WordBeanData:
			return wordBeanDataFromJson(data as WordBeanData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case HomeBeanEntity:
			return homeBeanEntityToJson(data as HomeBeanEntity);			case HomeBeanWord:
			return homeBeanWordToJson(data as HomeBeanWord);			case WordBeanEntity:
			return wordBeanEntityToJson(data as WordBeanEntity);			case WordBeanData:
			return wordBeanDataToJson(data as WordBeanData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'HomeBeanEntity':
			return HomeBeanEntity().fromJson(json);			case 'HomeBeanWord':
			return HomeBeanWord().fromJson(json);			case 'WordBeanEntity':
			return WordBeanEntity().fromJson(json);			case 'WordBeanData':
			return WordBeanData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'HomeBeanEntity':
			return List<HomeBeanEntity>();			case 'HomeBeanWord':
			return List<HomeBeanWord>();			case 'WordBeanEntity':
			return List<WordBeanEntity>();			case 'WordBeanData':
			return List<WordBeanData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}