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
	private String sensorNo;
	private double smo;
	private double pm10;
	private double pm25;
	private double temp;
	private double humi;
	private double ndviHour;
	private double ndviDaily;
	private double ndviMa5;
	private double ndviNow;
	private double ndviPredict;
}