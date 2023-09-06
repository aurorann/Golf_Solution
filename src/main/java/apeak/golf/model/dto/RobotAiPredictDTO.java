package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RobotAiPredictDTO {
	private int predictNo;
	private int holeNo;
 	private String courseType;
 	private String tmFc;
 	private String tmEf;
 	private String tmEd;
 	private String predictContent;
}