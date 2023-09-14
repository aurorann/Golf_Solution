package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WeatherDataDTO {
	private String tm;
	private String sensor_No;
	private double temp;
	private double humi;
	private double wd;
	private double ws;
	private double light;
	private double rain;
	private double solar;
	
}