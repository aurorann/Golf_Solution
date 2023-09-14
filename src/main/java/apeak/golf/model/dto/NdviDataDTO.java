package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class NdviDataDTO {
	private int sensor_No;
	private String tm;
	private String img_Path;
	private double ndvi;
}