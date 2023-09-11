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
	private String holeName;
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