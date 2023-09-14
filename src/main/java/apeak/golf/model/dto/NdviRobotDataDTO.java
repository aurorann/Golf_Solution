package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class NdviRobotDataDTO {
	private int robot_No;
	private String tm;
	private double lat;
	private double lon;
	private int hole_No;
	private String course_Type;
	private String img_Path;
	private double ndvi;
}