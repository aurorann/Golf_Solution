package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class RobotInfoDTO{
	private int robotNo;
	private int holeNoNow;
	private String courseTypeNow;
	private String robotName;
	private String robotType;
	private String robotState;
	private double lat;
	private double lon;
	private String lastUpdated;
	
	private List<SoilDataDTO> soilDataList;
	private List<RobotLogDTO> robotLogList;
	
	private RobotLogDTO robotLog;

}