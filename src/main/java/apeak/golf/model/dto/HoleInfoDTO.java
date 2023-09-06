package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HoleInfoDTO {
	private int holeNo;
	private String courseType;
	private int holeName;
	private double lat;
	private double lon;
}