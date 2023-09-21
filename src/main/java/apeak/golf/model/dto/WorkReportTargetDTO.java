package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportTargetDTO {
	private String target_No;
	private double work_No;
	private int hole_No;
	private String course_Type;
}