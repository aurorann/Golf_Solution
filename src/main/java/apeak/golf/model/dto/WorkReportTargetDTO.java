package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportTargetDTO {
	private String targetNo;
	private double workNo;
	private int holeNo;
	private String courseType;
}