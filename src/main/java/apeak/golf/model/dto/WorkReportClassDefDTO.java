package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkReportClassDefDTO {
	private int classId;
	private String className;
	private String description;
}