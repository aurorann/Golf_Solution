package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkNotificationDTO {
	private int noti_No;
	private String tm;
	private int hole_No;
	private String course_Type;
	private String noti_Title;
	private String recommend_Work;
	private String noti_State;
}