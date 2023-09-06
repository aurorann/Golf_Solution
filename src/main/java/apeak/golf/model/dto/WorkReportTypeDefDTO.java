package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkReportTypeDefDTO {
	private int typeId;
	private String typeName;
	private String description;
}