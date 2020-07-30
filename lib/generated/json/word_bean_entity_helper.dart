import 'package:flutter_wdkid/pages/bean/word_bean_entity.dart';

wordBeanEntityFromJson(WordBeanEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<WordBeanData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new WordBeanData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> wordBeanEntityToJson(WordBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

wordBeanDataFromJson(WordBeanData data, Map<String, dynamic> json) {
	if (json['tagId'] != null) {
		data.tagId = json['tagId']?.toString();
	}
	if (json['picUrl'] != null) {
		data.picUrl = json['picUrl']?.toString();
	}
	if (json['enName'] != null) {
		data.enName = json['enName']?.toString();
	}
	if (json['chName'] != null) {
		data.chName = json['chName']?.toString();
	}
	if (json['tagType'] != null) {
		data.tagType = json['tagType']?.toInt();
	}
	if (json['tagStatus'] != null) {
		data.tagStatus = json['tagStatus']?.toInt();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime']?.toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime']?.toString();
	}
	return data;
}

Map<String, dynamic> wordBeanDataToJson(WordBeanData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tagId'] = entity.tagId;
	data['picUrl'] = entity.picUrl;
	data['enName'] = entity.enName;
	data['chName'] = entity.chName;
	data['tagType'] = entity.tagType;
	data['tagStatus'] = entity.tagStatus;
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	return data;
}