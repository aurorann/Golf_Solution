package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportDTO {
	private int workNo;
	private String userId;
	private String writeAt;
	private String workStart;
	private String workEnd;
	private String workClass;
	private String workType;
	private String workComment;
	private String workState;
	
	private List<WorkReportImageDTO> workReportImageList;
	private List<WorkReportTargetDTO> workReportTargetList;
}