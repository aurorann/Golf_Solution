package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class SoilDataDTO {
	private String tm;
	private int robot_No;
	private int hole_No;
	private String course_Type;
	private double lat;
	private double lon;
	private double smo;
	private double stp;
	private double sec;
}