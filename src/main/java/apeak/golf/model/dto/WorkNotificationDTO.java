package apeak.golf.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkNotificationDTO {
	private int notiNo;
	private String tm;
	private String deadlineStart;
	private String deadlineEnd;
	private String notiTitle;
	private String notiHole;
	private String notiCourse;
	private String notiClass;
	private String notiType;
	private String notiState;
	private int manageUserNo;
	private int workerUserNo;
	
	private List<UserInfoDTO> userList;
}