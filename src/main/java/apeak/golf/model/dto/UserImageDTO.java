package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class UserImageDTO implements Serializable{
	private int userImgNo;
	private int userNo;
	private String userId;
	private String userImgFilePath;
	private String userImgOriName;
	private String userImgSaveName;
	
}