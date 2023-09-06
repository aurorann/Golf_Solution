package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RobotLogDTO {
	private int logNo;
	private String tm;
	private int robotNo;
	private String eventComment;
}