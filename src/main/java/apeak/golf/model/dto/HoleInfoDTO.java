package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class HoleInfoDTO {
	private String holeNo;
	private String courseType;
	private String holeName;
	private double lat;
	private double lon;
	private double startLat;
	private double startLon;
	private double endLat;
	private double endLon;
	
	public List<SensorInfoDTO> sensorInfoList;
	public List<RobotInfoDTO> robotInfoList;
	
	public List<LayerDataDTO> layerDataList;
	public List<SoilDataDTO> soilDataList;
	
	public RobotInfoDTO robotInfo;
	public SensorInfoDTO sensorInfo;
	public WeatherDataDTO weatherData;
	public NdviDataDTO ndviData;
	public SoilDataDTO soilData;
	
}