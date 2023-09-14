package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RobotAiPredictDTO {
	private int predict_No;
	private int hole_No;
 	private String course_Type;
 	private String tm_Fc;
 	private String tm_Ef;
 	private String tm_Ed;
 	private String predict_Content;
}