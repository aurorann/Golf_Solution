package apeak.golf.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Getter
@Setter
@ToString
public class UserInfoDTO {
	private String user_Id;
	private String user_Pw;
	private String user_Name;
	private String hp;
	private String regi_Date;
	private String last_Login;
	
	private List<UserAuthDTO> userAuthList;
}