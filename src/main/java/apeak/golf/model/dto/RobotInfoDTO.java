package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class RobotInfoDTO {
	private int robot_No;
	private int hole_No_Now;
	private String course_Type_Now;
	private String robot_Name;
	private String robot_Type;
	private String robot_State;
	private double lat;
	private double lon;
	private String last_Updated;
	
	private List<NdviRobotDataDTO> ndviRobotDataList;
	private List<SoilDataDTO> soilDataList;
}