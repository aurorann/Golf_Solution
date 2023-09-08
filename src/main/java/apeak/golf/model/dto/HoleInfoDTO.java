package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class HoleInfoDTO {
	private int holeNo;
	private String courseType;
	private int holeName;
	private double lat;
	private double lon;
	
	public List<SensorInfoDTO> sensorInfoList;
	public List<RobotInfoDTO> robotInfoList;
}