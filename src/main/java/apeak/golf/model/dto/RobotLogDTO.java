package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RobotLogDTO {
	private int log_No;
	private String tm;
	private int robot_No;
	private String event_Comment;
}