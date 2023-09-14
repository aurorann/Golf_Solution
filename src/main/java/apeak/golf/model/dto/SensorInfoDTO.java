package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class SensorInfoDTO {
	private int sensor_No;
	private String sensor_Name;
	private String Sensor_Type;
	private int hole_No;
	private String course_Type;
	private double lat;
	private double lon;
	private String last_Updated;
	
	public List<WeatherDataDTO> weatherDataList;
	public List<NdviDataDTO> ndviDataList;
}