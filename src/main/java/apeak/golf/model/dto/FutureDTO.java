package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class FutureDTO {
	private String tm;
	private String sensor_No;
	private double smo;
	private double pm10;
	private double pm25;
	private double temp;
	private double humi;
	private double ndvi_Hour;
	private double ndvi_Daily;
	private double ndvi_Ma5;
	private double ndvi_Now;
	private double ndvi_Predict;
}