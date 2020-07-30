import 'package:flutter_wdkid/generated/json/base/json_convert_content.dart';

class WordBeanEntity with JsonConvert<WordBeanEntity> {
	int code;
	String message;
	List<WordBeanData> data;
}

class WordBeanData with JsonConvert<WordBeanData> {
	String tagId;
	String picUrl;
	String enName;
	String chName;
	int tagType;
	int tagStatus;
	String createTime;
	String updateTime;
}
