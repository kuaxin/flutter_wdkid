import 'package:flutter_wdkid/generated/json/base/json_convert_content.dart';
import 'package:flutter_wdkid/generated/json/base/json_filed.dart';

class HomeBeanEntity with JsonConvert<HomeBeanEntity> {
	int errcode;
	String errmsg;
	@JSONField(name: "trace_id")
	String traceId;
	List<HomeBeanWord> words;
}

class HomeBeanWord with JsonConvert<HomeBeanWord> {
	@JSONField(name: "attendance_id")
	String attendanceId;
	@JSONField(name: "is_sound_corrected")
	bool isSoundCorrected;
	@JSONField(name: "lesson_en_title")
	String lessonEnTitle;
	@JSONField(name: "lesson_img")
	String lessonImg;
	@JSONField(name: "lesson_no")
	int lessonNo;
	@JSONField(name: "lesson_zh_title")
	String lessonZhTitle;
	@JSONField(name: "unit_no")
	int unitNo;
}
