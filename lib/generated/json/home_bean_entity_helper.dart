import 'package:flutter_wdkid/pages/bean/home_bean_entity.dart';

homeBeanEntityFromJson(HomeBeanEntity data, Map<String, dynamic> json) {
	if (json['errcode'] != null) {
		data.errcode = json['errcode']?.toInt();
	}
	if (json['errmsg'] != null) {
		data.errmsg = json['errmsg']?.toString();
	}
	if (json['trace_id'] != null) {
		data.traceId = json['trace_id']?.toString();
	}
	if (json['words'] != null) {
		data.words = new List<HomeBeanWord>();
		(json['words'] as List).forEach((v) {
			data.words.add(new HomeBeanWord().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeBeanEntityToJson(HomeBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['errcode'] = entity.errcode;
	data['errmsg'] = entity.errmsg;
	data['trace_id'] = entity.traceId;
	if (entity.words != null) {
		data['words'] =  entity.words.map((v) => v.toJson()).toList();
	}
	return data;
}

homeBeanWordFromJson(HomeBeanWord data, Map<String, dynamic> json) {
	if (json['attendance_id'] != null) {
		data.attendanceId = json['attendance_id']?.toString();
	}
	if (json['is_sound_corrected'] != null) {
		data.isSoundCorrected = json['is_sound_corrected'];
	}
	if (json['lesson_en_title'] != null) {
		data.lessonEnTitle = json['lesson_en_title']?.toString();
	}
	if (json['lesson_img'] != null) {
		data.lessonImg = json['lesson_img']?.toString();
	}
	if (json['lesson_no'] != null) {
		data.lessonNo = json['lesson_no']?.toInt();
	}
	if (json['lesson_zh_title'] != null) {
		data.lessonZhTitle = json['lesson_zh_title']?.toString();
	}
	if (json['unit_no'] != null) {
		data.unitNo = json['unit_no']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanWordToJson(HomeBeanWord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['attendance_id'] = entity.attendanceId;
	data['is_sound_corrected'] = entity.isSoundCorrected;
	data['lesson_en_title'] = entity.lessonEnTitle;
	data['lesson_img'] = entity.lessonImg;
	data['lesson_no'] = entity.lessonNo;
	data['lesson_zh_title'] = entity.lessonZhTitle;
	data['unit_no'] = entity.unitNo;
	return data;
}