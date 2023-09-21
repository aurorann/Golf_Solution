package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportImageDTO {
	private double img_No;
	private double work_No;
	private String file_Path;
	private String ori_Name;
	private String save_Name;
}