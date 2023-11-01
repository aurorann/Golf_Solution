package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LayerDataDTO {
	private int layerSeq;
	private String holeNo;
	private String courseType;
	private String tm;
	private String layerType;
	private String layerPath;
}