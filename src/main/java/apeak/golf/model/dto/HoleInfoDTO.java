package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class HoleInfoDTO {
	private int hole_No;
	private String course_Type;
	private String hole_Name;
	private double lat;
	private double lon;
	
	public List<SensorInfoDTO> sensorInfoList;
	public List<RobotInfoDTO> robotInfoList;
	
	public RobotInfoDTO robotInfo;
	public SensorInfoDTO sensorInfo;
	public WeatherDataDTO weatherData;
	public NdviDataDTO ndviData;
	public SoilDataDTO soilData;
	
}