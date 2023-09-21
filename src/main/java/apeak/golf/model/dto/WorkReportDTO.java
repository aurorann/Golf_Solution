package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportDTO {
	private int work_No;
	private String user_Id;
	private String write_At;
	private String work_Start;
	private String work_End;
	private String work_Class;
	private String work_Type;
	private String work_Comment;
	private String work_State;
	
	private List<WorkReportImageDTO> workReportImageList;
	private List<WorkReportTargetDTO> workReportTargetList;
}