package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkNotificationDTO {
	private int notiNo;
	private String tm;
	private int holeNo;
	private String courseType;
	private String notiTitle;
	private String recommendWork;
	private String notiState;
}