package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class SensorInfoDTO {
	private int sensorNo;
	private String sensorName;
	private String SensorType;
	private int holeNo;
	private String courseType;
	private double lat;
	private double lon;
	private String lastUpdated;
	
	public List<WeatherDataDTO> weatherDataList;
	public List<NdviDataDTO> ndviDataList;
}