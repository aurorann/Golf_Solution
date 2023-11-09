package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class UserInfoDTO implements Serializable{
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String hp;
	private String email;
	private String regiDate;
	private String lastLogin;
	private String userGrade;
	private String userDepartment;
	private String userImgFilePath;
	private String userImgOriName;
	private String userImgSaveName;
	
	private List<UserAuthDTO> userAuthList;
}