package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class NdviRobotDataDTO {
	private int robotNo;
	private String tm;
	private double lat;
	private double lon;
	private int holeNo;
	private String courseType;
	private String imgPath;
	private double ndvi;
}