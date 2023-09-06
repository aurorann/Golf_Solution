package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class WorkReportImageDTO {
	private double imgNo;
	private double workNo;
	private String filePath;
	private String oriName;
	private String saveName;
}